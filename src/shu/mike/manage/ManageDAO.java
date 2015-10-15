package shu.mike.manage;

import java.util.List;

import org.hibernate.Session;

import shu.mike.util.HibernateUtil;

public class ManageDAO
{
	public ManageDAO()
	{
//		ManageInfo info=new ManageInfo();
//		info.setServerNum(1);
//		info.setPort(4700);
//		info.setPageMaxSize(10);
//		info.setTotalHits(500);
//		info.setSearchMaxItem(500);
//		info.setDefaultCapacity(2000);
//		info.setDefaultPermissionLevel("01");
//		info.setDownloadName("ISearch/Download");
//		info.setLoginLogMaxSize(10);
//		info.setEmailAccountUserName("zhangminghu@163.com");
//		info.setEmailAccountPassWord("xiaohu012607");
//		info.setEmailAccountSmtpHost("smtp.163.com");
//		addManageInfo(info);
	}
	public static void main(String[] args)
	{
	}
	public boolean addManageInfo(ManageInfo info)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(info);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
	public ManageInfo getManageInfo()
	{
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<ManageInfo> info = (List<ManageInfo>) session
				.createQuery(
						"from ManageInfo").list();
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return info.get(0);
	}
	public boolean updateManageInfo(MangeInfoField field,String value)
	{
		ManageInfo info=getManageInfo();
		switch(field)
		{
		case SERVERNUM:
			info.setServerNum(Integer.parseInt(value));
			break;
		case PAGEMAXSIZE:
			info.setPageMaxSize(Integer.parseInt(value));
			break;
		case TOTALHITS:
			info.setTotalHits(Integer.parseInt(value));
			break;
		case SEARCHMAXITEM:
			info.setSearchMaxItem(Integer.parseInt(value));
			break;
		case DEFAULTCAPACITY:
			info.setDefaultCapacity(Integer.parseInt(value));
			break;
		case RESOURCEMANAGERLOGMAXSIZE:
			info.setResourceManagerLogMaxSize(Integer.parseInt(value));
			break;
		case DOWNLOADNAME:
			info.setDownloadName(value);
			break;
		case LOGINGLOGMAXSIZE:
			info.setLoginLogMaxSize(Integer.parseInt(value));
			break;
		case EMAILACCOUNTUSERNAME:
			info.setEmailAccountUserName(value);
			break;
		case EMAILACCOUNTPASSWORD:
			info.setEmailAccountPassWord(value);
			break;
		case EMAILACCOUNTSMTPHOST:
			info.setEmailAccountSmtpHost(value);
			break;
		default:
			System.out.println("param error !");
		}
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.update(info);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
}
