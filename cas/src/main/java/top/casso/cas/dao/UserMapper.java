package top.casso.cas.dao;

import java.util.List;

import top.casso.cas.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String uuid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	List<User> selectByCondition(User user);

	User selectByUserName(String userName);
    
}