package top.casso.cas.service;


import java.util.List;

import top.casso.cas.exception.UserException;
import top.casso.cas.model.User;
import top.casso.cas.model.UserRole;

import com.github.pagehelper.PageInfo;

public interface IUserService {

	int deleteByPrimaryKey(String uuid) throws UserException;

    int insert(User record) throws UserException;
    
    int insertUser(User user, List<UserRole> userRoles) throws UserException;

    int insertSelective(User record) throws UserException;

    User selectByPrimaryKey(String uuid) throws UserException;

    int updateByPrimaryKeySelective(User record) throws UserException;

    int updateByPrimaryKey(User record) throws UserException;
    
    PageInfo<User> selectByConditionAndPaging(User user, int page, int rows) throws UserException;
	
}