package top.casso.cas.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jasig.cas.authentication.handler.DefaultPasswordEncoder;
import org.jasig.cas.authentication.handler.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.casso.cas.exception.UserException;
import top.casso.cas.model.RandomParam;
import top.casso.cas.model.User;
import top.casso.cas.service.IUserService;
import top.casso.cas.util.StringUtil;

import com.alibaba.fastjson.util.Base64;

@Controller
@RequestMapping("/findPwd")
public class FindPwdController {
	
	@Autowired
	private IUserService userService;
	
	private static PasswordEncoder passwordEncoder = new DefaultPasswordEncoder("SHA-256");
	
	@RequestMapping("/index")
	public String findPwd() {
		return "findPwd";
	}
	
	@ResponseBody
	@RequestMapping("/getSMS")
	public Map<String,Object> getSMS(User user, HttpSession session) {
		if(user == null || StringUtil.isNoE(user.getUserName()) || StringUtil.isNoE(user.getPhone()) ) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", "false");
			map.put("errorInfo", "用户名或手机号不能为空");
			return map;
		}
		return userService.getSMS(user,session);
	}
	
	@ResponseBody
	@RequestMapping("/validateSMS")
	public Map<String,Object> validateSMS(String code, HttpSession session) {
		return userService.validateSMS(code, session);
	}
	
	@ResponseBody
	@RequestMapping("/checkUserName")
	public Map<String,Object> checkUserName(String userName) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userService.selectByUserName(userName);
		if(user != null) {
			map.put("result", "exist");
		} else {
			map.put("result", "inexistence");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/checkUserNameByEmail")
	public Map<String,Object> checkUserNameByEmail(String userName, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		RandomParam randomParam = (RandomParam) session.getAttribute("randomParam");
		if(randomParam == null) {
			map.put("result", "false");
			return map;
		}
		if(randomParam.getUserName().equals(userName)) {
			map.put("result", "true");
		} else {
			map.put("result", "false");
		}
		return map;
	}

	@RequestMapping("/resetPwdByPhone")
	@ResponseBody
	public Map<String, Object> resetPwdByPhone(User user, String code, HttpSession session, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		//先验证 验证码是否正确
		String captcha = (String) session.getAttribute("captcha");
		if(!captcha.equals(code)) {
			map.put("result", "failure");
			map.put("msg", "验证码不正确");
			return map;
		}
		
		User selected = userService.selectByUserName(user.getUserName());
		if(selected != null && selected.getPhone().equals(user.getPhone())) {
			//设置要更新的用户的uuid,同时把不需要修改的userName和phone置空
			user.setUuid(selected.getUuid());
			user.setUserName(null);
			user.setPhone(null);
			// Base64解码得到原始密码
			String rawPassword = new String(Base64.decodeFast(user.getPassword()));
			// SHA-256加密密码
			String encodedPassword = passwordEncoder.encode(rawPassword);
			user.setPassword(encodedPassword);
			try {
				userService.updateByPrimaryKeySelective(user);
				session.removeAttribute("captcha");
			} catch (UserException e) {
				e.printStackTrace();
				map.put("result", "failure");
				map.put("msg", e.getCause());
				return map;
			}
			map.put("result", "success");
		} else {
			map.put("result", "failure");
			map.put("msg", "用户名或手机号不正确");
		}

		return map;
	}
	
	@RequestMapping("/resetPwdByEmail")
	@ResponseBody
	public Map<String, Object> resetPwdByEmail(User user, HttpSession session, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		User selected = userService.selectByUserName(user.getUserName());
		if(selected != null) {
			//设置要更新的用户的uuid,同时把不需要修改的userName置空
			user.setUuid(selected.getUuid());
			user.setUserName(null);
			// Base64解码得到原始密码
			String rawPassword = new String(Base64.decodeFast(user.getPassword()));
			// SHA-256加密密码
			String encodedPassword = passwordEncoder.encode(rawPassword);
			user.setPassword(encodedPassword);
			userService.resetPwdByEmail(user, session);
			map.put("result", "success");
		} else {
			map.put("result", "failure");
			map.put("msg", "用户名不存在");
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/applyResetPwdByEmail")
	public Map<String,Object> applyResetPwdByEmail(User user, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(user == null || StringUtil.isNoE(user.getUserName()) || StringUtil.isNoE(user.getEmail()) ) {
			map.put("result", "false");
			map.put("errorInfo", "用户名或邮箱不能为空");
			return map;
		}
		User selected = userService.selectByUserName(user.getUserName());
		
		if(selected == null) {
			map.put("result", "false");
			map.put("errorInfo", "用户名不存在");
			return map;
		}
		
		if(!selected.getEmail().equals(user.getEmail())) {
			map.put("result", "false");
			map.put("errorInfo", "用户名与邮箱不匹配");
			return map;
		}
		return userService.applyResetPwdByEmail(user, session);
	}
	
	@RequestMapping("/linked")
	public String linked() {
		return "linked";
	}
	
	@RequestMapping("/reset")
	public String reset(String p, HttpSession session) {
		if(p == null || p.equals("")) {
			return "redirect:/login";
		}
		
		boolean flag =  userService.validP(p, session);
		if(flag) {
			return "resetPwd";
		}
		
		return "redirect:/login";
	}
	
}
