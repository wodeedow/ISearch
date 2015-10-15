package shu.mike.bean;

import java.util.Date;

public class User {
	private String userUUID;//ϵͳ�������UUID
	private String userName;//�û�ע����ǳ�
	private boolean sex;//�Ա�
	private String organizations;//��֯
	private String email;
	private String phoneNumber;
	private Date registerDate; //ע������
	private Date lastLoginDate;//���һ�εĵ�½����
	private Date deadLineDate;//�����˺ŵĽ�������
	private String loginValidateCode;//�Զ���½У����
	private String salt;//������
	private String password; //���ܺ������
	private String registerValidateCode;//ע���У����
	private String permissionLevel;//Ȩ�޵ȼ�
	private boolean isVerified;//�Ƿ��Ѿ�������˻�
	private int maxCapacity;//��������
	private int usedCapacity;//�Ѿ�ʹ�õ�����
	private boolean notTrack;//��Ҫ��¼����
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
