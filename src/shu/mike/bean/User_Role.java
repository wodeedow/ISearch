package shu.mike.bean;

public class User_Role
{
	private String userUUID;
	private String roleID;
	private String randomUUID;
	public String getRandomUUID() {
		return randomUUID;
	}
	public void setRandomUUID(String randomUUID) {
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
	public String getRoleID()
	{
		return roleID;
	}
	public void setRoleID(String roleID)
	{
		this.roleID = roleID;
	}
	
}
