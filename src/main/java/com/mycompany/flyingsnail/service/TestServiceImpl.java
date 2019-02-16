package com.mycompany.flyingsnail.service;

import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {
	
	/* (non-Javadoc)
	 * @see com.mycompany.flyingsnail.service.TestService#sayHi()
	 */
	@Override
	public String sayHi() {
		return "HI";
	}
}
