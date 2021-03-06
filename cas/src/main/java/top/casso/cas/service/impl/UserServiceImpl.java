package top.casso.cas.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.casso.cas.dao.RandomParamMapper;
import top.casso.cas.dao.RoleMapper;
import top.casso.cas.dao.UserMapper;
import top.casso.cas.dao.UserRoleMapper;
import top.casso.cas.exception.UserException;
import top.casso.cas.model.RandomParam;
import top.casso.cas.model.Role;
import top.casso.cas.model.User;
import top.casso.cas.model.UserRole;
import top.casso.cas.service.IUserService;
import top.casso.cas.util.SMSSender;
import top.casso.cas.util.SendMailTool;
import top.casso.cas.util.StringUtil;
import top.casso.cas.util.UUIDGenerator;
import top.casso.cas.util.UploadObject;
import top.casso.cas.util.UploadUtil;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("userService")
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Autowired
	private RandomParamMapper randomParamMapper;
	
	@Autowired
	private SendMailTool sendMailTool;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public int deleteByPrimaryKey(String uuid) throws UserException {
		if(StringUtil.isNoE(uuid)) {
			throw new UserException("请输入要删除用户的UUID");
		}
		try {
			return userMapper.deleteByPrimaryKey(uuid);
		} catch (Exception e) {
			throw new UserException(e.getMessage());
		}
	}

	public int insert(User user, UploadObject uo) throws UserException {
		int result = 0;
		try {
			//查询角色
			Role role = roleMapper.selectByEName("ROLE_USER");
			
			//设置用户的role属性
			user.setRole(role.getcName());
			//插入用户
			result = userMapper.insert(user);
			
			//插入用户角色
			UserRole ur = new UserRole(UUIDGenerator.generateUUID(), user, role);
			userRoleMapper.insert(ur);
		} catch (Exception e) {
			throw new UserException(e.getMessage());
		}
		
		if(uo != null) {
			String msg = null;
			try {
				msg = UploadUtil.uploadImage(uo.getRemotePath(), uo.getInputStream());
			} catch (Exception e) {
				throw new UserException(e.getCause());
			}
			JSONObject json = JSONObject.parseObject(msg);
			Integer code = (Integer) json.get("code");
			if(code != 0) {
				throw new UserException("文件上传失败");
			}
		}
		return result;
	}
	
	public void insertBatch(List<User> users) throws UserException {
		try {
			//查询角色
			Role role = roleMapper.selectByEName("ROLE_USER");
			
			List<UserRole> userRoles = new ArrayList<UserRole>();
			UserRole ur = null;
			for(User u : users) {
				u.setRole(role.getcName());
				ur = new UserRole(UUIDGenerator.generateUUID(), u, role);
				userRoles.add(ur);
			}
			
			//批量插入用户
			userMapper.insertBatch(users);
			
			//批量插入用户角色
			userRoleMapper.insertBatch(userRoles);
		} catch (Exception e) {
			throw new UserException(e.getMessage());
		}
	}

	public int insertSelective(User record) throws UserException {
		try {
			return userMapper.insertSelective(record);
		} catch (Exception e) {
			throw new UserException(e.getMessage());
		}
	}

	public User selectByPrimaryKey(String uuid) throws UserException {
		if(StringUtil.isNoE(uuid)) {
			throw new UserException("请输入要查询用户的UUID");
		}
		try {
			return userMapper.selectByPrimaryKey(uuid);
		} catch (Exception e) {
			throw new UserException(e.getMessage());
		}
	}

	public int updateByPrimaryKeySelective(User record) throws UserException {
		try {
			return userMapper.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			throw new UserException(e.getMessage());
		}
	}

	public int updateByPrimaryKey(User record) throws UserException {
		try {
			return userMapper.updateByPrimaryKey(record);
		} catch (Exception e) {
			throw new UserException(e.getMessage());
		}
	}

	public int insertUser(User user, List<UserRole> userRoles) throws UserException {
		return 0;
	}

	@Override
	public PageInfo<User> selectByConditionAndPaging(User user, int page, int size) throws UserException {
		PageHelper.startPage(page, size);
		List<User> list = new ArrayList<User>();
		list = userMapper.selectByCondition(user);
		PageInfo<User> pageInfo = new PageInfo<User>(list);
		return pageInfo;
	}

	public User selectByUserName(String userName) {
		return userMapper.selectByUserName(userName);
	}

	public void updatePhoto(User user, UploadObject uo) throws UserException {
		String photo = userMapper.selectByPrimaryKey(user.getUuid()).getPhoto();
		photo = photo.substring(photo.indexOf(UploadObject.USER_PHOTO_BASE_PATH), photo.length());
		
		try {
			userMapper.updateByPrimaryKeySelective(user);
		} catch (Exception e) {
			throw new UserException(e.getMessage());
		}
		
		String msg = null;
		try {
			//先删除,再上传
			UploadUtil.deleteImage(photo);
			msg = UploadUtil.uploadImage(uo.getRemotePath(), uo.getInputStream());
		} catch (Exception e) {
			throw new UserException(e.getCause());
		}
		JSONObject json = JSONObject.parseObject(msg);
		Integer code = (Integer) json.get("code");
		if(code != 0) {
			throw new UserException("文件上传失败");
		}
	}

	public Map<String, Object> getSMS(User user, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 先从用户表中查询是否存在，如果不存在，则返回错误信息
		User selected = userMapper.selectByUserName(user.getUserName());
		if(selected != null) {
			//如果根据用户名查询出来的用户的手机号和传递来的一致,则发送短信验证码
			if(selected.getPhone().equals(user.getPhone())) {
				String captcha = SMSSender.send(user.getPhone());
				//验证码放到session中
				session.setAttribute("captcha", captcha);
				map.put("result", "true");
				map.put("errorInfo", "");
			} else {
				map.put("result", "false");
				map.put("errorInfo", "您输入的手机号不正确");
			}
		} else {
			map.put("result", "false");
			map.put("errorInfo", "用户名不存在");
		}
		return map;
	}
	
	// 验证验证码是否正确
	public Map<String, Object> validateSMS(String code, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String captcha = (String) session.getAttribute("captcha");
		if (captcha == null || "".equals(captcha)) {
			map.put("result", "false");
			map.put("errorInfo", "请点击获取验证码");
		}
		if (code != null && code != "") {
			if (!code.equals(captcha)) {
				map.put("result", "false");
				map.put("errorInfo", "您输入的验证码不正确");
			} else {
				map.put("result", "true");
				map.put("errorInfo", "");
			}
		}
		return map;
	}

	public Map<String, Object> applyResetPwdByEmail(User user, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		//先判断数据库中有没有可以使用的参数
		List<RandomParam> randomParams = randomParamMapper.selectByUserNameAndType(user.getUserName(), 1);
		if(randomParams != null && randomParams.size() != 0 ) {
			for(RandomParam r : randomParams) {
				if(r.getStatus() == 1) {
					sendMailTool.send(user.getEmail(), r.getP());
					map.put("result", "success");
					map.put("p", r.getP());
					return map;
				}
			}
		}
		
		//如果没有,新建返回
		RandomParam randomParam = new RandomParam();
		randomParam.setP(UUIDGenerator.generateUUID());
		randomParam.setUserName(user.getUserName());
		randomParam.setStatus(1);
		randomParam.setType(1);
		randomParam.setTime(sdf.format(new Date()));
		
		randomParamMapper.insert(randomParam);
		sendMailTool.send(user.getEmail(), randomParam.getP());
		map.put("result", "success");
		map.put("p", randomParam.getP());
		
		return map;
	}

	public boolean validP(String p, HttpSession session) {
		RandomParam randomParam = randomParamMapper.selectByP(p);
		//如果没查到
		if(randomParam == null || randomParam.getStatus() != 1 || randomParam.getType() != 1) {
			return false;
		}
		//放入session中
		session.setAttribute("randomParam", randomParam);
		return true;
	}

	public void resetPwdByEmail(User user, HttpSession session) {
		//修改密码
		userMapper.updateByPrimaryKeySelective(user);
		//修改randomParam的的状态
		RandomParam randomParam = (RandomParam) session.getAttribute("randomParam");
		randomParam.setStatus(0);
		randomParamMapper.updateByPrimaryKeySelective(randomParam);
		//移除randomParam
		session.removeAttribute("randomParam");
	}

	//角色uuid保存在user的uuid中
	public List<User> selectByConditionWithRoleUuid(User user) {
		return userMapper.selectByConditionWithRoleUuid(user);
	}
}
