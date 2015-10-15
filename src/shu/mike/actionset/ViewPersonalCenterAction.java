package shu.mike.actionset;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import shu.mike.DAO.RoleDAO;
import shu.mike.DAO.RoleDefinition;
import shu.mike.DAO.User_RoleDAO;
import shu.mike.bean.User;

public class ViewPersonalCenterAction extends ActionSupport
{

	private static final long serialVersionUID = -2254895265816832436L;

	public  String execute()
	{
		HttpSession  session=ServletActionContext.getRequest().getSession();
		User user=(User)session.getAttribute("USER_OBJ");
		if(user==null)
		{
			return LOGIN;
		}
		else if(!user.isVerified())
		{
			return "activateAccount";
		}
		else
		{
			RoleDAO rd=new RoleDAO();
			String commonAdminRoleID=rd.getRoleID(RoleDefinition.COMMON_ADMIN);
			String superAdminRoleID=rd.getRoleID(RoleDefinition.SUPER_ADMIN);
			List<String> result=new User_RoleDAO().getRoleType(user.getUserUUID());
			if(result.contains(superAdminRoleID))
			{
				return "superAdminCenter";
			}
			else if(result.contains(commonAdminRoleID))
			{
				return "commonAdminCenter";
			}
			else
			{
				return "commonUser";
			}
		}
			
	}

}
