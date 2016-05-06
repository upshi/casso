package top.casso.cas.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.casso.cas.dao.UserMapper;
import top.casso.cas.dao.UserRoleMapper;
import top.casso.cas.exception.UserRoleException;
import top.casso.cas.model.User;
import top.casso.cas.model.UserRole;
import top.casso.cas.service.IUserRoleService;
import top.casso.cas.util.StringUtil;
import top.casso.cas.vo.UserRoleVO;

@Service("userRoleService")
public class UserRoleServiceImpl implements IUserRoleService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserRoleMapper userRoleMapper;

	public int deleteByPrimaryKey(String uuid) throws UserRoleException {
		if(StringUtil.isNoE(uuid)) {
			throw new UserRoleException("删除用户角色的uuid不能为空");
		}
		
		return userRoleMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(UserRole record) throws UserRoleException {
		if(record == null) {
			throw new UserRoleException("用户角色不能为null");
		}
		
		return userRoleMapper.insert(record);
	}

	public int insertSelective(UserRole record) throws UserRoleException {
		if(record == null) {
			throw new UserRoleException("用户角色不能为null");
		}
		
		return userRoleMapper.insertSelective(record);
	}

	public UserRole selectByPrimaryKey(String uuid) throws UserRoleException {
		if(StringUtil.isNoE(uuid)) {
			throw new UserRoleException("用户角色的uuid不能为空");
		}
		
		return userRoleMapper.selectByPrimaryKey(uuid);
	}

	public List<UserRole> selectRolesByUserUuid(String userUuid) throws UserRoleException {
		if(StringUtil.isNoE(userUuid)) {
			throw new UserRoleException("用户的uuid不能为空");
		}
		return userRoleMapper.selectRolesByUserUuid(userUuid);
	}

	public int updateByPrimaryKeySelective(UserRole record) throws UserRoleException {
		if(record == null) {
			throw new UserRoleException("用户角色不能为null");
		}
		
		return userRoleMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(UserRole record) throws UserRoleException {
		if(record == null) {
			throw new UserRoleException("用户角色不能为null");
		}
		
		return userRoleMapper.updateByPrimaryKey(record);
	}

	public int insertBatchByUserRoleVO(List<UserRoleVO> list) throws UserRoleException{
		return userRoleMapper.insertBatchByUserRoleVO(list);
	}

	public int deleteBatchByUuid(List<String> list) throws UserRoleException{
		return userRoleMapper.deleteBatchByUuid(list);
	}

	@Override
	public List<UserRole> updateUserRoles(List<UserRoleVO> newUserRoleList, List<String> deletedUserRoleList, String userUuid) throws UserRoleException {
		//插入新增的角色
		if (newUserRoleList.size() > 0) {
			insertBatchByUserRoleVO(newUserRoleList);
		}
		//删除移除的角色
		if (deletedUserRoleList.size() > 0) {
			deleteBatchByUuid(deletedUserRoleList);
		}
		// 查询最新的用户角色信息
		List<UserRole> userRoles = selectRolesByUserUuid(userUuid);
		
		//更新用户的角色属性信息
		User user = new User();
		user.setUuid(userUuid);
		StringBuffer roles = new StringBuffer();
		for (UserRole ur : userRoles) {
			roles.append(ur.getRole().getcName()).append(",");
		}
		roles.deleteCharAt(roles.length() - 1);
		user.setRole(roles.toString());
		userMapper.updateByPrimaryKeySelective(user);
		
		return userRoles;
	}
	
}
