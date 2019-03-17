package com.mycompany.flyingsnail.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.mycompany.flyingsnail.dto.UserInfo;
import com.mycompany.flyingsnail.entity.Users;
import com.mycompany.flyingsnail.service.TestService;
import com.mycompany.flyingsnail.service.UserInfoService;
import com.mycompany.flyingsnail.util.Constants;
import com.mycompany.flyingsnail.util.ReadFile;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private UserInfo userInfo;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
		Users user = userInfoService.getUserInfo("atoht", "admin");
		if(user != null) {
			userInfo.setUsers(user);
//		logger.info("Welcome home! The client locale is {}.", locale);
			List<String> listImgPath = ReadFile.readImg(Constants.IMG_PATH.getAddress() + "\\" + user.getName() + "\\", userInfo);//读取图片文件
			userInfo.setListImgPath(listImgPath);
			Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
			model.addAttribute("userInfo", userInfo );
		}else {
			userInfo.setSuccess("失败");
			model.addAttribute("userInfo", userInfo );
		}
//		
		// 图片存储路径
//        String filePath = Constants.IMG_PATH + fileName;
		return "home";
	}
	
}
