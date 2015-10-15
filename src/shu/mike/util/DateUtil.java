package shu.mike.util;

import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	public static String  getDateNowInFormatString()
	{
		Calendar c=Calendar.getInstance();//calculate the deadline 
		c.setTime(new Date());
		java.text.DateFormat format1=new java.text.SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		return format1.format(c.getTime());
	}
	public static String getAfterOneDayFormatString()
	{
		Calendar c=Calendar.getInstance();//calculate the deadline 
		c.setTime(new Date());
		c.add(Calendar.DAY_OF_MONTH, 1);
		java.text.DateFormat format1=new java.text.SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		return format1.format(c.getTime());//set deadline]
	}
	public static Date getAfterOneDay()
	{
		Calendar c=Calendar.getInstance();//calculate the deadline 
		c.setTime(new Date());
		c.add(Calendar.DAY_OF_MONTH, 1);
		return c.getTime();
	}
	public static Date getBeforeOneWeek()
	{
		Calendar c=Calendar.getInstance();//calculate the deadline 
		c.setTime(new Date());
		c.add(Calendar.WEEK_OF_MONTH, -1);
		return c.getTime();
	}
	public static Date getBeforeOneDay()
	{
		Calendar c=Calendar.getInstance();//calculate the deadline 
		c.setTime(new Date());
		c.add(Calendar.DAY_OF_MONTH, -1);
		return c.getTime();
	}
	public static String getFormatString(long lastModified)
	{
		java.text.DateFormat format1=new java.text.SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		return format1.format(lastModified);//set deadline]
	}

}
