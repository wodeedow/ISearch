package shu.mike.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import shu.mike.bean.LoginLog;
import shu.mike.bean.ResourceManagerLog;
import shu.mike.bean.User;
import shu.mike.manage.Configuration;
import shu.mike.page.DownloadLogPage;
import shu.mike.page.LoginLogPage;
import shu.mike.page.UploadLogPage;

/**
 * Servlet implementation class LogAnalysis
 */
public class LogAnalysis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogAnalysis() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operateType = request.getParameter("operationType");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_OBJ");
		String userUUID = null;
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");// 设置编码字符集为utf-8，否则ext无法正确解析
		PrintWriter outs = response.getWriter();
		if (user != null)
		{
			userUUID=user.getUserUUID();
			if(operateType.equals("getLoginLogTable"))
			{
				LoginLogPage page=new LoginLogPage(userUUID,Integer.parseInt(Configuration.getValue("loginLogMaxSize")));
				int pageCount=page.getPageCount();
				int requestPageIndex=Integer.parseInt(request.getParameter("pageIndex"));
				List<LoginLog> loginList=page.getResult(requestPageIndex);
				JSONObject returnJson=new JSONObject();
				JSONArray loginJSONList=new JSONArray();
				JSONArray pageCountList=new JSONArray();
				for(int i=0;i<pageCount;i++)
				{
					pageCountList.put(i+1);
				}
				for(LoginLog log:loginList)
				{
					JSONObject temp=new JSONObject();
					temp.put("loginDate", log.getLoginDate());
					temp.put("ip", log.getIp());
					temp.put("address", log.getAddress());
					loginJSONList.put(temp);
				}
				returnJson.put("pageCount", pageCountList);
				returnJson.put("loginList", loginJSONList);
				outs.print(returnJson.toString());
				outs.flush();
				outs.close();
			}
			else if(operateType.equals("getUploadLogTable"))
			{
				UploadLogPage logPage=new UploadLogPage (userUUID,Integer.parseInt(Configuration.getValue("loginLogMaxSize")));
				int pageCount=logPage.getPageCount();
				int requestPageIndex=Integer.parseInt(request.getParameter("pageIndex"));
				List<ResourceManagerLog> resourceList=logPage.getResult(requestPageIndex);
				JSONObject returnJson=new JSONObject();
				JSONArray uploadJSONList=new JSONArray();
				JSONArray pageCountList=new JSONArray();
				for(int i=0;i<pageCount;i++)
				{
					pageCountList.put(i+1);
				}
				for(ResourceManagerLog log:resourceList)
				{
					JSONObject temp=new JSONObject();
					temp.put("loadDate", log.getLoadDate());
					temp.put("fileUUID", log.getFileUUID());
					temp.put("fileName", log.getFileName());
					uploadJSONList.put(temp);
				}
				returnJson.put("pageCount", pageCountList);
				returnJson.put("uploadResourceList", uploadJSONList);
				outs.print(returnJson.toString());
				outs.flush();
				outs.close();
			}
			else if(operateType.equals("getDownloadLogTable"))
			{
				DownloadLogPage logPage=new DownloadLogPage (userUUID,Integer.parseInt(Configuration.getValue("loginLogMaxSize")));
				int pageCount=logPage.getPageCount();
				int requestPageIndex=Integer.parseInt(request.getParameter("pageIndex"));
				List<ResourceManagerLog> resourceList=logPage.getResult(requestPageIndex);
				JSONObject returnJson=new JSONObject();
				JSONArray downloadJSONList=new JSONArray();
				JSONArray pageCountList=new JSONArray();
				for(int i=0;i<pageCount;i++)
				{
					pageCountList.put(i+1);
				}
				for(ResourceManagerLog log:resourceList)
				{
					JSONObject temp=new JSONObject();
					temp.put("loadDate", log.getLoadDate());
					temp.put("fileUUID", log.getFileUUID());
					temp.put("fileName", log.getFileName());
					downloadJSONList.put(temp);
				}
				returnJson.put("pageCount", pageCountList);
				returnJson.put("downloadResourceList", downloadJSONList);
				outs.print(returnJson.toString());
				outs.flush();
				outs.close();
			}
			
		}
	}

}
