package top.casso.cas.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import top.casso.cas.exception.UserException;
import top.casso.cas.model.User;
import top.casso.cas.model.UserRole;
import top.casso.cas.util.UploadObject;

import com.github.pagehelper.PageInfo;

public interface IUserService {

	int deleteByPrimaryKey(String uuid) throws UserException;

    int insert(User record, UploadObject uo) throws UserException;
    
    int insertUser(User user, List<UserRole> userRoles) throws UserException;

    int insertSelective(User record) throws UserException;

    User selectByPrimaryKey(String uuid) throws UserException;

    int updateByPrimaryKeySelective(User record) throws UserException;

    int updateByPrimaryKey(User record) throws UserException;
    
    PageInfo<User> selectByConditionAndPaging(User user, int page, int rows) throws UserException;

	User selectByUserName(String userName);

	void updatePhoto(User user, UploadObject uo) throws UserException;

	Map<String, Object> getSMS(User user, HttpSession session);

	Map<String, Object> validateSMS(String code, HttpSession session);

	Map<String, Object> applyResetPwdByEmail(User user, HttpSession session);

	boolean validP(String p, HttpSession session);

	void resetPwdByEmail(User user, HttpSession session);
	
}
