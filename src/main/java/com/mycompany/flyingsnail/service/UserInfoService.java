package com.mycompany.flyingsnail.service;

import java.util.List;

import com.mycompany.flyingsnail.entity.UserClothing;
import com.mycompany.flyingsnail.entity.Users;

public interface UserInfoService {

	Users getUserInfo(String name, String password);
	
	boolean setUserPhotoInfo(String imgName, String imgFormat, int countApparel);
	
	List<UserClothing> getUserPhotoInfo(Integer id);
}