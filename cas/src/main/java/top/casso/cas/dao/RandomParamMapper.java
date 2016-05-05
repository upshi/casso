package top.casso.cas.dao;

import java.util.List;

import top.casso.cas.model.RandomParam;

public interface RandomParamMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RandomParam record);

    int insertSelective(RandomParam record);

    RandomParam selectByPrimaryKey(Integer id);
    
    RandomParam selectByP(String p);

    List<RandomParam> selectByUserName(String userName);
    
    List<RandomParam> selectByUserNameAndType(String userName, Integer type);
    
    int updateByPrimaryKeySelective(RandomParam record);

    int updateByPrimaryKey(RandomParam record);
}