package shu.mike.bean;

import java.util.Date;

public class ResourceManagerLog
{
	private String randomUUID;
	private String userUUID;
	private String typeCode;
	private String fileUUID;
	private Date loadDate;
	private String fileName;
	private String reMark;//备注
	private String ip;
	private String browser;
	private String address;//简要的地址信息
	private String province;//省份
	private String x;//经纬度
	private String y;
	public ResourceManagerLog()
	{
		
	}
	public String getRandomUUID()
	{
		return randomUUID;
	}
	public void setRandomUUID(String randomUUID)
	{
		this.randomUUID = randomUUID;
	}
	public String getUserUUID()
	{
		return userUUID;
	}
	public void setUserUUID(String userUUID)
	{
		this.userUUID = userUUID;
	}
	public String getTypeCode()
	{
		return typeCode;
	}
	public void setTypeCode(String typeCode)
	{
		this.typeCode = typeCode;
	}
	public Date getLoadDate()
	{
		return loadDate;
	}
	public void setLoadDate(Date loadDate)
	{
		this.loadDate = loadDate;
	}
	public String getReMark()
	{
		return reMark;
	}
	public void setReMark(String reMark)
	{
		this.reMark = reMark;
	}
	public String getFileUUID()
	{
		return fileUUID;
	}
	public void setFileUUID(String fileUUID)
	{
		this.fileUUID = fileUUID;
	}
	public String getFileName()
	{
		return fileName;
	}
	public void setFileName(String fileName)
	{
		this.fileName = fileName;
	}
	public String getIp()
	{
		return ip;
	}
	public void setIp(String ip)
	{
		this.ip = ip;
	}
	public String getBrowser()
	{
		return browser;
	}
	public void setBrowser(String browser)
	{
		this.browser = browser;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public String getProvince()
	{
		return province;
	}
	public void setProvince(String province)
	{
		this.province = province;
	}
	public String getX()
	{
		return x;
	}
	public void setX(String x)
	{
		this.x = x;
	}
	public String getY()
	{
		return y;
	}
	public void setY(String y)
	{
		this.y = y;
	}
	
}
