package top.casso.cas.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jasig.cas.authentication.handler.DefaultPasswordEncoder;
import org.jasig.cas.authentication.handler.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import top.casso.cas.exception.UserException;
import top.casso.cas.model.User;
import top.casso.cas.service.IUserService;
import top.casso.cas.util.UUIDGenerator;
import top.casso.cas.util.UploadObject;

import com.alibaba.fastjson.util.Base64;

@Controller
@RequestMapping("/self")
public class SelfServiceController {
	
	@Autowired
	private IUserService userService;
	
	private static PasswordEncoder passwordEncoder = new DefaultPasswordEncoder("SHA-256");
	
	@RequestMapping("/info")
	public String info(HttpServletRequest request, HttpSession session, Model model) {
		User user = (User) request.getAttribute("slefUser");
		model.addAttribute("user", user);
		return "info";
	}
	
	
	@RequestMapping("/resetPwd")
	@ResponseBody
	public Map<String, Object> resetPwd(User user, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		// Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(user.getPassword()));
		// SHA-256加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		user.setPassword(encodedPassword);
		try {
			userService.updateByPrimaryKeySelective(user);
		} catch (UserException e) {
			e.printStackTrace();
			map.put("result", "failure");
			map.put("msg", e.getCause());
			return map;
		}
		map.put("result", "success");
		return map;
	}
	
	
	@RequestMapping("/validatePwd")
	@ResponseBody
	public Map<String, Object> validatePwd(User user, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		// Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(user.getPassword()));
		// SHA-256加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		try {
			User selectByPrimaryKey = userService.selectByPrimaryKey(user.getUuid());
			if(encodedPassword.equals(selectByPrimaryKey.getPassword())) {
				map.put("result", "true");
			} else {
				map.put("result", "false");
			}
		} catch (UserException e) {
			e.printStackTrace();
			map.put("result", "false");
			map.put("msg", e.getCause());
		}
		
		return map;
	}
	
	@RequestMapping("/updatePhoto")
	public String updatePhoto(String uuid, Model model, HttpServletRequest request) {
		User user = new User();
		user.setUuid(uuid);
		
		//处理上传图片的逻辑
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("file_data");
		//如果size大于0,则用户上传了图片
		UploadObject uo = null;
		if(multipartFile.getSize() > 0) {
			String remoteBasePath = UploadObject.USER_PHOTO_BASE_PATH;
			uo = new UploadObject(UUIDGenerator.generateUUID(), remoteBasePath, multipartFile);
			user.setPhoto(UploadObject.DOMAIN + uo.getRemotePath());
		}
		
		try {
			userService.updatePhoto(user, uo);
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		model.addAttribute("user", user);
		return "redirect:/self/info";
	}
	
	@RequestMapping("/updateInfo")
	public String update(User user, Model model) {
		User old_user = null;
		try {
			old_user = userService.selectByPrimaryKey(user.getUuid());
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		old_user.setName(user.getName());
		old_user.setSex(user.getSex());
		old_user.setAge(user.getAge());
		old_user.setIdNo(user.getIdNo());
		old_user.setPhone(user.getPhone());
		old_user.setEmail(user.getEmail());
		old_user.setAddress(user.getAddress());
		old_user.setEduBackground(user.getEduBackground());
		old_user.setDepartment(user.getDepartment());
		old_user.setTitle(user.getTitle());
		old_user.setDescription(user.getDescription());
		
		try {
			userService.updateByPrimaryKeySelective(old_user);
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		
		model.addAttribute("user", old_user);
		return "redirect:/self/info";
	}

}
