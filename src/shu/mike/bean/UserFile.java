package shu.mike.bean;

public class UserFile {
	private String fileUUID;
	private String userUUID;
	private String fileName;
	private int fileSize;
	private String fileRemark;
	private boolean isPublic;
	private boolean isNeedPwd;
	private String passWord;
	private String md5;

	public UserFile(String fileUUID, String userUUID, String fileName,
			int fileSize, boolean isPublic, boolean isNeedPwd, String passWord,
			String md5) {
		super();
		this.fileUUID = fileUUID;
		this.userUUID = userUUID;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.isPublic = isPublic;
		this.isNeedPwd = isNeedPwd;
		this.passWord = passWord;
		this.md5 = md5;
	}

	public UserFile() {

	}

	public String getFileUUID() {
		return fileUUID;
	}

	public void setFileUUID(String fileUUID) {
		this.fileUUID = fileUUID;
	}

	public String getUserUUID() {
		return userUUID;
	}

	public void setUserUUID(String userUUID) {
		this.userUUID = userUUID;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public boolean isPublic() {
		return isPublic;
	}

	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public boolean isNeedPwd() {
		return isNeedPwd;
	}

	public void setNeedPwd(boolean isNeedPwd) {
		this.isNeedPwd = isNeedPwd;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getMd5() {
		return md5;
	}

	public void setMd5(String md5) {
		this.md5 = md5;
	}

	public String getFileRemark()
	{
		return fileRemark;
	}

	public void setFileRemark(String fileRemark)
	{
		this.fileRemark = fileRemark;
	}

}
