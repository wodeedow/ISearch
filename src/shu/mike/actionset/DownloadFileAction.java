package shu.mike.actionset;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import shu.mike.DAO.ResourceManagerLogDAO;
import shu.mike.DAO.ResourceManagerLogFileld;
import shu.mike.DAO.UserFileDAO;
import shu.mike.DAO.UserFileField;
import shu.mike.bean.User;
import shu.mike.file.FilePathUtil;

import com.opensymphony.xwork2.ActionSupport;

public class DownloadFileAction extends ActionSupport {
	private static final long serialVersionUID = 251007228486292406L;
	private String fileName;
	private String UUID;
	public String getRealPathByUUID() throws IOException 
	{
		HttpServletRequest httpRequest= ServletActionContext.getRequest();
		HttpServletResponse  httpResponse= ServletActionContext.getResponse();
		String UUID=httpRequest.getParameter("UUID");
		setUUID(UUID);
        PrintWriter outs = httpResponse.getWriter();  
		try
		{
			String realFileName= new UserFileDAO().getInfoByFileUUID(UserFileField.FILENAME, UUID);
			setFileName(realFileName);
			String filePath= httpRequest.getContextPath()+"/upload/"+getUUID()+getFileName().substring(getFileName().lastIndexOf("."));
			httpResponse.setCharacterEncoding("UTF-8");
			outs.write("{\"success\":\"true\",\"filePath\":\""+filePath+"\"}");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
			outs.write("{\"success\":\"false\",\"filePath\":\"null\"}");	
		}
        outs.flush();
        outs.close();		
		return SUCCESS;
	}
	public InputStream getInputStream() throws FileNotFoundException, IOException {
		User user=(User)ServletActionContext.getRequest().getSession().getAttribute("USER_OBJ");
		UserFileDAO sf = new UserFileDAO();
		String realFileName = sf.getInfoByFileUUID(UserFileField.FILENAME, UUID);//获取真实文件名
		setFileName(realFileName);
		String filePath = FilePathUtil.UPLAOD_PATH + getUUID()
				+ getFileName().substring(getFileName().lastIndexOf("."));//计算文件路径
		if(user!=null) //在数据库中插入下载记录
		{
			ResourceManagerLogDAO.addResourceManagerLog(ResourceManagerLogFileld.DOWNLOAD,user.getUserUUID(), UUID,realFileName,ServletActionContext.getRequest().getRemoteAddr());
		}
		else
		{
			ResourceManagerLogDAO.addResourceManagerLog(ResourceManagerLogFileld.DOWNLOAD,null, UUID,realFileName,ServletActionContext.getRequest().getRemoteAddr());
		}
		InputStream in = new FileInputStream(new File(filePath));
		System.out.println(filePath);
		return in;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) throws UnsupportedEncodingException {
		String agent = ServletActionContext.getRequest().getHeader("User-agent");
		// 如果浏览器是IE浏览器，就得进行编码转换
		if (agent.contains("MSIE")) {
			this.fileName = URLEncoder.encode(fileName, "UTF-8");
		} else {
			this.fileName = new String(fileName.getBytes(), "ISO-8859-1");
		}
	}
	public String getUUID() {
		return UUID;
	}

	public void setUUID(String uUID) {
		UUID = uUID;
	}

}
