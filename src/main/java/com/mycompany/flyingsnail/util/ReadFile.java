package com.mycompany.flyingsnail.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mycompany.flyingsnail.dto.UserInfo;

public class ReadFile {
	
	private static final Logger logger = LoggerFactory.getLogger(ReadFile.class);
	
	/*
	 * 读取文件夹下所有图片路径
	 */
	public static List<String> readImg(String imgPath, UserInfo userInfo) {
		
		List<String> listImgPath = new ArrayList<String>();
		Map<String, String> tempMap = new HashMap<String, String>();
		File file = new File(imgPath);
		if(!file.isDirectory()) {
			logger.info("这不是一个文件夹");
		}else if(file.isDirectory()) {
			String[] imgList = file.list();
			 for (int i = 0; i < imgList.length; i++) {
                 File readImg = new File(imgPath + "\\" + imgList[i]);
                 if (!readImg.isDirectory()) {
//                	 	String extensionName = readImg.getName().substring(readImg.getName().lastIndexOf("."));
//                	 	if("jpg") {
//                	 		
//                	 	}
//                	 	listImgPath.add(readImg.getPath());
                	 String temp = readImg.getName();
                	 String[] str = temp.split("\\.");
                	 tempMap.put(str[0], temp);
                	 userInfo.setImgMap(tempMap);
//                	 temp.substring(temp.lastIndexOf("."));
                	 listImgPath.add(str[0]);
                 } else if (readImg.isDirectory()) {
                	 readImg(imgPath + imgList[i], userInfo);
                 }
	         }
		}
		
		return listImgPath;
	}
}
