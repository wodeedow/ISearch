package shu.mike.DAO;


import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;

import shu.mike.bean.User;
import shu.mike.util.HibernateUtil;
import shu.mike.util.PasswordEncryptionService;

public class UserDAO {
	public UserDAO()
	{
		
	}
	/**
	 * ������Ϣ
	 * @param userUUID
	 * @param userField ������Ϣ����
	 * @param value ����ֵ��boolean Ӧ�ô�ֵ"true" "false"
	 * @return ���½��
	 */
	public boolean updateInfo(String userUUID,UserField userField,String value )  {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		User user=(User)session.load(User.class, userUUID);
		switch(userField)
		{
		case USERNAME:
			if(checkUserName(value))//����Ƿ�����
				user.setUserName(value);
			else
				return false;
			break;
		case SEX:
			boolean sex=value.equals("true");//male true  female false
			user.setSex(sex);
			break;
		case ORGANIZATIONS:
			user.setOrganizations(value);
			break;
		case SALT:
			user.setSalt(value);
			break;
		case PASSWORD:
			try
			{
				byte[] salt = PasswordEncryptionService.generateSalt();
				user.setPassword(PasswordEncryptionService
						.bytesToHexString(PasswordEncryptionService
								.getEncryptedPassword(value,salt )));
				user.setSalt(PasswordEncryptionService.bytesToHexString(salt));
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			break;
		case PERMISSIONLEVEL:
			user.setPermissionLevel(value);
			break;
		case MAXCAPACITY:
			user.setMaxCapacity(Integer.parseInt(value));
			break;
		case USEDCAPACITY:
			user.setUsedCapacity(Integer.parseInt(value));
			break;
		case NOTTRACK:
			user.setNotTrack(value.equals("true"));
			break;
		case ISVERIFIED:
			user.setVerified(value.equals("true"));
		case EMAIL:
			user.setEmail(value);
			break;
		default:
			System.out.println("Parameters Error!");
			break;		
		
		}
		session.save(user);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
	/**
	 *  ���ݿ����user
	 * @param user
	 * @return ��ӽ��
	 */
	public  boolean addUser(User user){
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}
	/**
	 * ����userUUID��ȡuser����
	 * @param userUUID 
	 * @return user����
	 */
	public User getUserByUserUUID(String userUUID)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		User user=(User)session.get(User.class, userUUID);
		HibernateUtil.close(session);
		return user;
	}
	/**
	 * ���� identityȡ��userUUID
	 * @param identity
	 * @return ���ɹ�����user���󣬷��򷵻�null
	 */
	public User getUserByUserIdentity(String identity)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) session.createQuery("from User where userName =:userName").setParameter("userName", identity).list();
		HibernateUtil.close(session);
		if(users.size()==1)
			return users.get(0);
		else
			return null;
	
	}
	/**
	 * ���ע���룬
	 * @param userUUID �û���userUUID
	 * @param registerValidateCode ע����
	 * @return �����÷���user���󣬷��򷵻�null
	 */
	public User checkRegisterValidateCode(String userUUID, String registerValidateCode) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		User user=(User)session.get(User.class, userUUID);
		HibernateUtil.close(session);
		if(registerValidateCode.equals(user.getRegisterValidateCode()))
		{
			return user;
		}
		else
		{
			return null;
		}
	}
	public User checkLoginValidateCode(String userUUID, String loginValidateCode) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		User user=(User)session.get(User.class, userUUID);
		session.getTransaction().commit();
		HibernateUtil.close(session);
		if(loginValidateCode.equals(user.getLoginValidateCode()))
		{
			return user;
		}
		else
		{
			return null;
		}
	}
	/**
	 *  ��������Ƿ���ȷ
	 * @param identity ��ʶ�����û���userName
	 * @param plaintextPassword ��������
	 * @return
	 * @throws SQLException
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeySpecException
	 */
	public User IsExistUser(String identity,
			String plaintextPassword) throws SQLException,
			NoSuchAlgorithmException, InvalidKeySpecException {
		boolean isUser=false;
		User user=getUserByUserIdentity(identity);
		if(user==null)
			return null;
		String salt = user.getSalt();											
		String passwordEncrypted = user.getPassword();
		isUser = PasswordEncryptionService.authenticate(
						plaintextPassword, PasswordEncryptionService
								.hexStringToBytes(passwordEncrypted),
						PasswordEncryptionService.hexStringToBytes(salt));
			if (isUser) 
			{
				return user;
			}
			else
			{
				return null;
			}
		}
	/**
	 *  ����û����Ƿ����
	 * @param userName ��ѯ���û���
	 * @return ����true��ʾ����
	 */
	public boolean checkUserName(String userName)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) session.createQuery("from User where userName =:userName").setParameter("userName", userName).list();
		HibernateUtil.close(session);
		if(users.size()!=0)
			return false;
		else
			return true;
	}
	/**
	 *  ���email��ַ�Ƿ���ã�
	 * @param email ��ѯ��email��ַ
	 * @return ����true ��ʾemail��ַ����
	 */
	public boolean checkUserMail(String email)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) session.createQuery("from User where email =:email").setParameter("email", email).list();
		HibernateUtil.close(session);
		if(users.size()!=0)
			return false;
		else
			return true;
	}
	/**
	 * ���ؼ����û�����
	 * @return
	 * @throws SQLException
	 */
	public int getAllUserNum() throws SQLException
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		long num = (Long)session.createQuery("select count(*) from User where isVerified=true ").uniqueResult();
		return  (int) num;
	}
	
}
	

