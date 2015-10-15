package shu.mike.DAO;

import java.util.List;

import org.hibernate.Session;

import shu.mike.bean.Role;
import shu.mike.util.HibernateUtil;

public class RoleDAO
{
	public static void main(String[] args)
	{
		new RoleDAO().addRole("COMMON_USER");
		new RoleDAO().addRole("COMMON_ADMIN");
		new RoleDAO().addRole("SUPER_ADMIN");
	}

	public boolean addRole(String roleName)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		Role role = new Role();
		role.setRoleName(roleName);
		session.save(role);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
	/**
	 * 根据roleName 得到roleID
	 * @param roleName
	 * @return
	 */
	public String getRoleID(RoleDefinition roleName)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<Role> lists=(List<Role>)session.createQuery("from Role as role  where role.roleName=:roleName").setParameter("roleName", roleName.toString()).list();
		Role role=lists.get(0);
		return role.getRoleID();
	}
}
