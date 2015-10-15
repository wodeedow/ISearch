package shu.mike.actionset;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import shu.mike.DAO.UserDAO;
import shu.mike.DAO.UserField;
import shu.mike.bean.User;
import shu.mike.file.FileOperation;
import shu.mike.manage.Configuration;
import shu.mike.util.CookieUtils;
import shu.mike.util.DateUtil;
import shu.mike.util.MailUtil;
import shu.mike.util.PasswordEncryptionService;
import shu.mike.util.UUIDUtil;

import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8406967497141549525L;
	private String userName;// 用户名
	private String email;// 邮箱
	private String phoneNumber;// 手机号
	private boolean sex;// 性别
	private String organizations;// 组织
	private String password;// 明文密码

	/*
	 * 注册标准用户
	 */
	public String activateAccount() throws NoSuchAlgorithmException,
			InvalidKeySpecException
	{
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		String userUUID = httpRequest.getParameter("userUUID");
		String validateCodeFromGet = httpRequest.getParameter("validateCode");
		UserDAO ud=new UserDAO();
		User user = null;
		try
		{	
			user=ud.checkRegisterValidateCode(userUUID, validateCodeFromGet);
			if(user!=null)
			{	
				HttpSession session=ServletActionContext.getRequest().getSession();
				session.setAttribute("USER_OBJ", user);
				session.setAttribute("USER_NAME", user.getUserName());
				session.setAttribute("USER_UUID", user.getUserUUID());
				ud.updateInfo(userUUID, UserField.ISVERIFIED,"true");
				FileOperation fo = new FileOperation(userUUID);
				fo.prepareSystem(user.getUserUUID(),user.getUserName());
				new CookieUtils().addCookie(user, ServletActionContext.getResponse());
				return SUCCESS;
			}
			else
			{
				return ERROR;
			}
					
		} catch (Exception e)
		{
			e.printStackTrace();
			return ERROR;
		}
	}

	/*
	 * 注册用户，没有经过邮箱验证。所以是临时用户
	 */
	public String registerUser()
	{
		if(register())
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	public boolean register()
	{
		try
		{
			HttpServletRequest request = ServletActionContext.getRequest();
			byte[] salt = PasswordEncryptionService.generateSalt();// get random
																	// salt
			String encryptedPassword = PasswordEncryptionService
					.bytesToHexString(PasswordEncryptionService
							.getEncryptedPassword(getPassword(), salt));// convert
																		// into
																		// hex
			String validateCode = PasswordEncryptionService
					.generateValidateCode(userName);// set the random
													// validatecode
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			Date deadLineDate = DateUtil.getAfterOneDay();
			User user = new User();
			user.setUserUUID(UUIDUtil.getUUID());
			user.setUserName(userName);
			user.setEmail(email);
			user.setPassword(encryptedPassword);
			user.setPermissionLevel(Configuration.getValue("defaultCapacity"));
			user.setPhoneNumber(phoneNumber);
			user.setOrganizations(organizations);
			user.setRegisterDate(new Date());
			user.setDeadLineDate(deadLineDate);
			user.setSalt(PasswordEncryptionService.bytesToHexString(salt));
			user.setMaxCapacity(Integer.parseInt(Configuration
					.getValue("defaultCapacity")));
			user.setRegisterValidateCode(validateCode);
			user.setVerified(false);
			user.setNotTrack(false);
			MailUtil.sendMail(basePath, email, user.getUserUUID(), validateCode);// send
			// the
			// mail

			if (new UserDAO().addUser(user))
			{
				FileOperation fo = new FileOperation(user.getUserUUID());
				fo.prepareSystem(user.getUserUUID(),user.getUserName());
				return true;
			} else
			{
				return false;
			}

		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getPhoneNum()
	{
		return phoneNumber;
	}

	public void setPhoneNum(String phoneNum)
	{
		this.phoneNumber = phoneNum;
	}

	public boolean isSex()
	{
		return sex;
	}

	public void setSex(boolean sex)
	{
		this.sex = sex;
	}

	public String getOrganizations()
	{
		return organizations;
	}

	public void setOrganizations(String organizations)
	{
		this.organizations = organizations;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public static long getSerialversionuid()
	{
		return serialVersionUID;
	}

}
