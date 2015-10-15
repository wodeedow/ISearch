package shu.mike.bean;

import java.util.Date;

public class User {
	private String userUUID;//系统生成随机UUID
	private String userName;//用户注册的昵称
	private boolean sex;//性别
	private String organizations;//组织
	private String email;
	private String phoneNumber;
	private Date registerDate; //注册日期
	private Date lastLoginDate;//最后一次的登陆日期
	private Date deadLineDate;//激活账号的截至日期
	private String loginValidateCode;//自动登陆校验码
	private String salt;//密码盐
	private String password; //加密后的密码
	private String registerValidateCode;//注册的校验码
	private String permissionLevel;//权限等级
	private boolean isVerified;//是否已经激活该账户
	private int maxCapacity;//容量上限
	private int usedCapacity;//已经使用的容量
	private boolean notTrack;//不要记录数据
	public User()
	{
		
	}
	public User(String userUUID, String userName, boolean sex,
			String organizations, Date registerDate, Date lastLoginDate,
			String loginValidateCode, String salt, String password,
			String registerValidateCode, String permissionLevel,
			boolean isVerified, int maxCapacity, int usedCapacity,
			boolean notTrack) {
		super();
		this.userUUID = userUUID;
		this.userName = userName;
		this.sex = sex;
		this.organizations = organizations;
		this.registerDate = registerDate;
		this.lastLoginDate = lastLoginDate;
		this.loginValidateCode = loginValidateCode;
		this.salt = salt;
		this.password = password;
		this.registerValidateCode = registerValidateCode;
		this.permissionLevel = permissionLevel;
		this.isVerified = isVerified;
		this.maxCapacity = maxCapacity;
		this.usedCapacity = usedCapacity;
		this.notTrack = notTrack;
	}
	public Date getDeadLineDate()
	{
		return deadLineDate;
	}
	public void setDeadLineDate(Date deadLineDate)
	{
		this.deadLineDate = deadLineDate;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getPhoneNumber()
	{
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber)
	{
		this.phoneNumber = phoneNumber;
	}
	public String getUserUUID() {
		return userUUID;
	}
	public void setUserUUID(String userUUID) {
		this.userUUID = userUUID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public boolean isSex() {
		return sex;
	}
	public void setSex(boolean sex) {
		this.sex = sex;
	}
	public String getOrganizations() {
		return organizations;
	}
	public void setOrganizations(String organizations) {
		this.organizations = organizations;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public String getLoginValidateCode() {
		return loginValidateCode;
	}
	public void setLoginValidateCode(String loginValidateCode) {
		this.loginValidateCode = loginValidateCode;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRegisterValidateCode() {
		return registerValidateCode;
	}
	public void setRegisterValidateCode(String registerValidateCode) {
		this.registerValidateCode = registerValidateCode;
	}
	public String getPermissionLevel() {
		return permissionLevel;
	}
	public void setPermissionLevel(String permissionLevel) {
		this.permissionLevel = permissionLevel;
	}
	public boolean isVerified() {
		return isVerified;
	}
	public void setVerified(boolean isVerified) {
		this.isVerified = isVerified;
	}
	public int getMaxCapacity() {
		return maxCapacity;
	}
	public void setMaxCapacity(int maxCapacity) {
		this.maxCapacity = maxCapacity;
	}
	public int getUsedCapacity() {
		return usedCapacity;
	}
	public void setUsedCapacity(int usedCapacity) {
		this.usedCapacity = usedCapacity;
	}
	public boolean isNotTrack() {
		return notTrack;
	}
	public void setNotTrack(boolean notTrack) {
		this.notTrack = notTrack;
	}

}
