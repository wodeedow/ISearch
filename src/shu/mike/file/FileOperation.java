package shu.mike.file;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import org.w3c.dom.Document;

import shu.mike.DAO.FileCapacityDAO;
import shu.mike.DAO.UserFileDAO;
import shu.mike.DAO.UserFileField;
import shu.mike.bean.UserFile;
import shu.mike.lucene.IndexManager;
import shu.mike.util.DateUtil;
import shu.mike.util.UUIDUtil;
import shu.mike.util.XMLUtil;

public class FileOperation {
	private String userUUID;
	public FileOperation(String userUUID)
	{
		this.userUUID=userUUID;
	}
	/**
	 * �ϴ��ļ����øú������������ݿ��xml�ļ��������Ƿ���³ɹ�
	 * @param fatherDirUUID  ��Ŀ¼��UUID ����Ŀ¼Ϊnull��
	 * @param fileName �ϴ��ļ����ļ���
	 * @param UUID �ϴ��ļ���Ӧ��UUID
	 * @return
	 * @throws SQLException 
	 */
	public boolean uploadFile(String fatherDirUUID,String fileName,String fileUUID,boolean isPublic) throws SQLException 
	{
		String realFilePath=FilePathUtil.UPLAOD_PATH+fileUUID+fileName.substring(fileName.lastIndexOf("."));//���ɴ洢����ʵ�ļ���
		File target=new File(realFilePath);
		FileCapacityDAO fcd=new FileCapacityDAO();
		int fileSize=(int) (target.length()/1024);
		if(fcd.isAllowed(userUUID,fileSize))
		{
			XMLUtil xu=new XMLUtil();
			String xmlPath=FilePathUtil.XML_PATH+userUUID+".xml";//�õ�xml�ļ���·��
			Document doc;
			try{		
				doc=xu.getDocument(xmlPath);
				String lastModified=DateUtil.getFormatString(target.lastModified());//�����޸�����
				xu.createFileNode(fatherDirUUID, fileName, String.valueOf(fileSize), fileUUID, lastModified,isPublic, doc);//��xml�д����ļ��ڵ�
				xu.saveXmlFile(xmlPath, doc);//����xml�ļ�
				UserFile file=new UserFile();
				file.setUserUUID(userUUID);
				file.setFileUUID(fileUUID);
				file.setFileName(fileName);
				file.setFileSize(fileSize);
				file.setPublic(isPublic);
				new UserFileDAO().addUserFile(file);
				createIndex(realFilePath,fileName,fileUUID,isPublic); //���������д�������
				return true;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				return false;
			}
		}
		else
		{
			return false;
		}
		
		
	}
	public boolean uploadFile(String fatherDirUUID,String fileName,String fileUUID,boolean isPublic,String contents) throws SQLException 
	{

		String realFilePath=FilePathUtil.UPLAOD_PATH+fileUUID+fileName.substring(fileName.lastIndexOf("."));//���ɴ洢����ʵ�ļ���
		File target=new File(realFilePath);
		FileCapacityDAO fcd=new FileCapacityDAO();
		int fileSize=(int ) target.length()/1024;
		if(fcd.isAllowed(userUUID,fileSize))
		{
			XMLUtil xu=new XMLUtil();
			String xmlPath=FilePathUtil.XML_PATH+userUUID+".xml";//�õ�xml�ļ���·��
			Document doc;
			try{		
				doc=xu.getDocument(xmlPath);
				String lastModified=DateUtil.getFormatString(target.lastModified());//�����޸�����
				xu.createFileNode(fatherDirUUID, fileName, String.valueOf(fileSize), fileUUID, lastModified,isPublic, doc);//��xml�д����ļ��ڵ�
				xu.saveXmlFile(xmlPath, doc);//����xml�ļ�
				UserFile file=new UserFile();
				file.setUserUUID(userUUID);
				file.setFileUUID(fileUUID);
				file.setFileName(fileName);
				file.setFileSize(fileSize);
				file.setPublic(isPublic);
				file.setFileRemark(contents);
				new UserFileDAO().addUserFile(file);
				createIndex(realFilePath,fileName,fileUUID,isPublic,contents); //���������д�������
				return true;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	/**
	 * ɾ���ļ�
	 * @param UUID �ļ�UUID��Ψһ��ʶ
	 * @param isDirectory UUID��ʶ��Ŀ¼�Ƿ�Ϊ�ļ���
	 * @return
	 */
	public boolean deleteFile(String fileUUID,boolean isDirectory) 
	{
		try
		{
			FileCapacityDAO fcd=new FileCapacityDAO();
			ArrayList<String> allFiles=new ArrayList<String>();//�ݹ��г����д�ɾ�����ĵ�
			XMLUtil xu=new XMLUtil();
			String xmlPath=FilePathUtil.XML_PATH+userUUID+".xml";//XML�ļ�·��
			Document doc=xu.getDocument(xmlPath);
			UserFileDAO sfd=new UserFileDAO();
			if(!isDirectory)
			{
				allFiles.add(fileUUID);
			}
			else
			{
				allFiles=xu.deleteFiles(fileUUID, doc);
			}
			for(int i=0;i<allFiles.size();i++)
			{
				xu.deleteFile(allFiles.get(i), doc);//��xml�ĵ���ɾ����ؽڵ�
				boolean isPublic=sfd.getInfoByFileUUID(UserFileField.ISPUBLIC, fileUUID).equals("true");//��ȡ�Ƿ�Ϊ�����ļ�
				UserFileDAO fileDAO=new UserFileDAO();
				String fileName=fileDAO.getInfoByFileUUID(UserFileField.FILENAME, fileUUID);
				fileDAO.deleteFile(fileUUID);//�����ݿ�ɾ���ü�¼
				String filePath=FilePathUtil.UPLAOD_PATH+userUUID+fileName.substring(fileName.lastIndexOf("."));//��ȡ�ļ�·��
				File temp=new File(filePath);
				temp.delete();//�ڴ�����ɾ���ļ�
				fcd.adjustCapacity(userUUID, -(int)temp.length()/1024);//�����û���������
				if(isPublic)
					deleteIndex(fileUUID,true);//ɾ����������
				deleteIndex(fileUUID,false);//ɾ��˽������
			}	
			if(isDirectory==true)
				xu.deleteFile(fileUUID, doc);
			xu.saveXmlFile(xmlPath,doc);//�����޸�
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}

	}
	/***
	 * �������ļ�
	 * @param UUID �ļ�UUID ,Ψһ��ʶ
	 * @param fileName �µ��ļ���
	 * @return
	 */
	public boolean renameFile(String fileUUID,String fileName)
	{
		XMLUtil xu=new XMLUtil();
		String xmlPath=FilePathUtil.XML_PATH+userUUID+".xml";
		try {
			Document doc=xu.getDocument(xmlPath);
			xu.reNameFile(fileUUID, fileName, doc);
			xu.saveXmlFile(xmlPath, doc);
			new UserFileDAO().renamefile(fileUUID, fileName);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * �����ļ���
	 * @param fileName �ļ�������
	 * @param fatherDirectoryUUID ��Ŀ¼�ļ��е�UUID
	 * @return
	 */
	public boolean createDirectory(String fileName,String fatherDirectoryUUID)
	{
		XMLUtil xu=new XMLUtil();
		String xmlPath=FilePathUtil.XML_PATH+userUUID+".xml";
		String UUID=UUIDUtil.getUUID();
		try {
			Document doc=xu.getDocument(xmlPath);
			xu.createDirectoryNode(fileName, fatherDirectoryUUID, doc, UUID,false);
			xu.saveXmlFile(xmlPath, doc);
			return true;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * �޸��ļ��Ĺ���״̬
	 * @param UUID �ļ���Ψһ��ʶ��
	 * @param isPublic �ļ��Ĺ���״̬
	 * @return
	 */
	public boolean setIsPublic(String UUID,boolean isPublic)
	{
		XMLUtil xu=new XMLUtil();
		String xmlPath=FilePathUtil.XML_PATH+userUUID+".xml";
		try {
			Document doc=xu.getDocument(xmlPath);
			xu.setIsPublic(UUID, isPublic, doc);
			xu.saveXmlFile(xmlPath, doc);
			return true;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * �����ļ�����
	 * @param UUID �ļ���UUIDΨһ��ʶ��
	 * @return
	 * @throws SQLException
	 */
	public boolean createIndex(String fileUUID) throws SQLException
	{
		UserFileDAO  sfd=new UserFileDAO();
		String realFileName=sfd.getInfoByFileUUID(UserFileField.FILENAME, fileUUID);
		String fileType=realFileName.substring(realFileName.lastIndexOf("."));
		String filePath=FilePathUtil.UPLAOD_PATH+fileUUID+fileType;
		IndexManager im=new IndexManager();
		if(FileType.isAudioType(fileType))
		{
			im.writeIndex(filePath,realFileName,fileUUID,sfd.getInfoByFileUUID(UserFileField.FILEREMARK, fileUUID));
		}
		else
		{
			im.writeIndex(filePath,realFileName,fileUUID);
		}
		return true;
	}
	/**
	 * �����ĵ��ļ�����
	 * @param filePath  �ļ�·����Ϣ
	 * @param fileName �ļ���
	 * @param UUID �ļ���UUIDΨһ��ʶ��
	 * @param isPublic �ļ��Ƿ�Ϊ�����ļ�
	 * @throws IOException
	 */
	private void createIndex(String filePath,String fileName,String fileUUID,boolean isPublic) throws IOException
	{
		if(!isPublic)
		{
			String indexPath=FilePathUtil.BASE_PATH+"/index/"+userUUID;
			File temp=new File(indexPath);
			if(!temp.exists())
				temp.mkdir();
			IndexManager im=new IndexManager(indexPath);
			im.writeIndex(filePath,fileName,fileUUID);
		}
		else
		{
			IndexManager im=new IndexManager();
			im.writeIndex(filePath,fileName,fileUUID);
		}
		
	}
	private void createIndex(String filePath,String fileName,String fileUUID,boolean isPublic,String contents) throws IOException
	{
		if(!isPublic)
		{
			String indexPath=FilePathUtil.BASE_PATH+"/index/"+userUUID;
			File temp=new File(indexPath);
			if(!temp.exists())
				temp.mkdir();
			IndexManager im=new IndexManager(indexPath);
			im.writeIndex(filePath,fileName,fileUUID,contents);
		}
		else
		{
			IndexManager im=new IndexManager();
			im.writeIndex(filePath,fileName,fileUUID,contents);
		}
		
	}
	/**
	 * ɾ���ļ�����
	 * @param UUID �ļ���UUIDΨһ��ʶ
	 * @param isPublic �ļ��Ƿ�Ϊ�����ļ�, true ��ʾɾ�������ļ�������  false��ʾɾ��˽���ļ�����
	 * @throws IOException 
	 */
	public  void deleteIndex(String UUID,boolean isPublic) throws IOException
	{
		
		if(!isPublic)
		{
			String indexPath=FilePathUtil.BASE_PATH+"/index/"+userUUID;
			IndexManager im=new IndexManager(indexPath);
			im.deleteIndex(UUID);
		}
		else
		{
			IndexManager im=new IndexManager();
			im.deleteIndex(UUID);
		}
	}
	public void prepareSystem(String userUUID,String usrName)
	{
		String indexPath=FilePathUtil.BASE_PATH+"/index/"+userUUID;
		File temp=new File(indexPath);
		if(!temp.exists())
			temp.mkdir();
		XMLUtil xu=new XMLUtil();
		try {
			Document doc=xu.createDocument(usrName);
			xu.saveXmlFile(FilePathUtil.XML_PATH+userUUID+".xml", doc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * ȡ���ļ�����
	 * 1.xml�ļ�����
	 * 2.���ݿ����
	 * 3��ɾ���������
	 * @param UUID
	 * @return
	 */
	public boolean cancelSharedFile(String fileUUID)
	{
		setIsPublic(fileUUID, false);//xml�ļ�����
		new UserFileDAO().updateInfoByFileUUID(UserFileField.ISPUBLIC, fileUUID, "false");
		try
		{
			deleteIndex(fileUUID,true);//ɾ�������ļ��������
			return true;
		} catch (IOException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	public boolean shareFile(String fileUUID)
	{
		setIsPublic(fileUUID, true);//xml�ļ�����
		UserFileDAO userFileDAO=new UserFileDAO();
		userFileDAO.updateInfoByFileUUID(UserFileField.ISPUBLIC, fileUUID, "true");
		try
		{
			createIndex(fileUUID);
			return true;
		} catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
}
