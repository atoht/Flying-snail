package com.mycompany.flyingsnail.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.MemoryImageSource;
import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;

import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;

public class ImageIODemo {

	/** 
	* 创建一个BufferedImage图片缓冲区对象并指定它宽高和类型 
	* 这样相当于创建一个画板，然后可以在上面画画 
	*/ 
	 

	/** 
	* 要生成图片的类型,可以是JPG GIF JPEG PNG等... 
	*/ 
	final String picType = "jpg"; 
	     
	/** 
	* 成生成图片的保存路径和图片名称 
	*/ 
	final File file = new File("D:\\imgs\\atoht\\321." + picType);  

	/** 
	* 通过指定参数写一个图片 
	* @param bi 
	* @param picType 
	* @param file 
	* @return boolean 如果失败返回一个布尔值 
	*/ 
	public boolean writeImage(BufferedImage bi,String picType, File file,String tailorInfo) { 
		@SuppressWarnings("unchecked")
		Map<String, Object> mapTailorInfo = (Map<String, Object>)JSON.parseObject(tailorInfo,Map.class);
    	String PictureWidth = mapTailorInfo.get("PictureWidth").toString().replace("px","");
    	String PictureHeight = mapTailorInfo.get("PictureHeight").toString().replace("px","");
    	int fileWidth = bi.getWidth();
        int fileHeight = bi.getHeight();
        double widthScale =  (double) fileWidth / (double) Double.parseDouble(PictureWidth);
        double heightScale =  (double) fileHeight / (double) Double.parseDouble(PictureHeight);
        double realX = Double.parseDouble(mapTailorInfo.get("CoordinateX").toString());
        double realY = Double.parseDouble(mapTailorInfo.get("CoordinateY").toString());
        double CoordinateWidth = Double.parseDouble(mapTailorInfo.get("CoordinateWidth").toString()) * widthScale;
        double CoordinateHeight = Double.parseDouble(mapTailorInfo.get("CoordinateHeight").toString()) * heightScale;
		Image image ;
//		image= new ImageIcon(ClassLoader.getSystemResource("D:\\imgs\\atoht\\photo-1550889264-d19d8c1c64d6.jpg")).getImage();// 通过这种方式加载图片
//        CropImageFilter cropFilter = new CropImageFilter(0, 0,  50, 50);
        CropImageFilter cropFilter = new CropImageFilter((int) realX, (int) realY, (int) CoordinateWidth, (int) CoordinateHeight);
        Image img = Toolkit.getDefaultToolkit().createImage(
              new FilteredImageSource(bi.getSource(), cropFilter));
//		Image img = this.createImage(new FilteredImageSource(
//				bio.getSource(), cropFilter));
	    //拿到画笔
		BufferedImage bib = new BufferedImage((int) CoordinateWidth, (int) CoordinateHeight, BufferedImage.TYPE_INT_BGR);
	Graphics g = bib.getGraphics(); 
	//画一个图形系统默认是白色 
//	g.fillRect(0, 50, 200, 100); 
//	g.setColor(new Color(12,123,88)); 
//	g.setFont(new Font("隶书", Font.ITALIC, 30)); 
//	g.drawString("我是IO流图片", 10, 100);	
	g.drawImage(img, 0, 0, null);
	//释放画笔 
	g.dispose(); 
	//将画好的图片通过流形式写到硬盘上 
	boolean val = false; 
	try { 
	val = ImageIO.write(bib, picType, file);	
	} catch (IOException e) {	
	e.printStackTrace(); 
	} 
	return val; 
	} 
	public static void main(String[] args) { 
	ImageIODemo image = new ImageIODemo(); 
	System.out.println(image.writeImage(null,image.picType, image.file,"{\"PictureWidth\":\"266px\",\"PictureHeight\":\"399px\",\"CoordinateX\":0,\"CoordinateY\":0,\"CoordinateWidth\":192,\"CoordinateHeight\":341.3333333333333}")); 
	} 
}
