package shu.mike.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shu.mike.DAO.UserDAO;

/**
 * Servlet implementation class RegisterService
 */
public class RegisterService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterService() {
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
		String operationType=request.getParameter("operationType");
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//设置编码字符集为utf-8，否则ext无法正确解析  
        PrintWriter outs = response.getWriter();  
        StringBuffer result=null;
        if(operationType.equals("checkUserName"))
        {
        	String userName=request.getParameter("userName");
        	if(new UserDAO().checkUserName(userName))
    		{
    	         result=new StringBuffer("{\"success\":true}");
    		}
    		else
    		{
    			 result=new StringBuffer("{\"success\":false}");
    		}
        }
        else  if(operationType.equals("checkUserEmail"))
        {
        	String userEmail=request.getParameter("userEmail");
        	if(new UserDAO().checkUserMail(userEmail))
    		{
    	         result=new StringBuffer("{\"success\":true}");
    		}
    		else
    		{
    			 result=new StringBuffer("{\"success\":false}");
    		}
        }
		outs.write(result.toString());
		outs.flush();
		outs.close();
	}

}
