package com.mycompany.flyingsnail.dao;

import org.apache.ibatis.annotations.Param;

import com.mycompany.flyingsnail.entity.Users;

public interface UsersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(Integer id);
    
    Users selectByNameAndPassword(@Param("name") String name, @Param("password") String password);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);
}