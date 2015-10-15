package shu.mike.actionset;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Document;

import shu.mike.bean.User;
import shu.mike.file.FileOperation;
import shu.mike.file.FilePathUtil;
import shu.mike.util.XMLUtil;

import com.opensymphony.xwork2.ActionSupport;

public class ListDirectoryFilesAction extends ActionSupport
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2677402056822469325L;
	private String fileUUID;
	private InputStream inputStream;
	public  String execute() throws UnsupportedEncodingException
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		setFileUUID(request.getParameter("fileUUID"));
		User user = (User) session.getAttribute("USER_OBJ");
		if (user != null)
		{
			String result = ListDirectoryFiles(user.getUserUUID(), user.getUserName(), fileUUID);
			inputStream=new ByteArrayInputStream(result.getBytes("utf-8"));
			return SUCCESS;
		} else
		{
			return LOGIN;
		}

	}
	/**
	 * 列出目录下所有文件
	 * 
	 * @param userUUID
	 *            用户的userUUID
	 * @param fileUUID
	 *            文件夹得fileUUID
	 * @return xml字符串
	 * @throws Exception
	 */
	public String ListDirectoryFiles(String userUUID, String userName,
			String fileUUID)
	{
		XMLUtil xu = new XMLUtil();
		Document doc = xu.getDocument(FilePathUtil.getXmlFileByID(userUUID));
		Document output = null;
		try
		{
			output = xu.getDirectoryFiles(fileUUID, userName, doc);
		} catch (java.io.FileNotFoundException e)
		{
			new FileOperation(userUUID).prepareSystem(userUUID, userName);
			e.printStackTrace();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return xu.documentToString(output);
	}

	public String getFileUUID()
	{
		return fileUUID;
	}

	public void setFileUUID(String fileUUID)
	{
		this.fileUUID = fileUUID;
	}
	public InputStream getInputStream()
	{
		return inputStream;
	}

}
