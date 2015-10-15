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
	 * 上传文件调用该函数，更新数据库和xml文件，返回是否更新成功
	 * @param fatherDirUUID  父目录的UUID （根目录为null）
	 * @param fileName 上传文件的文件名
	 * @param UUID 上传文件对应的UUID
	 * @return
	 * @throws SQLException 
	 */
	public boolean uploadFile(String fatherDirUUID,String fileName,String fileUUID,boolean isPublic) throws SQLException 
	{
		String realFilePath=FilePathUtil.UPLAOD_PATH+fileUUID+fileName.substring(fileName.lastIndexOf("."));//生成存储的真实文件名
		File target=new File(realFilePath);
		FileCapacityDAO fcd=new FileCapacityDAO();
		int fileSize=(int) (target.length()/1024);
		if(fcd.isAllowed(userUUID,fileSize))
		{
			XMLUtil xu=new XMLUtil();
			String xmlPath=FilePathUtil.XML_PATH+userUUID+".xml";//得到xml文件的路径
			Document doc;
			try{		
				doc=xu.getDocument(xmlPath);
				String lastModified=DateUtil.getFormatString(target.lastModified());//计算修改日期
				xu.createFileNode(fatherDirUUID, fileName, String.valueOf(fileSize), fileUUID, lastModified,isPublic, doc);//在xml中创建文件节点
				xu.saveXmlFile(xmlPath, doc);//保存xml文件
				UserFile file=new UserFile();
				file.setUserUUID(userUUID);
				file.setFileUUID(fileUUID);
				file.setFileName(fileName);
				file.setFileSize(fileSize);
				file.setPublic(isPublic);
				new UserFileDAO().addUserFile(file);
				createIndex(realFilePath,fileName,fileUUID,isPublic); //在索引库中创建索引
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

		String realFilePath=FilePathUtil.UPLAOD_PATH+fileUUID+fileName.substring(fileName.lastIndexOf("."));//生成存储的真实文件名
		File target=new File(realFilePath);
		FileCapacityDAO fcd=new FileCapacityDAO();
		int fileSize=(int ) target.length()/1024;
		if(fcd.isAllowed(userUUID,fileSize))
		{
			XMLUtil xu=new XMLUtil();
			String xmlPath=FilePathUtil.XML_PATH+userUUID+".xml";//得到xml文件的路径
			Document doc;
			try{		
				doc=xu.getDocument(xmlPath);
				String lastModified=DateUtil.getFormatString(target.lastModified());//计算修改日期
				xu.createFileNode(fatherDirUUID, fileName, String.valueOf(fileSize), fileUUID, lastModified,isPublic, doc);//在xml中创建文件节点
				xu.saveXmlFile(xmlPath, doc);//保存xml文件
				UserFile file=new UserFile();
				file.setUserUUID(userUUID);
				file.setFileUUID(fileUUID);
				file.setFileName(fileName);
				file.setFileSize(fileSize);
				file.setPublic(isPublic);
				file.setFileRemark(contents);
				new UserFileDAO().addUserFile(file);
				createIndex(realFilePath,fileName,fileUUID,isPublic,contents); //在索引库中创建索引
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
	 * 删除文件
	 * @param UUID 文件UUID，唯一标识
	 * @param isDirectory UUID标识的目录是否为文件夹
	 * @return
	 */
	public boolean deleteFile(String fileUUID,boolean isDirectory) 
	{
		try
		{
			FileCapacityDAO fcd=new FileCapacityDAO();
			ArrayList<String> allFiles=new ArrayList<String>();//递归列出所有待删除的文档
			XMLUtil xu=new XMLUtil();
			String xmlPath=FilePathUtil.XML_PATH+userUUID+".xml";//XML文件路径
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
				xu.deleteFile(allFiles.get(i), doc);//在xml文档中删除相关节点
				boolean isPublic=sfd.getInfoByFileUUID(UserFileField.ISPUBLIC, fileUUID).equals("true");//获取是否为共享文件
				UserFileDAO fileDAO=new UserFileDAO();
				String fileName=fileDAO.getInfoByFileUUID(UserFileField.FILENAME, fileUUID);
				fileDAO.deleteFile(fileUUID);//在数据库删除该记录
				String filePath=FilePathUtil.UPLAOD_PATH+userUUID+fileName.substring(fileName.lastIndexOf("."));//获取文件路径
				File temp=new File(filePath);
				temp.delete();//在磁盘中删除文件
				fcd.adjustCapacity(userUUID, -(int)temp.length()/1024);//调整用户网盘容量
				if(isPublic)
					deleteIndex(fileUUID,true);//删除公共索引
				deleteIndex(fileUUID,false);//删除私有索引
			}	
			if(isDirectory==true)
				xu.deleteFile(fileUUID, doc);
			xu.saveXmlFile(xmlPath,doc);//保存修改
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}

	}
	/***
	 * 重命名文件
	 * @param UUID 文件UUID ,唯一标识
	 * @param fileName 新的文件名
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
	 * 创建文件夹
	 * @param fileName 文件夹名称
	 * @param fatherDirectoryUUID 父目录文件夹的UUID
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
	 * 修改文件的共享状态
	 * @param UUID 文件的唯一标识符
	 * @param isPublic 文件的共享状态
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
	 * 创建文件索引
	 * @param UUID 文件的UUID唯一标识符
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
	 * 创建文档文件索引
	 * @param filePath  文件路径信息
	 * @param fileName 文件名
	 * @param UUID 文件的UUID唯一标识符
	 * @param isPublic 文件是否为公开文件
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
	 * 删除文件索引
	 * @param UUID 文件的UUID唯一标识
	 * @param isPublic 文件是否为共享文件, true 表示删除共享文件的索引  false表示删除私有文件索引
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
	 * 取消文件分享
	 * 1.xml文件更新
	 * 2.数据库更新
	 * 3。删除相关索引
	 * @param UUID
	 * @return
	 */
	public boolean cancelSharedFile(String fileUUID)
	{
		setIsPublic(fileUUID, false);//xml文件更新
		new UserFileDAO().updateInfoByFileUUID(UserFileField.ISPUBLIC, fileUUID, "false");
		try
		{
			deleteIndex(fileUUID,true);//删除共享文件相关索引
			return true;
		} catch (IOException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	public boolean shareFile(String fileUUID)
	{
		setIsPublic(fileUUID, true);//xml文件更新
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
