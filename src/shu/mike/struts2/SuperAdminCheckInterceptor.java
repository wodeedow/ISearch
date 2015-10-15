package shu.mike.struts2;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import shu.mike.DAO.RoleDAO;
import shu.mike.DAO.RoleDefinition;
import shu.mike.DAO.User_RoleDAO;
import shu.mike.bean.User;

public class SuperAdminCheckInterceptor implements Interceptor
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4762653648990119792L;

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
		System.out.println("super admin check....");
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user=(User) session.getAttribute("USER_OBJ");
		if(user==null)
		{
			return "login";
		}
		else
		{
			RoleDAO rd=new RoleDAO();
			String roleID=rd.getRoleID(RoleDefinition.SUPER_ADMIN);
			List<String> result=new User_RoleDAO().getRoleType(user.getUserUUID());
			if(!result.contains(roleID))
			{
				return "error";
			}
			else
			{
				return invocation.invoke();
			}
		}
	}

}
