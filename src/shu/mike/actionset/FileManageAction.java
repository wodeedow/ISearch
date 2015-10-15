package shu.mike.actionset;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.PropertyConfigurator;
import org.apache.struts2.ServletActionContext;

import shu.mike.bean.User;
import shu.mike.file.FileOperation;
import shu.mike.file.FilePathUtil;

import com.opensymphony.xwork2.ActionSupport;

public class FileManageAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6029774342916893560L;
	private String fatherDirectoryUUID;
	private String fileUUID;
	private String operationType;
	private String fileName;
	private boolean isDirectory;
	public String execute() throws IOException
	{
		PropertyConfigurator.configure(FilePathUtil.LOG4J);
		HttpServletRequest httpRequest= ServletActionContext.getRequest();
		HttpServletResponse httpResponse= ServletActionContext.getResponse();
		HttpSession session=httpRequest.getSession();
		User user=(User)session.getAttribute("USER_OBJ");
		String userUUID=null;
		if(user!=null)
		{
			userUUID=user.getUserUUID();
			FileOperation fo=new FileOperation(userUUID);
			if(operationType.equals("create"))
			{
				fo.createDirectory(fileName, fatherDirectoryUUID);
			}else if(operationType.equals("rename"))
			{
				fo.renameFile(fileUUID, fileName);
			}
			else if(operationType.equals("delete"))
			{
				setDirectory(httpRequest.getParameter("isDirectory").trim().equals("true"));
				fo.deleteFile(fileUUID, isDirectory);
			}
			else if(operationType.equals("cancelSharedFile"))
			{
				fo.cancelSharedFile(fileUUID);
			}
			else if(operationType.equals("shareFile"))
			{
				fo.shareFile(fileUUID);
			}
			httpResponse.setCharacterEncoding("UTF-8");//设置编码字符集为utf-8，否则ext无法正确解析  
	        PrintWriter outs = httpResponse.getWriter();  
	        outs.write("{\"success\":\"true\"}");
	        outs.flush();
	        outs.close();
			return SUCCESS;
		}
		else
		{
			return LOGIN;
		}
	
		
	}
	public String getFatherDirectoryUUID() {
		return fatherDirectoryUUID;
	}
	public void setFatherDirectoryUUID(String fatherDirectoryUUID) {
		this.fatherDirectoryUUID = fatherDirectoryUUID;
	}
	public String getFileUUID() {
		return fileUUID;
	}
	public void setFileUUID(String fileUUID) {
		this.fileUUID = fileUUID;
	}
	public String getOperationType() {
		return operationType;
	}
	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public boolean isDirectory() {
		return isDirectory;
	}
	public void setDirectory(boolean isDirectory) {
		this.isDirectory = isDirectory;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
