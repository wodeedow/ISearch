package shu.mike.DAO;

import java.util.List;

import org.hibernate.Session;

import shu.mike.bean.UserFile;
import shu.mike.util.HibernateUtil;

public class UserFileDAO {
	public boolean renamefile(String fileUUID, String fileName) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		UserFile file = (UserFile) session.get(UserFile.class, fileUUID);
		file.setFileName(fileName);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}

	public boolean deleteFile(String fileUUID) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		UserFile file = (UserFile) session.get(UserFile.class, fileUUID);
		session.delete(file);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;

	}

	public boolean addUserFile(UserFile file) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(file);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}

	public String getInfoByFileUUID(UserFileField userFileField, String fileUUID) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		UserFile file = (UserFile) session.get(UserFile.class, fileUUID);
		String value = "";
		switch (userFileField) {
		case USERUUID:
			value = file.getUserUUID();
			break;
		case FILENAME:
			value = file.getFileName();
			break;
		case ISPUBLIC:
			value = true == file.isPublic() ? "true" : "flase";
			break;
		case ISNEEPWD:
			value = true == file.isNeedPwd() ? "true" : "flase";
			break;
		case PASSWORD:
			value = file.getPassWord();
			break;
		case FILEREMARK:
			value = file.getFileRemark();
			break;
		default:
			System.out.println("Parameters Error!");
			break;
		}
		HibernateUtil.close(session);
		return value;
	}

	public String updateInfoByFileUUID(UserFileField userFileField, String fileUUID, String value) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		UserFile file = (UserFile) session.get(UserFile.class, fileUUID);
		switch (userFileField) {
		case FILENAME:
			file.setFileName(value);
			break;
		case ISPUBLIC:
			boolean isPublic = value.equals("true");
			file.setPublic(isPublic);
			break;
		case ISNEEPWD:
			boolean isNeedPwd = value.equals("true");
			file.setNeedPwd(isNeedPwd);
			break;
		case PASSWORD:
			file.setPassWord(value);
			break;
		case FILEREMARK:
			file.setFileRemark(value);
		default:
			System.out.println("Parameters Error!");
			break;
		}
		session.update(file);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return value;
	}

	public static List <UserFile> getSharedFiles(String userUUID,int startIndex,int pageMaxSize)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<UserFile> userFiles = (List<UserFile>) session.createQuery
		("from UserFile where isPublic =true and userUUID=:userUUID")
		.setParameter("userUUID", userUUID).setFirstResult(startIndex).setMaxResults(pageMaxSize).list();
		HibernateUtil.close(session);
		return userFiles;
		
	}

	public static int getSharedFilesCount(String userUUID) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		long num = (Long) session
				.createQuery("select count(*) from UserFile where userUUID=:userUUID and isPublic =true")
				.setParameter("userUUID", userUUID).uniqueResult();
		HibernateUtil.close(session);
		return (int) num;
	}
}
