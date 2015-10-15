package shu.mike.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shu.mike.bean.User;

public class CookieUtils {
	 public void addCookie(User user,HttpServletResponse response) {  
		 Cookie cookieU = new Cookie("USER_ID",user.getUserUUID());  
	        Cookie cookieP = new Cookie("VALIDATECODE",user.getLoginValidateCode());  
	        cookieU.setMaxAge(60 * 60 * 24*7);  
	        cookieP.setMaxAge(60 * 60 * 24*7);  
	        cookieU.setPath("/");  
	        cookieP.setPath("/");  
	        response.addCookie(cookieP);  
	        response.addCookie(cookieU);    
	    }  
	    // µÃµ½cookie  
	    public  String[] getCookie(HttpServletRequest request) {  
	        Cookie[] cookies = request.getCookies();  
	        String[] userInfo=new String[2];
	        System.out.println("cookies: " + cookies);  
	        if (cookies != null) {  
	            for (Cookie cookie : cookies) {  
	                System.out.println("cookie: " + cookie.getName());  
	                if (cookie.getName().equals("USER_ID")) 
	                {  
	                	 userInfo[0] = cookie.getValue(); 
	                }  
	                if (cookie.getName().equals("VALIDATECODE")) 
	                {  
	                	 userInfo[1] = cookie.getValue(); 
	                }  
	            } 
	            return userInfo;
	        }  
	        return null;  
	    }  
	  
	    // É¾³ýcookie  
	    public void delCookie(HttpServletRequest request) {  
	        Cookie[] cookies = request.getCookies();  
	        if (cookies != null) {  
	            for (Cookie cookie : cookies) {  
	            	 if (cookie.getName().equals("USER_ID")||cookie.getName().equals("VALIDATECODE")) 
		                {  
	            		 	cookie.setValue(null);
	            		 	cookie.setMaxAge(0);
		                }  
	            }  
	        }    
	    }  

}
