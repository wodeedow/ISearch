package shu.mike.manage;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class ParamManageAction extends ActionSupport
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 972533905025406972L;
	private InputStream inputStream;
	public InputStream getInputStream()
	{
		return inputStream;
	}
	public String execute() throws UnsupportedEncodingException
	{
		ManageInfo info= new ManageDAO().getManageInfo();
		JSONObject result=new JSONObject();
		JSONObject infoJSON=new JSONObject(info);
		result.put("success", true);
		result.put("info", infoJSON);
		inputStream= new ByteArrayInputStream(result.toString().getBytes("utf-8"));
		return SUCCESS;
	}
	
	
}
