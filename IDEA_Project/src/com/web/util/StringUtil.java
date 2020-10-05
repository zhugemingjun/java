package com.web.util;
/**
 * 
 *
 * @author: lyc
 * @版本: 1.0
 * @创建日期: 2020年6月16日 下午8:37:44
 * @ClassName StringUtil
 * @类描述-Description: TODO(字符串判断)
 */
public class StringUtil {

	public static boolean isEmpty(String str) {
		if ("".equals(str) || str == null) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isNotEmpty(String str) {
		if (!"".equals(str) && str != null) {
			return true;
		} else {
			return false;
		}
	}
}
