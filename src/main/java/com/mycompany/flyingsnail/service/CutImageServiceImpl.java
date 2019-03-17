package com.mycompany.flyingsnail.service;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.mycompany.flyingsnail.dto.UserInfo;
import com.mycompany.flyingsnail.util.Constants;
import com.mycompany.flyingsnail.util.RotatingPicture;

@Service
public class CutImageServiceImpl implements CutImageService {

	/**
	 * 上传图片到临时文件夹后取出，然后剪裁再上传到用户文件夹
	 */
	/* (non-Javadoc)
	 * @see com.mycompany.flyingsnail.service.CutImageServiceImpl#cutImage(org.springframework.web.multipart.MultipartFile, java.lang.String, com.mycompany.flyingsnail.dto.UserInfo)
	 */
	@Override
	public List<String> cutImage(MultipartFile imgFile, String tailorInfo,UserInfo userInfo, String orientation) {
		int angel = 0;
		String oldFileName = imgFile.getOriginalFilename(); // 获取上传文件的原名
		// 上传图片
        if (imgFile != null && oldFileName != null && oldFileName.length() > 0) {
        	//创建用户图片文件夹
        	File imgFolder = new File(Constants.IMG_PATH.getAddress());
        	if (imgFolder.mkdir()) {
                System.out.println("文件夹夹创建成功");
            }else {
                if (imgFolder.exists()) {
                    System.out.println("文件夹已存在");
                }else {
                    System.out.println("文件夹创建失败");
                }
            }
        	if(userInfo == null || userInfo.getUsers() == null) {
        		return null;
        	}
        	String userName = userInfo.getUsers().getName();
        	String format = oldFileName.substring(oldFileName.lastIndexOf("."));//图片格式
        	// 新的图片名称
        	String randomUUID = UUID.randomUUID().toString() + userInfo.getUsers().getId();
        	//临时文件夹
            String newTempFileName =  userName + "\\temp" + userName + "\\" + randomUUID + format;
            //用户文件夹
            String newFileName =  userName + "\\" + randomUUID + format;
            // 新图片
            File newFile = new File(newTempFileName);
            //创建用户图片临时文件夹
            File imgTempFolder = new File(Constants.IMG_PATH.getAddress() + "\\" + userName + "\\temp" + userName);
        	if (imgTempFolder.mkdirs()) {
                System.out.println("文件夹夹创建成功");
            }else {
                if (imgTempFolder.exists()) {
                    System.out.println("文件夹已存在");
                }else {
                    System.out.println("文件夹创建失败");
                }
            }
        	// 将内存中的数据写入磁盘
            try {
            	imgFile.transferTo(newFile);
            	BufferedImage bi = ImageIO.read(new File(Constants.IMG_PATH.getAddress() + "\\" + newTempFileName));
				@SuppressWarnings("unchecked")
				Map<String, Object> mapTailorInfo = (Map<String, Object>)JSON.parseObject(tailorInfo,Map.class);
            	String PictureWidth = mapTailorInfo.get("PictureWidth").toString().replace("px","");
            	String PictureHeight = mapTailorInfo.get("PictureHeight").toString().replace("px","");
            	int fileWidth = 0;
            	int fileHeight = 0;
            	switch (orientation) {
            	case "3": 
            		angel = 180;
            		break;
            	case "6": 
            		angel = 90;
            		break;
            	case "8": 
            		angel = 270;
            		break;
            		
            	default:
            		break;
            	}
            	BufferedImage buffImage = null;
            	if(!"0".equals(orientation) && !"undefined".equals(orientation)) {//判断竖横屏幕 6:竖屏
            		buffImage = RotatingPicture.getRotatingPicture(bi, angel);
            		fileWidth = buffImage.getWidth();
            		fileHeight = buffImage.getHeight();
            	}else {
            		fileWidth = bi.getWidth();
            		fileHeight = bi.getHeight();
            	}
                    
            	
            	double realX = 0;
            	double realY = 0;
                double widthScale =  (double) fileWidth / (double) Double.parseDouble(PictureWidth);
                double heightScale =  (double) fileHeight / (double) Double.parseDouble(PictureHeight);
                realX = Double.parseDouble(mapTailorInfo.get("CoordinateX").toString()) * widthScale;
                realY = Double.parseDouble(mapTailorInfo.get("CoordinateY").toString()) * heightScale;
                double coordinateWidth = 0;
                double coordinateHeight = 0;
                coordinateWidth = Double.parseDouble(mapTailorInfo.get("CoordinateWidth").toString()) * widthScale;
                coordinateHeight = Double.parseDouble(mapTailorInfo.get("CoordinateHeight").toString()) * heightScale;
        
                if (fileWidth+1 >= coordinateWidth && fileHeight+1 >= coordinateHeight) {
                    CropImageFilter cropFilter = new CropImageFilter((int) realX, (int) realY, (int) coordinateWidth, (int) coordinateHeight);
                    Image img = null;
                    if(null != buffImage) {
                    	img = Toolkit.getDefaultToolkit().createImage(
                    			new FilteredImageSource(buffImage.getSource(), cropFilter));
                    }else {
                    	img = Toolkit.getDefaultToolkit().createImage(
                    			new FilteredImageSource(bi.getSource(), cropFilter));
                    }
                    BufferedImage bufferedImage = new BufferedImage((int) coordinateWidth, (int) coordinateHeight, BufferedImage.TYPE_INT_RGB);
                    Graphics2D g = bufferedImage.createGraphics();
                    g.drawImage(img, null, null);
                    g.dispose();
                    // 新的图片名称
                    String fileName =  Constants.IMG_PATH.getAddress() + "\\" + newFileName ;
                    //输出文件
                    ImageIO.write(bufferedImage, format.replace(".",""), new File(fileName));
                    List<String> pathFormat = new ArrayList<String>();
                    pathFormat.add(randomUUID);
                    pathFormat.add(format.replace(".",""));
                    return pathFormat;
                } else {
                    return null;
                }
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		return null;
	}
}
