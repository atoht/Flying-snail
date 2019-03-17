package com.mycompany.flyingsnail.dao;

import java.util.List;

import com.mycompany.flyingsnail.entity.UserClothing;

public interface UserClothingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserClothing record);

    int insertSelective(UserClothing record);

    int insertOrUpdate(UserClothing record);

    UserClothing selectByPrimaryKey(Integer id);
    
    List<UserClothing> selectByPrimaryUserID(Integer id);

    int updateByPrimaryKeySelective(UserClothing record);

    int updateByPrimaryKey(UserClothing record);
}