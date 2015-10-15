package shu.mike.manage;

public class SearchServer
{
	private String randomUUID;
	private String serverName;
	private String serverIP;
	private String reMark;
	public String getServerName()
	{
		return serverName;
	}
	public void setServerName(String serverName)
	{
		this.serverName = serverName;
	}

	public String getRandomUUID()
	{
		return randomUUID;
	}
	public void setRandomUUID(String randomUUID)
	{
		this.randomUUID = randomUUID;
	}
	public String getServerIP()
	{
		return serverIP;
	}
	public void setServerIP(String serverIP)
	{
		this.serverIP = serverIP;
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
