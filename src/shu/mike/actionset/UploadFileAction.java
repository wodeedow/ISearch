package shu.mike.actionset;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import shu.mike.DAO.ResourceManagerLogDAO;
import shu.mike.DAO.ResourceManagerLogFileld;
import shu.mike.bean.User;
import shu.mike.file.FileOperation;
import shu.mike.file.FileType;
import shu.mike.util.UUIDUtil;

import com.opensymphony.xwork2.ActionSupport;

public class UploadFileAction extends ActionSupport
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2257396459323396174L;
	public String title;
	public File upload;
	public String uploadContentType;
	public String uploadFileName;
	public String savePath;
	private String uuid;
	private String contents;
	private boolean isPublic;
	public String execute() throws IOException
	{
		try
		{
			HttpServletResponse httpResponse = ServletActionContext
					.getResponse();
			HttpServletRequest httpRequest = ServletActionContext.getRequest();
			HttpSession session = httpRequest.getSession();
			User user = (User) session.getAttribute("USER_OBJ");
			if (user != null)
			{
				httpResponse.setContentType("text/html; charset=utf-8");
				uploadFile(user, httpRequest);
				return SUCCESS;
			}
			return LOGIN;

		} catch (Exception e)
		{
			e.printStackTrace();
			return ERROR;
		}

	}

	/**
	 * 长传文件
	 * 
	 * @param user
	 *            用户对象
	 * @param httpRequest
	 *            http请求
	 * @throws IOException
	 * @throws SQLException
	 */
	private void uploadFile(User user, HttpServletRequest httpRequest)
			throws IOException, SQLException
	{
		String fatherDirUUID = httpRequest.getParameter("uuid");
		boolean isPublic = httpRequest.getParameter("isPublic").equals("true");
		String fileType = getUploadFileName().substring(
				getUploadFileName().lastIndexOf("."));
		String fileUUID = UUIDUtil.getUUID();
		FileOutputStream fos = new FileOutputStream(new File(getSavePath()
				+ "\\" + fileUUID + fileType));
		FileInputStream fis = new FileInputStream(getUpload());
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = fis.read(buffer)) > 0)
		{
			fos.write(buffer, 0, len);
		}
		fos.close();
		fis.close();
		FileOperation fo = new FileOperation(user.getUserUUID());
		if (!FileType.isAudioType(fileType))
		{
			fo.uploadFile(fatherDirUUID, getUploadFileName(), fileUUID,
					isPublic);
		} else
		{
			fo.uploadFile(fatherDirUUID, getUploadFileName(), fileUUID,
					isPublic, contents);
		}
		ResourceManagerLogDAO.addResourceManagerLog(
				ResourceManagerLogFileld.UPLOAD, user.getUserUUID(), fileUUID,getUploadFileName(),httpRequest.getRemoteAddr());//log in database

	}

	public String getContents()
	{
		return contents;
	}

	public void setContents(String contents)
	{
		this.contents = contents;
	}


	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public File getUpload()
	{
		return upload;
	}

	public void setUpload(File upload)
	{
		this.upload = upload;
	}

	public String getUploadContentType()
	{
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType)
	{
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName()
	{
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName)
	{
		this.uploadFileName = uploadFileName;
	}

	public String getSavePath()
	{
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String savePath)
	{
		this.savePath = savePath;
	}
	public String getUuid()
	{
		return uuid;
	}

	public void setUuid(String uuid)
	{
		this.uuid = uuid;
	}

	public boolean isPublic()
	{
		return isPublic;
	}

	public void setPublic(boolean isPublic)
	{
		this.isPublic = isPublic;
	}

}
