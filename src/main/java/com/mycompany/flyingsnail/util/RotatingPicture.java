package com.mycompany.flyingsnail.util;

import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;

public class RotatingPicture {
	
	
	public static BufferedImage getRotatingPicture(BufferedImage bImg, int angel) {
		
		int bImgWidth = bImg.getWidth();
		int bImgHeight = bImg.getHeight();
		
		Rectangle rect_des = getRotation(new Rectangle(new Dimension(bImgWidth, bImgHeight)), angel);
		BufferedImage buff = new BufferedImage(rect_des.width, rect_des.height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = buff.createGraphics();
        g.translate((rect_des.width - (int) bImgWidth)/2
        		, (rect_des.height - (int) bImgHeight)/2);
        g.rotate(Math.toRadians(angel), bImgWidth/2, bImgHeight/2);
        g.drawImage(bImg, null, null);
        g.dispose();
		return buff;
	}

	public static Rectangle getRotation(Rectangle rec, int angel) {
		
		// 如果旋转的角度大于90度做相应的转换
        if (angel >= 90) {
            if (angel / 90 % 2 == 1) {
                int temp = rec.height;
                rec.height = rec.width;
                rec.width = temp;
            }
            angel = angel % 90;
        }
        double r = Math.sqrt(rec.height * rec.height + rec.width * rec.width) / 2;
        double len = 2 * Math.sin(Math.toRadians(angel) / 2) * r;
        double angel_alpha = (Math.PI - Math.toRadians(angel)) / 2;
        double angel_dalta_width = Math.atan((double) rec.height / rec.width);
        double angel_dalta_height = Math.atan((double) rec.width / rec.height);
 
        int len_dalta_width = (int) (len * Math.cos(Math.PI - angel_alpha
                - angel_dalta_width));
        int len_dalta_height = (int) (len * Math.cos(Math.PI - angel_alpha
                - angel_dalta_height));
        int des_width = rec.width + len_dalta_width * 2;
        int des_height = rec.height + len_dalta_height * 2;
        return new Rectangle(new Dimension(des_width, des_height));
	}
}
