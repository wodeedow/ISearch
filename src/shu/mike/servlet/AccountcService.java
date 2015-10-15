package shu.mike.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;

import shu.mike.DAO.UserDAO;
import shu.mike.DAO.UserField;
import shu.mike.bean.User;

/**
 * Servlet implementation class AccountcService
 */
public class AccountcService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountcService() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("USER_OBJ");
		String userUUID=null;
		if(user!=null)
		{
			UserDAO ud=new UserDAO();
			userUUID=user.getUserUUID();
			String operateType=request.getParameter("operationType");
			if(operateType.endsWith("getInfo"))
			{
				response.setContentType("application/json;charset=UTF-8");
				response.setCharacterEncoding("UTF-8");//设置编码字符集为utf-8，否则ext无法正确解析  
		        PrintWriter outs = response.getWriter();  
		        JSONObject result=new JSONObject();
		        result.put("success", "true");
		        JSONObject jsonUser=new JSONObject(user);
		        result.put("user", jsonUser);
				outs.write(result.toString());
			}
			else if(operateType.endsWith("setInfo"))
			{
					String sex=request.getParameter("sex");
					String userEmail=request.getParameter("userEmail");
					String organizations=request.getParameter("organizations");
					String notTrack=request.getParameter("notTrack");
					response.setContentType("application/json;charset=UTF-8");
					response.setCharacterEncoding("UTF-8");
					boolean isSuccess=false;
					boolean checkEmail=true;
					if(!user.getEmail().equals(userEmail.trim()))
					{
						 checkEmail=ud.checkUserMail(userEmail);
					}
					isSuccess=ud.updateInfo(userUUID, UserField.SEX, sex);
					isSuccess=ud.updateInfo(userUUID, UserField.ORGANIZATIONS, organizations);
					isSuccess=ud.updateInfo(userUUID, UserField.NOTTRACK, notTrack);
					isSuccess=ud.updateInfo(userUUID, UserField.EMAIL, userEmail);
			        PrintWriter outs = response.getWriter();  
			        JSONObject result=new JSONObject();
					if(isSuccess&&checkEmail)
					{
						result.put("success", true);
						request.getSession().setAttribute("USER_OBJ",ud.getUserByUserUUID(userUUID));
					}
					else
					{
						result.put("success", false);
						if(!checkEmail)
							result.put("cause", "checkEmail");
						else
							result.put("cause", "retry");
		
					}
					outs.write(result.toString());
				
			}else if(operateType.endsWith("setPassword"))
			{
				String oldPassword=request.getParameter("oldPassword");
				String newPassword=request.getParameter("newPassword");
				response.setContentType("application/json;charset=UTF-8");
				response.setCharacterEncoding("UTF-8");//设置编码字符集为utf-8，否则ext无法正确解析  
		        PrintWriter outs = response.getWriter(); 
		        User tempUser=null;
				try
				{
					tempUser = ud.IsExistUser(userUUID, oldPassword);
				} catch (NoSuchAlgorithmException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvalidKeySpecException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        boolean isTrue=false;
		        boolean isSuccess=false;
		        isTrue=tempUser!=null?true:false;
		        isSuccess=ud.updateInfo(userUUID, UserField.PASSWORD, newPassword);
				if(isSuccess)
				{
					outs.write("{\"success\":true}");
				}
				else
				{
					if(!isTrue)
						outs.write("{\"success\":false,\"cause\":\"oldPasswordError\"}");
					else
						outs.write("{\"success\":false,\"cause\":\"retry\"}");
				}
				outs.flush();
				outs.close();
			}
		}
		}
	}
