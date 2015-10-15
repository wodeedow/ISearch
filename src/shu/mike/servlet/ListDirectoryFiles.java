package shu.mike.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.w3c.dom.Document;

import shu.mike.bean.User;
import shu.mike.file.FileOperation;
import shu.mike.file.FilePathUtil;
import shu.mike.util.XMLUtil;

/**
 * Servlet implementation class ListDirectoryFiles
 */
public class ListDirectoryFiles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListDirectoryFiles() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doPost( request,  response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_OBJ");
		String fileUUID=request.getParameter("fileUUID");
		if (user != null)
		{
			String result = ListDirectoryString(user.getUserUUID(), user.getUserName(), fileUUID);
			response.setCharacterEncoding("UTF-8"); // 设置编码
			response.setContentType("text/xml;charset=utf-8");
			response.setHeader("Cache-Control", "no-cache");
			PrintWriter out = response.getWriter();
			out.write(result);
			out.flush();
			out.close();
		} else
		{
			response.sendRedirect("login.html");
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
	private  String ListDirectoryString(String userUUID, String userName,
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

}
