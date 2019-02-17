package com.mycompany.flyingsnail.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.flyingsnail.util.Constants;

@Controller
public class ImgFileController {
	
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
            String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
            // 新图片
            File newFile = new File(Constants.IMG_PATH + newFileName);
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
	
}
