package shu.mike.DAO;

import org.hibernate.Session;

import shu.mike.bean.Permission;
import shu.mike.util.HibernateUtil;

public class PermissionDAO
{
	public static void main(String[] args)
	{
		PermissionDAO dao=new PermissionDAO();
		dao.addPermission("set words");
	}
	public boolean addPermission(String permissionName)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		Permission per=new Permission();
		per.setPermissionName(permissionName);
		session.save(per);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
}
