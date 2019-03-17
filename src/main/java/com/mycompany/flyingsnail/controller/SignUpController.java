package com.mycompany.flyingsnail.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class SignUpController {
	
	private static final Logger logger = LoggerFactory.getLogger(ImgFileController.class);
	
	/**
	 * 注册页面
	 */
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String updateImg(Model model) {
		return "registeredPage";
	}

}
