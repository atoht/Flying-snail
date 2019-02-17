package com.mycompany.flyingsnail.util;

public enum Constants {
	
	IMG_PATH("D:\\imgs\\");
	
	//声明的枚举属性，同时生成getter方法
    private String Address;
    
    private Constants(String Address){
        this.Address = Address;
    }

	public String getAddress() {
		return Address;
	}
}
