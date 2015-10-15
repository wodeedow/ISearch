package shu.mike.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import shu.mike.bean.User_Role;
import shu.mike.util.HibernateUtil;

public class User_RoleDAO
{
	public static void main (String[] args)
	{
		
	}
	public boolean addUserRole(String userUUID,String roleID)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		User_Role ur=new User_Role();
		ur.setRoleID(roleID);
		ur.setUserUUID(userUUID);
		session.save(ur);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
	public List<String>  getRoleType(String userUUID)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<User_Role> lists=(List<User_Role>)session.createQuery("from User_Role as ur where ur.userUUID=:userUUID").setParameter("userUUID", userUUID).list();
		List<String> result=new ArrayList<String>();
		for(User_Role ur:lists)
		{
			result.add(ur.getRoleID());
		}
		return result;
	}
	
}
