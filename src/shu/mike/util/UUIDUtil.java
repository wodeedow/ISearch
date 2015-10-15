package shu.mike.util;

import java.util.UUID;

public class UUIDUtil {
	 public static String getUUID(){ 
	        String s = UUID.randomUUID().toString(); 
	        //È¥µô¡°-¡±·ûºÅ 
	        StringBuffer sb=new StringBuffer(s.substring(0,8));
	        sb.append(s.substring(9,13));
	        sb.append(s.substring(14,18));
	        sb.append(s.substring(19,23));
	        sb.append(s.substring(24));
	        return sb.toString();
	    } 
}
