package top.casso.cas.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.casso.cas.dao.RoleMapper;
import top.casso.cas.dao.UserMapper;
import top.casso.cas.dao.UserRoleMapper;
import top.casso.cas.exception.UserException;
import top.casso.cas.model.Role;
import top.casso.cas.model.User;
import top.casso.cas.model.UserRole;
import top.casso.cas.service.IUserService;
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
			result = userMapper.insert(user);
			Role role = roleMapper.selectByEName("ROLE_USER");
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

}
