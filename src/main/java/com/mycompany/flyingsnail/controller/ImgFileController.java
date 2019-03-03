package com.mycompany.flyingsnail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.flyingsnail.dto.UserInfo;
import com.mycompany.flyingsnail.service.CutImageService;
import com.mycompany.flyingsnail.util.Constants;

@Controller
public class ImgFileController {

	@Autowired
	private UserInfo userInfo;
	@Autowired
	private CutImageService cutImageService;
	
	private static final Logger logger = LoggerFactory.getLogger(ImgFileController.class);
	
	/**
	 * 上传页面
	 */
	@RequestMapping(value = "/updateImg", method = RequestMethod.GET)
	public String updateImg() {
		
		return "updateImgDialog";
	}
	
	/**
	 * 上传图片到本地
	 */
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadFile(HttpServletRequest request, @RequestParam("imgFile") MultipartFile imgFile, String tailorInfo, String orientation) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		//上传图片到临时文件夹后取出，然后剪裁再上传到用户文件夹
        if( cutImageService.cutImage(imgFile, tailorInfo, userInfo, orientation)) {
        	// 将新图片名称返回到前端
        	map.put("success", "完成");
//            map.put("url", newTempFileName);
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
	public String deleteImg(String imgURL) {
		StringBuilder stringBuilder = new StringBuilder(Constants.IMG_PATH.getAddress());
		stringBuilder.append(imgURL);
		File deleteFile = new File(stringBuilder.toString());
        deleteFile.delete();
		return "";
	}
	
	@RequestMapping(value = "getInputStreamImg/{path}", method = RequestMethod.GET)
	@ResponseBody
	public String getImg(@PathVariable String path, HttpServletResponse response) {
		StringBuilder stringBuilder = new StringBuilder(Constants.IMG_PATH.getAddress() + "\\");
		stringBuilder.append(userInfo.getUsers().getName());
		stringBuilder.append("\\");
		stringBuilder.append(userInfo.getImgMap().get(path));
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
