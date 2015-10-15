package shu.mike.analysis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

import shu.mike.bean.History;
import shu.mike.bean.IPAddress;
import shu.mike.bean.LoginLog;

public class IPLocationUtil
{
	private static String baseURL = "http://api.map.baidu.com/location/ip?ak=czR9APuH5iZhKF7C6BU4XEQ0&coor=bd09ll&ip=";

	public static void main(String[] args) throws UnsupportedEncodingException, IOException
	{
		String result=getLocation("58.32.19.255");
		JSONObject obj=new JSONObject(result);
		int statusCode=(int) obj.get("status");
		if(statusCode==0)
		{
			System.out.println("address----"+obj.get("address"));//详细地址信息
			System.out.println("content----"+obj.get("content"));
			JSONObject contentOBJ=obj.getJSONObject("content");
			System.out.println("province-----"+contentOBJ.getJSONObject("address_detail").get("province"));
			JSONObject pointOBJ=contentOBJ.getJSONObject("point");
			System.out.println("X-----"+pointOBJ.get("x"));
			System.out.println("Y-----"+pointOBJ.get("y"));
		}
		else
		{
			System.out.println("ip error!");
		}
		
	}

	public static String  getLocation(String ip)
			throws UnsupportedEncodingException, IOException
	{
		String urlString = baseURL + ip;
		URL getURL = new URL(urlString);
		HttpURLConnection conn = (HttpURLConnection) getURL.openConnection();// 打开一个连接
		conn.setRequestMethod("POST");// 设置post方式请求
		conn.setConnectTimeout(5 * 1000);// 设置连接超时时间为5秒 JDK1.5以上才有此方法
		conn.setReadTimeout(20 * 1000);// 设置读取超时时间为20秒 JDK1.5以上才有此方法
		String msg = "";// 保存调用http服务后的响应信息
		// 如果请求响应码是200，则表示成功
		if (conn.getResponseCode() == 200)
		{
			// HTTP服务端返回的编码是UTF-8,故必须设置为UTF-8,保持编码统一,否则会出现中文乱码
			BufferedReader in = new BufferedReader(new InputStreamReader(
					(InputStream) conn.getInputStream(), "UTF-8"));// 返回从此打开的连接读取的输入流
			msg = in.readLine();
			in.close();
		}
		conn.disconnect();// 断开连接
		System.out.println(msg);
		return msg;
	}
	public static void setLocation(History history)
	{
		String result=null;
		try
		{
			result = getLocation(history.getIp());
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		JSONObject obj=new JSONObject(result);
		int statusCode=(int) obj.get("status");
		if(statusCode==0)
		{
			history.setAddress(obj.get("address").toString());//详细地址信息
			JSONObject contentOBJ=obj.getJSONObject("content");
			history.setProvince(contentOBJ.getJSONObject("address_detail").get("province").toString());
			JSONObject pointOBJ=contentOBJ.getJSONObject("point");
			history.setX(pointOBJ.get("x").toString());
			history.setY(pointOBJ.get("y").toString());
		}
		else
		{
			System.out.println("ip error!");
		}
		
	}
	public static void setLocation(IPAddress ipAdd)
	{
		String result=null;
		try
		{
			result = getLocation(ipAdd.getIp());
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		JSONObject obj=new JSONObject(result);
		int statusCode=(int) obj.get("status");
		if(statusCode==0)
		{
			ipAdd.setAddress(obj.get("address").toString());//详细地址信息
			JSONObject contentOBJ=obj.getJSONObject("content");
			ipAdd.setProvince(contentOBJ.getJSONObject("address_detail").get("province").toString());
			JSONObject pointOBJ=contentOBJ.getJSONObject("point");
			ipAdd.setX(pointOBJ.get("x").toString());
			ipAdd.setY(pointOBJ.get("y").toString());
		}
		else
		{
			System.out.println("ip error!");
		}
	}
}
