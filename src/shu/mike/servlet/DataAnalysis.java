package shu.mike.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import shu.mike.DAO.HistoryDAO;
import shu.mike.DAO.ResourceManagerLogFileld;
import shu.mike.analysis.AnalysisType;
import shu.mike.analysis.DataAnalysisUtil;
import shu.mike.analysis.LoginLogAnalysis;
import shu.mike.analysis.PersonSearchInfo;
import shu.mike.analysis.ProvinceDataAnalysis;
import shu.mike.analysis.ResourceManagerLogAnalysis;
import shu.mike.bean.User;

/**
 * Servlet implementation class DataAnalysis
 */
public class DataAnalysis extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DataAnalysis()
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
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
			if (operateType.equals("GET_SEARCH_TIMES"))
			{

				int[] personWeekInfo = null;
				int[] allNetWeekInfo = null;
				try
				{
					personWeekInfo = PersonSearchInfo
							.getWeekSearchInfo(userUUID);
					allNetWeekInfo = PersonSearchInfo.getWeekAllSearchInfo(true);
				} catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				JSONArray personWeekInfoJSON = new JSONArray(personWeekInfo);
				JSONArray allNetWeekInfoJSON = new JSONArray(allNetWeekInfo);
				JSONObject result=new JSONObject();
				result.put("success","true");
				result.put("personWeekInfoJSON", personWeekInfoJSON);
				result.put("allNetWeekInfoJSON", allNetWeekInfoJSON);
				outs.print(result.toString());
				outs.flush();
				outs.close();
			}
			else if(operateType.equals("frequencyAnalysis"))
			{
				
				String result=DataAnalysisUtil.getMostTokenWord(userUUID);
				outs.print(result.toString());
				outs.flush();
				outs.close();
			}
			else if(operateType.equals("timesMapAnalysis"))
			{
				String result=new HistoryDAO().getProvinceData();
				outs.print(result);
				outs.flush();
				outs.close();
			}
			else if(operateType.equals("loginLogAnalysis"))
			{
				try
				{
					LoginLogAnalysis analysis=new LoginLogAnalysis();
					int[] userLoginLog =analysis.getWeekLoginLog(userUUID);
					int[] netLoginLog=analysis.getWeekLoginLog(true);
					JSONArray userLoginLogJSON = new JSONArray(userLoginLog);
					JSONArray netLoginLogJSON = new JSONArray(netLoginLog);
					JSONObject result=new JSONObject();
					result.put("success","true");
					result.put("userLoginLogJSON", userLoginLogJSON);
					result.put("netLoginLogJSON", netLoginLogJSON);
					outs.print(result.toString());
					outs.flush();
					outs.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			else if(operateType.equals("uploadLogAnalysis"))
			{
				ResourceManagerLogAnalysis analysis=new ResourceManagerLogAnalysis();
				int[] userResourceLog=analysis.getWeekResourceLog(ResourceManagerLogFileld.UPLOAD,userUUID);
				int[] netResourceLog=analysis.getWeekResourceLog(ResourceManagerLogFileld.UPLOAD,true);
				JSONArray userResourceLogJSON = new JSONArray(userResourceLog);
				JSONArray netResourceLogJSON = new JSONArray(netResourceLog);
				JSONObject result=new JSONObject();
				result.put("success","true");
				result.put("userResourceLogJSON", userResourceLogJSON);
				result.put("netResourceLogJSON", netResourceLogJSON);
				outs.print(result.toString());
				outs.flush();
				outs.close();
			}
			else if(operateType.equals("downloadLogAnalysis"))
			{
				ResourceManagerLogAnalysis analysis=new ResourceManagerLogAnalysis();
				int[] userResourceLog=analysis.getWeekResourceLog(ResourceManagerLogFileld.DOWNLOAD,userUUID);
				int[] netResourceLog=analysis.getWeekResourceLog(ResourceManagerLogFileld.DOWNLOAD,true);
				JSONArray userResourceLogJSON = new JSONArray(userResourceLog);
				JSONArray netResourceLogJSON = new JSONArray(netResourceLog);
				JSONObject result=new JSONObject();
				result.put("success","true");
				result.put("userResourceLogJSON", userResourceLogJSON);
				result.put("netResourceLogJSON", netResourceLogJSON);
				outs.print(result.toString());
				outs.flush();
				outs.close();
			}
			else if(operateType.equals("provinceAnalysis"))
			{
				Enumeration<String> names = request.getParameterNames(); 
				while (names.hasMoreElements()) { 
				String string = (String) names.nextElement(); 
				System.out.println(string); 
				} 
				String[] provinceName=request.getParameterValues("provinceName");
				String analysisType=request.getParameter("analysisType");
				ProvinceDataAnalysis analysis=new ProvinceDataAnalysis(provinceName);
				String result=null;
				if(analysisType.equals("ProvinceLoginLog"))
				{
					result=analysis.getData(AnalysisType.PROVINCElOGINlOG);
				}
				else if(analysisType.equals("ProvinceUploadLog"))
				{
					result=analysis.getData(AnalysisType.PROVINCEUPLOADLOG);
				}
				else if(analysisType.equals("ProvinceDownloadLog"))
				{
					result=analysis.getData(AnalysisType.PROVINCEDOWNLOADLOG);
				}
				outs.print(result);
				outs.flush();
				outs.close();
			}

		}
	}

}
