package com.mycompany.flyingsnail.dto;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.mycompany.flyingsnail.entity.Users;

@Component
public class UserInfo {
	
	private Users users;
	
	private String success;
	
	private Map<String, String> imgMap;
	
	private List<String> listImgPath;

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public Map<String, String> getImgMap() {
		return imgMap;
	}

	public void setImgMap(Map<String, String> imgMap) {
		this.imgMap = imgMap;
	}

	public List<String> getListImgPath() {
		return listImgPath;
	}

	public void setListImgPath(List<String> listImgPath) {
		this.listImgPath = listImgPath;
	}
}
