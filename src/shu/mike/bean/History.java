package shu.mike.bean;

import java.util.Date;


public class History {
	private String randomUUID; //随机生成的uuid
	private String userUUID;//用户的uuid
	private Date searchDate;//用户的搜索日期
	private String ip;//搜索的ip
	private String contents;//搜索内容
	private String address;//简要的地址信息
	private String province;//省份
	private String x;//经纬度
	private String y;
	public History()
	{
	}
	
	public History(String randomUUID, String userUUID, Date searchDate,
			String ip, String contents, String address, String province,
			String x, String y)
	{
		super();
		this.randomUUID = randomUUID;
		this.userUUID = userUUID;
		this.searchDate = searchDate;
		this.ip = ip;
		this.contents = contents;
		this.address = address;
		this.province = province;
		this.x = x;
		this.y = y;
	}

	public String getRandomUUID() {
		return randomUUID;
	}
	public void setRandomUUID(String randomUUID) {
		this.randomUUID = randomUUID;
	}
	public String getUserUUID() {
		return userUUID;
	}
	public void setUserUUID(String userUUID) {
		this.userUUID = userUUID;
	}
	public Date getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(Date searchDate) {
		this.searchDate = searchDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
