package shu.mike.manage;

import java.util.List;

import org.hibernate.Session;

import shu.mike.util.HibernateUtil;

public class SearchServerDAO
{
	public boolean addSearchServer(String serverName, String ip,String reMark)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		SearchServer server = new SearchServer();
		server.setServerName(serverName);
		server.setServerIP(ip);
		server.setReMark(reMark);
		session.save(server);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}

	public String getServerIP(String serverName)
	{
		if(Integer.parseInt(serverName.substring(1))>Integer.parseInt(Configuration.getValue("serverNum")))
		{
			System.out.println("error! serverNum is bigger than the real number of server ");
			return null;
		}
		else
		{
			Session session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<SearchServer> info = (List<SearchServer>) session
					.createQuery("from SearchServer as server where server.serverName=:serverName")
					.setParameter("serverName", serverName).list();
			session.getTransaction().commit();
			HibernateUtil.close(session);
			return info.get(0).getServerIP();
		}
	}
	public boolean updateServer(String serverName,String value)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<SearchServer> info = (List<SearchServer>) session
				.createQuery("from SearchServer as server where server.serverName=:serverName")
				.setParameter("serverName", serverName).list();
		SearchServer server=info.get(0);
		server.setServerIP(value);
		session.update(server);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
	public List<SearchServer> getServer()
	{
			Session session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			@SuppressWarnings("unchecked")
			List<SearchServer> info = (List<SearchServer>) session
					.createQuery("from SearchServer ").list();
			session.getTransaction().commit();
			HibernateUtil.close(session);
			return info;
	}
	public boolean deleteServer(String serverName)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<SearchServer> info = (List<SearchServer>) session
				.createQuery("from SearchServer as server where server.serverName=:serverName")
				.setParameter("serverName", serverName).list();
		session.delete(info.get(0));
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
}
