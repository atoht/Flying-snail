package com.mycompany.flyingsnail.service;

import java.awt.image.ImageObserver;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.flyingsnail.dto.UserInfo;

public interface CutImageService {

	/**
	 * 上传图片到临时文件夹后取出，然后剪裁再上传到用户文件夹
	 */
	boolean cutImage(MultipartFile imgFile, String tailorInfo, UserInfo userInfo, String orientation);

}