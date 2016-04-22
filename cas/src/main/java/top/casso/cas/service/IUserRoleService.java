package top.casso.cas.service;

import java.util.List;

import top.casso.cas.exception.UserRoleException;
import top.casso.cas.model.UserRole;
import top.casso.cas.vo.UserRoleVO;

public interface IUserRoleService {
    int deleteByPrimaryKey(String uuid) throws UserRoleException;

    int insert(UserRole record) throws UserRoleException;

    int insertSelective(UserRole record) throws UserRoleException;

    UserRole selectByPrimaryKey(String uuid) throws UserRoleException;

    int updateByPrimaryKeySelective(UserRole record) throws UserRoleException;

    int updateByPrimaryKey(UserRole record) throws UserRoleException;
    
    List<UserRole> selectRolesByUserUuid(String userUuid) throws UserRoleException;
    
    int insertBatchByUserRoleVO(List<UserRoleVO> list) throws UserRoleException;
    
    int deleteBatchByUuid(List<String> list) throws UserRoleException;
    



   

}