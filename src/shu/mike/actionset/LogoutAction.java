package shu.mike.actionset;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;


public class LogoutAction extends ActionSupport
{
	private static final long serialVersionUID = -7287820553535791512L;

	public String  execute()
	{
		HttpSession  session=ServletActionContext.getRequest().getSession();
		session.setAttribute("USER_OBJ", null);
		return SUCCESS;
	}
}
