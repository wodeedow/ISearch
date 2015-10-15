package shu.mike.manage;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class AddServerAction extends ActionSupport
{
	private static final long serialVersionUID = 611640497605309893L;
	private InputStream inputStream;
	private String ip;
	private String reMark;
	public String execute() throws UnsupportedEncodingException
	{
		SearchServerDAO dao=new SearchServerDAO();
		JSONObject result=new JSONObject();
		ManageDAO mangeDAO=new ManageDAO();
		ManageInfo info=new ManageInfo();
		info=mangeDAO.getManageInfo();
		int newServerNum=info.getServerNum();
		if(dao.addSearchServer("ip"+newServerNum, ip,reMark))
		{
		
			mangeDAO.updateManageInfo(MangeInfoField.SERVERNUM, newServerNum+"");
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
	public InputStream getInputStream()
	{
		return inputStream;
	}
	public String getIp()
	{
		return ip;
	}
	public void setIp(String ip)
	{
		this.ip = ip;
	}
	public String getReMark()
	{
		return reMark;
	}
	public void setReMark(String reMark)
	{
		this.reMark = reMark;
	}
}
