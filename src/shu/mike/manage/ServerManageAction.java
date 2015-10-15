package shu.mike.manage;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class ServerManageAction extends ActionSupport
{
	private static final long serialVersionUID = -2358909835340061047L;
	private InputStream inputStream;
	public InputStream getInputStream()
	{
		return inputStream;
	}
	public String execute() throws UnsupportedEncodingException
	{
		SearchServerDAO dao=new SearchServerDAO();
		List<SearchServer> list=dao.getServer();
		JSONObject result=new JSONObject();
		result.put("success", true);
		JSONArray serverList=new JSONArray();
		for(int i=0;i<list.size();i++)
		{
			JSONObject temp=new JSONObject();
			temp.put("serverName",list.get(i).getServerName() );
			temp.put("ip", list.get(i).getServerIP());
			temp.put("reMark", list.get(i).getReMark());
			serverList.put(temp);
		}
		result.put("serverList", serverList);
		inputStream= new ByteArrayInputStream(result.toString().getBytes("utf-8"));
		return SUCCESS;
	}
}
