package top.casso.cas.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.casso.cas.dao.UserRoleMapper;
import top.casso.cas.exception.UserRoleException;
import top.casso.cas.model.UserRole;
import top.casso.cas.service.IUserRoleService;
import top.casso.cas.util.StringUtil;
import top.casso.cas.vo.UserRoleVO;

@Service("userRoleService")
public class UserRoleServiceImpl implements IUserRoleService {
	
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
	
}
