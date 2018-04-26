package com.landray.kmss.chenyee.quotecenter.util;

import java.util.Date;

import com.ibm.icu.text.SimpleDateFormat;

public class DateUtil {
	
	public static String getCurDate(){
		Date curDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return simpleDateFormat.format(curDate);
	}
}
