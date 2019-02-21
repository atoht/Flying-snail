package com.mycompany.flyingsnail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.flyingsnail.dto.UserInfo;
import com.mycompany.flyingsnail.util.Constants;

@Controller
public class ImgFileController {
	
	@Autowired
	private UserInfo userInfo;
	
	private static final Logger logger = LoggerFactory.getLogger(ImgFileController.class);
	
	/*
	 * 上传页面
	 */
	@RequestMapping(value = "/updateImg", method = RequestMethod.GET)
	public String updateImg() {
		
		return "updateImg";
	}
	
	/*
	 * 上传图片到本地
	 */
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadFile(Locale locale, Model model, MultipartFile imgFile) {
		Map<String, Object> map = new HashMap<String, Object>();
		String oldFileName = imgFile.getOriginalFilename(); // 获取上传文件的原名
		// 上传图片
        if (imgFile != null && oldFileName != null && oldFileName.length() > 0) {
            // 新的图片名称
            String newFileName =  userInfo.getUsers().getName() + "\\" + UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
            
            // 新图片
            File newFile = new File(newFileName);
            // 将内存中的数据写入磁盘
            try {
				imgFile.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            // 将新图片名称返回到前端
            map.put("success", "完成");
            map.put("url", newFileName);
            return map;
        } else {
            map.put("error", "图片不合法");
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
		StringBuilder stringBuilder = new StringBuilder(Constants.IMG_PATH.getAddress());
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
