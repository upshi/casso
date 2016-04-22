package top.casso.cas.dao;

import java.util.List;

import top.casso.cas.model.Role;

public interface RoleMapper {
    
    int deleteByPrimaryKey(String uuid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String uuid);
    
    int updateByPrimaryKeySelective(Role record);
    
    int updateByPrimaryKey(Role record);

    List<Role> selectAll();
    
    List<Role> selectByCondition(Role role);
    
    Role selectByCName(String cName);
    
    Role selectByEName(String eName);
}