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
		String bodyText="��л��ע����ISearch�ʺ�<br/>"
				+ "ISearch��һ��ʵ�õ�����ʦ���ĸ������������棬ISearch��˸��Ի�������ѧ������Դ����ƽ̨����������ʱ��ع����ƶ����ϣ������˺��뵥������"
				+ "<a href=\""+basePath+"activateAccount.action?userUUID="+userUUID+"&validateCode="+validateCode+">�����˻�</a>"
						+ "���߽�      "+basePath+"activateAccount.action?userUUID="+userUUID+"&validateCode="+validateCode+"   ���Ƶ�������򿪣���Чʱ��Ϊ24Сʱ��";
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
