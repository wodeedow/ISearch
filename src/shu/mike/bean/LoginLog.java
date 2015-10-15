package shu.mike.bean;

import java.util.Date;

public class LoginLog
{
	private String randomUUID;
	private String userUUID;
	private Date loginDate;
	private String ip;
	private String os;
	private String browser;
	private String address;//简要的地址信息
	private String province;//省份
	private String x;//经纬度
	private String y;
	public LoginLog()
	{
		
	}
	public LoginLog(String randomUUID, String userUUID, Date loginDate)
	{
		super();
		this.randomUUID = randomUUID;
		this.userUUID = userUUID;
		this.loginDate = loginDate;
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
	public Date getLoginDate()
	{
		return loginDate;
	}
	public void setLoginDate(Date loginDate)
	{
		this.loginDate = loginDate;
	}
	public String getIp()
	{
		return ip;
	}
	public void setIp(String ip)
	{
		this.ip = ip;
	}
	public String getOs()
	{
		return os;
	}
	public void setOs(String os)
	{
		this.os = os;
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
