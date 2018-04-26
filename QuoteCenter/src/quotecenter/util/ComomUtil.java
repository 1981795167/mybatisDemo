package com.landray.kmss.chenyee.quotecenter.util;

import java.util.UUID;

/**
 * 公共工具类
 * @author wangjian
 * 
 */
public class ComomUtil {

	/**  
     * 生成32位编码  
     * @return string  
     */    
    public static String getUUID(){    
        String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");    
        return uuid;    
    }    

}
