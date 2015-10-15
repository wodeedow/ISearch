package shu.mike.manage;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class ModifyParamAction extends ActionSupport
{
	private static final long serialVersionUID = -3258989480347522553L;
	private InputStream inputStream;
	private String field;
	private String value;
	public InputStream getInputStream()
	{
		return inputStream;
	}
	public String execute() throws UnsupportedEncodingException
	{
		ManageDAO manage=new ManageDAO();
		switch (field)
		{
		case "serverNum":
			manage.updateManageInfo(MangeInfoField.SERVERNUM, value);
			break;
		case "pageMaxSize":
			manage.updateManageInfo(MangeInfoField.PAGEMAXSIZE, value);
			break;
		case "totalHits":
			manage.updateManageInfo(MangeInfoField.TOTALHITS, value);
			break;
		case "searchMaxItem":
			manage.updateManageInfo(MangeInfoField.SEARCHMAXITEM, value);
			break;
		case "defaultCapacity":
			manage.updateManageInfo(MangeInfoField.DEFAULTCAPACITY, value);
			break;
		case "loginLogMaxSize":
			manage.updateManageInfo(MangeInfoField.LOGINGLOGMAXSIZE, value);
			break;
		case "ResourceManagerLogMaxSize":
			manage.updateManageInfo(MangeInfoField.RESOURCEMANAGERLOGMAXSIZE, value);
			break;
		case "downloadName":
			manage.updateManageInfo(MangeInfoField.DOWNLOADNAME, value);
			break;
		case "EmailAccountUserName":
			manage.updateManageInfo(MangeInfoField.EMAILACCOUNTUSERNAME, value);
			break;
		case "EmailAccountPassWord":
			manage.updateManageInfo(MangeInfoField.EMAILACCOUNTPASSWORD, value);
			break;
		case "EmailAccountSmtpHost":
			manage.updateManageInfo(MangeInfoField.EMAILACCOUNTSMTPHOST, value);
			break;
		default:
			System.out.println("param error!"+ModifyParamAction.class+"--Param:"+field);
			return ERROR;
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		inputStream= new ByteArrayInputStream(result.toString().getBytes("utf-8"));
		return SUCCESS;
	}
	public String getField()
	{
		return field;
	}
	public String getValue()
	{
		return value;
	}
	public void setField(String field)
	{
		this.field = field;
	}
	public void setValue(String value)
	{
		this.value = value;
	}
}
