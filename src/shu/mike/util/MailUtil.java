package shu.mike.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import shu.mike.manage.Configuration;

public class MailUtil
{
	private Properties props;
	private Session session;
	private MimeMessage message;
	private String userName;
	private String passWord;
	private String smtpHost;
	public MailUtil()
	{
		userName=Configuration.getValue("EmailAccountUserName");
		passWord=Configuration.getValue("EmailAccountPassWord");
		smtpHost=Configuration.getValue("EmailAccountSmtpHost");
	}
	private void setUp()
	{
		 props=new Properties();
		 props.put("mail.smtp.host", smtpHost);
		 props.put("mail.form", userName);
		 props.put("mail.debug", "true");
		 props.put("mail.smtp.auth", "true");
		 props.put("mail.smtp.password",passWord);
		 props.setProperty("mail.transport.protocol", "smtp");
		 session = Session.getDefaultInstance(props, 
			    new javax.mail.Authenticator(){
			        protected PasswordAuthentication getPasswordAuthentication() {
			            return new PasswordAuthentication(
			            		userName,passWord);// Specify the Username and the PassWord
			        }
			});
	}

	private void createMessage(String basePath,String to,String userUUID,String validateCode) throws MessagingException
	{
		message=new MimeMessage(session);
		message.setFrom(new InternetAddress(userName));
		message.setRecipients(Message.RecipientType.TO,to);
		message.setSubject("welcome to ISearch");
		String bodyText="感谢您注册了ISearch帐号<br/>"
				+ "ISearch是一套实用的面向师生的个人云搜索引擎，ISearch搭建了个性化的面向学生的资源搜索平台，帮助您随时随地管理云端资料！激活账号请单击链接"
				+ "<a href=\""+basePath+"activateAccount.action?userUUID="+userUUID+"&validateCode="+validateCode+">激活账户</a>"
						+ "或者将      "+basePath+"activateAccount.action?userUUID="+userUUID+"&validateCode="+validateCode+"   复制到浏览器打开，有效时间为24小时。";
		message.setSentDate(new Date());
//        BodyPart mdp = new MimeBodyPart();   
//         mdp.setContent(bodyText, "text/html;charset=UTF-8");   
//         Multipart mm = new MimeMultipart();   
//         mm.addBodyPart(mdp);   
//         message.setContent(mm);   
		message.setText(bodyText);
         message.saveChanges();   
		Transport.send(message);
	}
	public static void sendMail(String basePath,String to,String userUUID,String validateCode)
	{
		MailUtil mu=new MailUtil();
		mu.setUp();
		try
		{
			mu.createMessage(basePath,to,userUUID,validateCode);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
