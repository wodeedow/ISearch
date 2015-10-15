package shu.mike.actionset;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import shu.mike.DAO.LoginLogDAO;
import shu.mike.DAO.UserDAO;
import shu.mike.analysis.LoginLogAnalysis;
import shu.mike.bean.LoginLog;
import shu.mike.bean.User;
import shu.mike.util.CookieUtils;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5453299857650469502L;
	private  String identity;//email userName phoneNumber 
	private  String password;
	public HttpServletRequest httpRequest;
	public CookieUtils cu;
	public String execute()
	{
		httpRequest= ServletActionContext.getRequest();
		HttpServletResponse  httpResponse= ServletActionContext.getResponse();
		cu=new CookieUtils();
		try {
			UserDAO ud=new UserDAO();
			User user=ud.IsExistUser(identity,password);
			if(user!=null)
			{
				cu.addCookie(user,httpResponse);
				HttpSession session=ServletActionContext.getRequest().getSession();
				session.setAttribute("USER_OBJ", user);
				session.setAttribute("USER_NAME", user.getUserName());
				session.setAttribute("USER_UUID", user.getUserUUID());
				new LoginLogAnalysis().addLoginLog(user.getUserUUID(), ServletActionContext.getRequest());
				return SUCCESS;
			}
			else
			{
				return LOGIN;
			}
		} catch (Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	public String login()
	{
		httpRequest= ServletActionContext.getRequest();
		cu=new CookieUtils();
		String[] userInfo=cu.getCookie(httpRequest);
		UserDAO sud=new UserDAO ();
		if(userInfo[0]!=null&&userInfo[1]!=null)
		{
			User user=sud.checkLoginValidateCode(userInfo[0], userInfo[1]);
			if(user!=null)
			{
				HttpSession session=ServletActionContext.getRequest().getSession();
				session.setAttribute("USER_OBJ", user);
				session.setAttribute("USER_NAME", user.getUserName());
				session.setAttribute("USER_UUID", user.getUserUUID());
				new LoginLogAnalysis().addLoginLog(user.getUserUUID(), ServletActionContext.getRequest());
				return SUCCESS;
			}
			return LOGIN;
		}
		else
		{
			return LOGIN;
		}
			
	}
	public String logout()
	{
		httpRequest= ServletActionContext.getRequest();
		cu=new CookieUtils();
		cu.delCookie(httpRequest);
		return LOGIN;
	}
	public String getIdentity()
	{
		return identity;
	}
	public void setIdentity(String identity)
	{
		this.identity = identity;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
}
