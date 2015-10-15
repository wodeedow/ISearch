package shu.mike.DAO;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;

import shu.mike.bean.LoginLog;
import shu.mike.util.DateUtil;
import shu.mike.util.HibernateUtil;

public class LoginLogDAO
{
	/***
	 * ����û���¼��־
	 * @param login
	 * @return
	 */
	public static boolean addLoginLog(LoginLog login)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(login);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
	/***
	 * ��ȡ�û����еĵ�¼���
	 * @param userUUID
	 * @param startIndex
	 * @param endIndex
	 * @return
	 */
	public static List<LoginLog> getUserLoginLog(String userUUID,
			int startIndex, int pageMaxSize)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<LoginLog> loginList = (List<LoginLog>) session
				.createQuery(
						"from LoginLog where userUUID =:userUUID order by loginDate desc")
				.setParameter("userUUID", userUUID).setFirstResult(startIndex)
				.setMaxResults(pageMaxSize).list();
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return loginList;
	}
	/***
	 * ��ȡ�û����еĵ�¼��¼����
	 * @param userUUID
	 * @return
	 */
	public static int getUserLoginLogCount(String userUUID)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		long num = (Long) session
				.createQuery(
						"select count(*) from LoginLog where userUUID=:userUUID")
				.setParameter("userUUID", userUUID).uniqueResult();
		HibernateUtil.close(session);
		return (int) num;
	}
	/***
	 *  ��ȡ���һ��ĳ��ÿ���¼����
	 * @param userUUID
	 * @return
	 * @throws SQLException
	 */
	public List<LoginLog> getWeekLoginLog(String userUUID) throws SQLException
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<LoginLog> weekHistory = (List<LoginLog>) session
				.createQuery(
						"from LoginLog as his where his.userUUID =:userUUID and his.loginDate>=:beforeOneWeek and his.loginDate<=:oneDayBefore")
				.setParameter("userUUID", userUUID)
				.setParameter("beforeOneWeek", DateUtil.getBeforeOneWeek())
				.setParameter("oneDayBefore", DateUtil.getBeforeOneDay())
				.list();
		HibernateUtil.close(session);
		return weekHistory;
	}
	/**
	 * ��ȡ���һ��ȫ��ÿ�յ�¼����
	 * @return 
	 * @throws SQLException
	 */
	public List<LoginLog> getWeekLoginLog() throws SQLException
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<LoginLog> weekHistory = (List<LoginLog>) session
				.createQuery(
						"from LoginLog as his where his.loginDate>=:beforeOneWeek and his.loginDate<=:oneDayBefore")
				.setParameter("beforeOneWeek", DateUtil.getBeforeOneWeek())
				.setParameter("oneDayBefore", DateUtil.getBeforeOneDay())
				.list();
		HibernateUtil.close(session);
		return weekHistory;
	}
	/**
	 * ��ȡ���һ��ȫ���ض�ʡ�ݵ�¼���
	 * @return 
	 * @throws SQLException
	 */
	public List<LoginLog> getWeekProvinceLoginLog(String province) 
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<LoginLog> weekHistory = (List<LoginLog>) session
				.createQuery(
						"from LoginLog as his where his.loginDate>=:beforeOneWeek and his.loginDate<=:oneDayBefore and his.province like :province ")
				.setParameter("beforeOneWeek", DateUtil.getBeforeOneWeek())
				.setParameter("oneDayBefore", DateUtil.getBeforeOneDay())
				.setParameter("province", province+"%")
				.list();
		HibernateUtil.close(session);
		return weekHistory;
	}

}
