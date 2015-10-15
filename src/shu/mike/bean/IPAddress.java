package shu.mike.bean;

public class IPAddress
{
	private String ip;
	private String browser;
	private String address;//简要的地址信息
	private String province;//省份
	private String x;//经纬度
	private String y;
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
