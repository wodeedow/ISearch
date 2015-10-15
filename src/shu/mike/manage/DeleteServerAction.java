package shu.mike.manage;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteServerAction extends ActionSupport
{
	private static final long serialVersionUID = -2682453115759579984L;
	private InputStream inputStream;
	private String serverName;
	public String execute() throws UnsupportedEncodingException
	{
		SearchServerDAO dao=new SearchServerDAO();
		ManageDAO mangeDAO=new ManageDAO();
		JSONObject result=new JSONObject();
		
		if(dao.deleteServer(serverName))
		{
			ManageInfo info=new ManageInfo();
			info=mangeDAO.getManageInfo();
			int newServerNum=info.getServerNum()-1;
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
	public String getServerName()
	{
		return serverName;
	}
	public void setServerName(String serverName)
	{
		this.serverName = serverName;
	}
	public InputStream getInputStream()
	{
		return inputStream;
	}
}
