package top.casso.cas.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.casso.cas.dao.RoleMapper;
import top.casso.cas.exception.RoleException;
import top.casso.cas.model.Role;
import top.casso.cas.service.IRoleService;
import top.casso.cas.util.StringUtil;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("roleService")
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	public int deleteByPrimaryKey(String uuid) throws RoleException {
		if(StringUtil.isNoE(uuid)) {
			throw new RoleException("删除角色的uuid不能为空");
		}
		
		return roleMapper.deleteByPrimaryKey(uuid);
	}

	public int insert(Role record) throws RoleException {
		if(record == null) {
			throw new RoleException("角色不能为null");
		}
		
		return roleMapper.insert(record);
	}

	public int insertSelective(Role record) throws RoleException {
		if(record == null) {
			throw new RoleException("角色不能为null");
		}
		
		return roleMapper.insertSelective(record);
	}

	public Role selectByPrimaryKey(String uuid) throws RoleException {
		if(StringUtil.isNoE(uuid)) {
			throw new RoleException("角色的uuid不能为空");
		}
		
		return roleMapper.selectByPrimaryKey(uuid);
	}

	public int updateByPrimaryKeySelective(Role record) throws RoleException {
		if(record == null) {
			throw new RoleException("角色不能为null");
		}
		
		return roleMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Role record) throws RoleException {
		if(record == null) {
			throw new RoleException("角色不能为null");
		}
		
		return roleMapper.updateByPrimaryKey(record);
	}

	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}

	public PageInfo<Role> selectByConditionAndPaging(Role role, int page, int rows) throws RoleException {
		PageHelper.startPage(page, rows);
		List<Role> list = new ArrayList<Role>();
		try {
			list = roleMapper.selectByCondition(role);
		} catch (Exception e) {
			throw new RoleException("查询角色出错！");
		}
		PageInfo<Role> pageInfo=new PageInfo<Role>(list);
		return pageInfo;
	}

	public Role selectByCName(String cName) throws RoleException {
		Role role = null;
		try {
			role = roleMapper.selectByCName(cName);
		} catch (Exception e) {
			throw new RoleException("查询角色出错！");
		}
		return role;
	}

	public Role selectByEName(String eName) throws RoleException {
		Role role = null;
		try {
			role = roleMapper.selectByEName(eName);
		} catch (Exception e) {
			throw new RoleException("查询角色出错！");
		}
		return role;
	}

}
