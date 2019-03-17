package com.mycompany.flyingsnail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.mycompany.flyingsnail.dto.UserInfo;
import com.mycompany.flyingsnail.entity.UserClothing;
import com.mycompany.flyingsnail.service.CutImageService;
import com.mycompany.flyingsnail.service.UserInfoService;
import com.mycompany.flyingsnail.util.Constants;

@Controller
public class ImgFileController {

	@Autowired
	private UserInfo userInfo;
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private CutImageService cutImageService;
	
	private static final Logger logger = LoggerFactory.getLogger(ImgFileController.class);
	
	/**
	 * 上传页面
	 */
	@RequestMapping(value = "/updateImg", method = RequestMethod.GET)
	public String updateImg(Model model) {
		List<UserClothing> userClothingList = userInfoService.getUserPhotoInfo(userInfo.getUsers().getId());
		String jsonString = JSONObject.toJSONString(userClothingList);
		model.addAttribute("userClothingList", userClothingList);
		model.addAttribute("jsonString", jsonString);
		return "updateImg";
	}
	
	/**
	 * 上传用户照片数据
	 */
	@RequestMapping(value = "/upUserDate", method = RequestMethod.POST)
	@ResponseBody
	public String upUserDate() {
		
		return "aaaaaaaaaa";
	}
	
	/**
	 * 上传图片到本地
	 */
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadFile(HttpServletResponse response, @RequestParam("imgFile") MultipartFile imgFile, String tailorInfo, String orientation, int countApparel) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		//上传图片到临时文件夹后取出，然后剪裁再上传到用户文件夹
		List<String> pathFormat = cutImageService.cutImage(imgFile, tailorInfo, userInfo, orientation);
        if(null != pathFormat && userInfoService.setUserPhotoInfo(pathFormat.get(0), pathFormat.get(1), countApparel)) {
        	map.put("success", "完成");
            map.put("imgName", pathFormat.get(0));
            map.put("imgFormat", pathFormat.get(1));
        	logger.info("图片上传成功");
        	return map;
        }else {
        	map.put("error", "图片不合法");
	        logger.info("图片上传失败");
	        return map;
        }
	}
	
	/*
	 * 删除图片
	 */
	@RequestMapping(value = "deleteImg", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteImg(String imgURL) {
		StringBuilder stringBuilder = new StringBuilder(Constants.IMG_PATH.getAddress());
		stringBuilder.append(imgURL);
		File deleteFile = new File(stringBuilder.toString());
        deleteFile.delete();
        Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
	@RequestMapping(value = "getInputStreamImg/{path}/{format}", method = RequestMethod.GET)
	@ResponseBody
	public String getImg(@PathVariable String path, @PathVariable String format, HttpServletResponse response) {
		StringBuilder stringBuilder = new StringBuilder(Constants.IMG_PATH.getAddress() + "\\");
		stringBuilder.append(userInfo.getUsers().getName());
		stringBuilder.append("\\");
		if("null".equals(format)) {
			stringBuilder.append(userInfo.getImgMap().get(path));
		}else {
			stringBuilder.append(path);
			stringBuilder.append(".");
			stringBuilder.append(format);
		}
//		List<String> listImgPath = ReadFile.readImg(stringBuilder.toString());//读取图片文件
		FileInputStream inputStream = null;
		try {
			inputStream = new FileInputStream(stringBuilder.toString());
			int in = inputStream.available();
			byte[] bt = new byte[in];
			inputStream.read(bt);
			inputStream.close();
			response.setContentType("image/*");
			ServletOutputStream out = response.getOutputStream();
			out.write(bt);
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
}
