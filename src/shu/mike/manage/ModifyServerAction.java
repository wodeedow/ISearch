package shu.mike.manage;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class ModifyServerAction extends ActionSupport
{
	private static final long serialVersionUID = -4722911601747638147L;
	private InputStream inputStream;
	private String serverName;
	private String value;
	public String execute() throws UnsupportedEncodingException
	{
		SearchServerDAO dao=new SearchServerDAO();
		JSONObject result=new JSONObject();
		
		if(dao.updateServer(serverName, value))
		{
			result.put("success", true);
			inputStream=new ByteArrayInputStream(result.toString().getBytes("utf-8"));
			return SUCCESS;
		}
		else
		{
			result.put("success", false);
			inputStream=new ByteArrayInputStream(result.toString().getBytes("utf-8"));
			return ERROR;
		}
	}
	public String getServerName()
	{
		return serverName;
	}
	public void setServerName(String serverName)
	{
		this.serverName = serverName;
	}
	public String getValue()
	{
		return value;
	}
	public void setValue(String value)
	{
		this.value = value;
	}
	public InputStream getInputStream()
	{
		return inputStream;
	}
}
