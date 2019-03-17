package com.mycompany.flyingsnail.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.flyingsnail.dao.UserClothingMapper;
import com.mycompany.flyingsnail.dao.UsersMapper;
import com.mycompany.flyingsnail.dto.UserInfo;
import com.mycompany.flyingsnail.entity.UserClothing;
import com.mycompany.flyingsnail.entity.Users;

@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired
	UsersMapper um;
	@Autowired
	UserClothingMapper userClothingMapper;
	@Autowired
	private UserInfo userInfo;
	
	/* (non-Javadoc)
	 * @see com.mycompany.flyingsnail.service.UserInfoService#getUserInfo(java.lang.String, java.lang.String)
	 */
	@Override
	public Users getUserInfo(String name, String password) {
		Users user = um.selectByNameAndPassword(name, password);
		if( user != null) {
			return user;
		}
		return null;
	}
	
	/* (non-Javadoc)
	 * @see com.mycompany.flyingsnail.service.UserInfoService#setUserPhotoInfo(java.lang.String, java.lang.String, java.lang.Integer)
	 */
	@Override
	public boolean setUserPhotoInfo(String imgName, String imgFormat, int countApparel) {
		Date date = new Date();
		UserClothing userClothing = new UserClothing();
    	userClothing.setUserId(userInfo.getUsers().getId());
    	userClothing.setClothingId(0);
    	userClothing.setClothingComponentId(countApparel);
    	userClothing.setImageName(imgName);
    	userClothing.setImageFormat(imgFormat);
    	userClothing.setUpdateTime(date);
    	userClothing.setCreateTime(date);
    	int i = 0;
		try {
			i = userClothingMapper.insertOrUpdate(userClothing);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	if(i != 0) {
    		return true;
    	}else {
    		return false;
    	}
	}
	
	/* (non-Javadoc)
	 * @see com.mycompany.flyingsnail.service.UserInfoService#getUserPhotoInfo(java.lang.Integer)
	 */
	public List<UserClothing> getUserPhotoInfo(Integer id) {
		List<UserClothing> userClothingList = userClothingMapper.selectByPrimaryUserID(id);
		if( userClothingList.size() != 0) {
			return userClothingList;
		}
		return null;
	}

}
