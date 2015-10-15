package shu.mike.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;

import shu.mike.DAO.UserFileDAO;
import shu.mike.DAO.UserFileField;
import shu.mike.bean.User;
import shu.mike.bean.UserFile;
import shu.mike.file.FileOperation;
import shu.mike.manage.Configuration;
import shu.mike.page.SharedFilePage;

/**
 * Servlet implementation class SharedFileManage
 */
public class SharedFileManage extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SharedFileManage()
	{
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_OBJ");
		String userUUID = null;
		if (user != null)
		{
			userUUID=user.getUserUUID();
			String operateType = request.getParameter("operationType");
			if (operateType.endsWith("getSharedFileTable"))
			{
				int currentPageIndex =Integer.parseInt(request.getParameter("pageIndex"));
				SharedFilePage page=new SharedFilePage(userUUID,Integer.parseInt(Configuration.getValue("loginLogMaxSize")));
				List<UserFile> userFiles =page.getResult(currentPageIndex);
				response.setContentType("application/json;charset=UTF-8");
				response.setCharacterEncoding("UTF-8");// 设置编码字符集为utf-8，否则ext无法正确解析
				PrintWriter outs = null;
				try
				{
					outs = response.getWriter();
				} catch (IOException e)
				{
					e.printStackTrace();
				}
				JSONObject returnJson=new JSONObject();
				JSONArray sharedFileJSONList=new JSONArray();
				JSONArray pageCountList=new JSONArray();
				for(int i=0;i<page.getPageCount();i++)
				{
					pageCountList.put(i+1);
				}
				for (int i = 0; i < userFiles.size(); i++)
				{
					JSONObject temp=new JSONObject();
					temp.put("fileUUID", userFiles.get(i).getFileUUID());
					temp.put("fileName", userFiles.get(i).getFileName());
					sharedFileJSONList.put(temp);
				}
				returnJson.put("pageCount", pageCountList);
				returnJson.put("sharedFileList", sharedFileJSONList);
				outs.write(returnJson.toString());
				outs.flush();
				outs.close();
			} else if (operateType.endsWith("shareFile"))
			{
				HttpServletRequest httpRequest = ServletActionContext
						.getRequest();
				HttpServletResponse httpResponse = ServletActionContext
						.getResponse();
				try
				{
					String fileUUID = httpRequest.getParameter("fileUUID");
					httpResponse.setCharacterEncoding("UTF-8");// 设置编码字符集为utf-8，否则ext无法正确解析
					PrintWriter outs = httpResponse.getWriter();
					UserFileDAO ufd = new UserFileDAO();
					if (ufd.getInfoByFileUUID(UserFileField.ISPUBLIC, fileUUID)
							.equals("true"))
					{
						outs.write("{\"success\":\"true\",\"cause\":\"primaykeyRepeat\"}");
					} else
					{
						ufd.updateInfoByFileUUID(UserFileField.ISPUBLIC,
								fileUUID, "true");
						FileOperation fo = new FileOperation(userUUID);
						fo.createIndex(userUUID);
						fo.setIsPublic(userUUID, true);
						outs.write("{\"success\":\"true\"}");
					}
					outs.flush();
					outs.close();
				} catch (Exception e)
				{
					httpResponse.setCharacterEncoding("UTF-8");// 设置编码字符集为utf-8，否则ext无法正确解析
					PrintWriter outs = httpResponse.getWriter();
					outs.flush();
					outs.close();
					e.printStackTrace();
				}
			}
		}

	}

}
