package shu.mike.DAO;

import org.hibernate.Session;

import shu.mike.bean.Role_Permission;
import shu.mike.util.HibernateUtil;

public class Role_PermissionDAO
{
	public boolean addPermission(String roleID,String permissionID)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		Role_Permission role_per=new Role_Permission();
		role_per.setRoleID(roleID);
		role_per.setPermissionID(permissionID);
		session.save(role_per);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
}
