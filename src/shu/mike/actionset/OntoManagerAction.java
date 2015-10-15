package shu.mike.actionset;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import com.opensymphony.xwork2.ActionSupport;

import shu.mike.jena.OntoManagerUtil;

public class OntoManagerAction extends ActionSupport
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1819259059244094582L;
	private String operationType;
	private String value;
	private String className;
	private InputStream inputStream;
	private boolean result = false;

	public void  setUpData() throws UnsupportedEncodingException
	{
		OntoManagerUtil ontoUtil=new OntoManagerUtil();
		if (operationType.equals("addSubClass"))
		{
			if (ontoUtil.addSubClass(className, value))
				result = true;
		}
		else if (operationType.equals("renameClass"))
		{
			if (ontoUtil.removeClass(className))
				result = true;

		} else if (operationType.equals("deleteClass"))
		{

		}

		if (result)
		{
			inputStream=new ByteArrayInputStream("{\"success\":true}".getBytes("utf-8"));
		}
		else
		{
			inputStream=new ByteArrayInputStream("{\"success\":false}".getBytes("utf-8"));
		}
			

	}
	public String execute()
	{
		try
		{
			setUpData();
			return SUCCESS;
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
			return ERROR;
		}
	
	}

	public String getOperationType()
	{
		return operationType;
	}

	public void setOperationType(String operationType)
	{
		this.operationType = operationType;
	}

	public String getValue()
	{
		return value;
	}

	public void setValue(String value)
	{
		this.value = value;
	}

	public String getClassName()
	{
		return className;
	}

	public void setClassName(String className)
	{
		this.className = className;
	}

	public InputStream getInputStream() throws UnsupportedEncodingException
	{
		
		return inputStream;
	}

	public void setInputStream(InputStream inputStream)
	{
		this.inputStream = inputStream;
	}

}
