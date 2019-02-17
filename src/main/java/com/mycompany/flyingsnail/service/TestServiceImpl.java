package com.mycompany.flyingsnail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.flyingsnail.dao.UsersMapper;
import com.mycompany.flyingsnail.entity.Users;

@Service
public class TestServiceImpl implements TestService {
	
	@Autowired
	UsersMapper um;
	
	/* (non-Javadoc)
	 * @see com.mycompany.flyingsnail.service.TestService#sayHi()
	 */
	@Override
	public String sayHi() {
		return "HI";
	}

	@Override
	public void insert(Users user) {
		um.insert(user);
		
	}
	
	
}
