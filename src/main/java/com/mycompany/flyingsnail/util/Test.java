package com.mycompany.flyingsnail.util;

import org.apache.commons.lang.StringUtils;

public class Test {
	
	public static void main(String[] args) {
		Object o = "";
		System.out.println(String.valueOf(o));
		System.out.println(StringUtils.isEmpty(String.valueOf(o)));
		System.out.println(StringUtils.isNotEmpty(String.valueOf(o)));
		System.out.println(StringUtils.isNotEmpty(null));
		System.out.println(null == o);
	}
}
