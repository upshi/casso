package top.casso.cas.dao;

import java.util.List;

import top.casso.cas.model.UserRole;
import top.casso.cas.vo.UserRoleVO;

public interface UserRoleMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
    
    void insertBatch(List<UserRole> userRoles);
    
    int insertBatchByUserRoleVO(List<UserRoleVO> list);
    
    int deleteBatchByUuid(List<String> list);
    
    List<UserRole> selectRolesByUserUuid(String userUuid);
}