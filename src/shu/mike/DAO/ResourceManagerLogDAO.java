package shu.mike.DAO;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import shu.mike.analysis.IPLocationUtil;
import shu.mike.bean.History;
import shu.mike.bean.IPAddress;
import shu.mike.bean.LoginLog;
import shu.mike.bean.ResourceManagerLog;
import shu.mike.util.DateUtil;
import shu.mike.util.HibernateUtil;

public class ResourceManagerLogDAO
{
	public static boolean addResourceManagerLog(ResourceManagerLogFileld field,
			String userUUID, String fileUUID,String fileName,String ip)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		ResourceManagerLog log = new ResourceManagerLog();
		log.setIp(ip);
		log.setLoadDate(new Date());
		log.setUserUUID(userUUID);
		log.setFileUUID(fileUUID);
		log.setFileName(fileName);
		IPAddress ipAdd=new IPAddress();//获得IPAddress对象，并计算相关地理信息
		ipAdd.setIp(ip);
		IPLocationUtil.setLocation(ipAdd);
		log.setAddress(ipAdd.getAddress());//设置相关地理信息
		log.setX(ipAdd.getX());
		log.setY(ipAdd.getY());
		log.setProvince(ipAdd.getProvince());
		switch (field)
		{
		case UPLOAD:
			log.setTypeCode("UPLOAD");
			break;
		case DOWNLOAD:
			log.setTypeCode("DOWNLOAD");
			break;
		case DELETE:
			log.setTypeCode("DELETE");
		default:
			System.out.println("paramer error!");
			break;

		}
		session.save(log);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}

	public static int getResourceManagerLogCount(String userUUID,ResourceManagerLogFileld field)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		String typeValue=null;
		switch (field)
		{
		case UPLOAD:
			typeValue="UPLOAD";
			break;
		case DOWNLOAD:
			typeValue="DOWNLOAD";
			break;
		case DELETE:
			typeValue="DELETE";
		default:
			System.out.println("paramer error!");
			break;

		}
		long num = (Long) session
				.createQuery(
						"select count(*) from ResourceManagerLog where userUUID=:userUUID and typeCode=:typeCode")
				.setParameter("userUUID", userUUID).setParameter("typeCode", typeValue).uniqueResult();
		HibernateUtil.close(session);
		return (int) num;
	}
	public static List<ResourceManagerLog> getUserResourceManagerLog(
			String userUUID,ResourceManagerLogFileld field,int startIndex, int pageMaxSize)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		String typeValue=null;
		switch (field)
		{
		case UPLOAD:
			typeValue="UPLOAD";
			break;
		case DOWNLOAD:
			typeValue="DOWNLOAD";
			break;
		case DELETE:
			typeValue="DELETE";
		default:
			System.out.println("paramer error!");
			break;

		}
		@SuppressWarnings("unchecked")
		List<ResourceManagerLog> list = (List<ResourceManagerLog>) session
				.createQuery(
						"from ResourceManagerLog where userUUID =:userUUID  and typeCode=:typeCode order by loadDate desc")
				.setParameter("userUUID", userUUID).setParameter("typeCode", typeValue).setFirstResult(startIndex)
				.setMaxResults(pageMaxSize).list();
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return list;
	}
	public static List<ResourceManagerLog> getWeekResourceLog(ResourceManagerLogFileld field)
	{
		String typeValue=null;
		switch (field)
		{
		case UPLOAD:
			typeValue="UPLOAD";
			break;
		case DOWNLOAD:
			typeValue="DOWNLOAD";
			break;
		case DELETE:
			typeValue="DELETE";
		default:
			System.out.println("paramer error!");
			break;

		}
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<ResourceManagerLog> result = (List<ResourceManagerLog>) session
				.createQuery(
						"from ResourceManagerLog as his where  his.typeCode=:typeCode and his.loadDate>=:beforeOneWeek and his.loadDate<=:oneDayBefore")
				.setParameter("typeCode", typeValue).setParameter("beforeOneWeek", DateUtil.getBeforeOneWeek()).setParameter("oneDayBefore", DateUtil.getBeforeOneDay()).list();
		HibernateUtil.close(session);
		return result;
	}
	public static  List<ResourceManagerLog> getWeekProvinceResourceLog(ResourceManagerLogFileld field,String provinceName)
	{
		String typeValue=null;
		switch (field)
		{
		case UPLOAD:
			typeValue="UPLOAD";
			break;
		case DOWNLOAD:
			typeValue="DOWNLOAD";
			break;
		case DELETE:
			typeValue="DELETE";
		default:
			System.out.println("paramer error!");
			break;

		}
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<ResourceManagerLog> result = (List<ResourceManagerLog>) session
				.createQuery(
						"from ResourceManagerLog as his where  his.typeCode=:typeCode and his.loadDate>=:beforeOneWeek and his.loadDate<=:oneDayBefore and his.province like:province")
				.setParameter("typeCode", typeValue).setParameter("province", provinceName+"%").setParameter("beforeOneWeek", DateUtil.getBeforeOneWeek()).setParameter("oneDayBefore", DateUtil.getBeforeOneDay()).list();
		HibernateUtil.close(session);
		return result;
	}
	public static List<ResourceManagerLog> getWeekResourceLog(ResourceManagerLogFileld field,String userUUID)
	{
		String typeValue=null;
		switch (field)
		{
		case UPLOAD:
			typeValue="UPLOAD";
			break;
		case DOWNLOAD:
			typeValue="DOWNLOAD";
			break;
		case DELETE:
			typeValue="DELETE";
		default:
			System.out.println("paramer error!");
			break;

		}
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<ResourceManagerLog> result = (List<ResourceManagerLog>) session
				.createQuery(
						"from ResourceManagerLog as his where  his.typeCode=:typeCode and his.loadDate>=:beforeOneWeek and his.loadDate<=:oneDayBefore and his.userUUID=:userUUID")
				.setParameter("typeCode", typeValue).setParameter("beforeOneWeek", DateUtil.getBeforeOneWeek()).setParameter("userUUID", userUUID).setParameter("oneDayBefore", DateUtil.getBeforeOneDay()).list();
		HibernateUtil.close(session);
		return result;
	}
}
