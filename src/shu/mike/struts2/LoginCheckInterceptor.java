package shu.mike.struts2;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import shu.mike.bean.User;

public class LoginCheckInterceptor implements Interceptor {

	/**
	 *  À¹½Ø±ØÐëµÇÂ½µÄaction
	 */
	private static final long serialVersionUID = -1264187339956943014L;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("common user  check....");
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user=(User) session.getAttribute("USER_OBJ");
		if(user==null)
		{
			return "login";
		}
		else
		{
			return invocation.invoke();
		}
	}

}
