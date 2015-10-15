package shu.mike.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;


import java.io.StringWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPathExpressionException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import shu.mike.file.FileOperation;
public class XMLUtil
{
	/**
	 * 
	 * @param xmlPath xml�ļ�·��
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 * @throws IOException
	 */
	public XMLUtil()
	{
		
	}
	/**����ָ����XML�ļ�·���õ���Ӧ��Document
	 * 
	 * @param xmlPath XMl�ļ�·��
	 * @return
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 * @throws IOException
	 */
	public Document getDocument(String xmlPath) 
	{
		
		try
		{
			DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();
			factory.setIgnoringComments(true);
			DocumentBuilder db=factory.newDocumentBuilder();
			Document doc=db.parse(new File(xmlPath));	
			return doc;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		
	}
	/**
	 * ����һ���µ��ĵ�
	 * @param ID  String ʹ�ߵ�ID��rootԪ�ؾ���ID
	 * @return
	 * @throws Exception
	 */
	public Document createDocument(String ID) throws Exception
	{
		DocumentBuilderFactory factory = DocumentBuilderFactory
                .newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document= builder.newDocument();
        Element root=document.createElement(ID);
		document.appendChild(root);	
		return document;
	}
	
	/**
	 * ����xml�ļ�
	 * @param fileName �ļ���������·��
	 * @param doc Ҫ�����document
	 */
	public void saveXmlFile(String fileName, Document doc) 
	{
		//��Document������ļ�
        TransformerFactory transFactory=TransformerFactory.newInstance();
        try {
            Transformer transformer = transFactory.newTransformer();
            transformer.setOutputProperty("indent", "yes");

            DOMSource source=new DOMSource();
            source.setNode(doc);
            StreamResult result=new StreamResult();
            result.setOutputStream(new FileOutputStream(fileName));
            
            transformer.transform(source, result);
        } catch (TransformerConfigurationException e) {
            e.printStackTrace();
        } catch (TransformerException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }   
    }

	/**
	 * ����һ���µ�Ŀ¼
	 * @param fatherDirectoryUUID ��Ŀ¼��UUID�������Ŀ¼�Ǹ�Ŀ¼�Ļ�����ôfatherDirectoryUUID==null
	 * @param document Ҫ����Ŀ¼���ĵ�
	 * @param uuidString ��Ŀ¼��UUID
	 * @throws XPathExpressionException
	 */
	public void createDirectoryNode(String directoryName,String fatherDirectoryUUID,Document document,String uuidString,boolean isPublicBool) throws XPathExpressionException
	{
		Node temp=getNodeByUUID(fatherDirectoryUUID, document);
		if(temp!=null)
		{
			Element newDirectory=document.createElement("File");//Element
			Element uuid=document.createElement("uuid");
			uuid.setTextContent(uuidString);
			Element isDirectory=document.createElement("isDirectory");
			isDirectory.setTextContent("true");
			Element directoryNameNode=document.createElement("fileName");//Ϊ��gridpanel��ʾ�ļ��У��ļ�����ͳһʹ��fileName
			directoryNameNode.setTextContent(directoryName);
			Element lastModified=document.createElement("lastModified");
			lastModified.setTextContent(DateUtil.getDateNowInFormatString());
			Element fileSize=document.createElement("fileSize");
			fileSize.setTextContent("-");
			Element isPublic=document.createElement("isPublic");
			isPublic.setTextContent(isPublicBool==true?"ture":"false");
			newDirectory.appendChild(uuid);
			newDirectory.appendChild(isDirectory);
			newDirectory.appendChild(directoryNameNode);
			newDirectory.appendChild(lastModified);		
			newDirectory.appendChild(fileSize);	
			newDirectory.appendChild(isPublic);	
			temp.appendChild(newDirectory);
		}
	
	}
	
	public boolean deleteFile(String uuidString,Document doc)
	{
		Node temp=getNodeByUUID(uuidString,doc);
		temp.getParentNode().removeChild(temp);
		return true;
	}
	public ArrayList<String> deleteFiles(String fatherDirectoryUUID,Document document)
	{
		ArrayList<String> result=new ArrayList<String>();
		Node temp=getNodeByUUID(fatherDirectoryUUID, document);
		if(temp!=null)
		{
			Queue<String> allDeleteFiles=new LinkedList<String>();
			Queue<String> allDirectorys=new LinkedList<String>();
			allDirectorys.offer(fatherDirectoryUUID);
			while(allDirectorys.isEmpty()!=true)
			{
				String uuidString=(String)allDirectorys.remove();
				getAllFiles(document,uuidString,allDeleteFiles,allDirectorys);
			}
			while(allDeleteFiles.isEmpty()==false)
			{
				result.add(allDeleteFiles.remove());
			}
			
		}
		return result;
	}
	private void getAllFiles(Document document,String uuidString,Queue<String> allDeleteFiles,Queue<String> allDirectorys)
	{
		Node temp= getNodeByUUID(uuidString,document);
		NodeList allFile=temp.getChildNodes();
		for(int i=0;i<allFile.getLength();i++)
		{
			if(allFile.item(i) instanceof Element)
			{
				System.out.println(allFile.item(i).getNodeName());
				NodeList all=allFile.item(i).getChildNodes();
				
				for(int j=0;j<all.getLength();j++)
				{
					if(all.item(j) instanceof Element)
					{
						if(all.item(j).getNodeName().equals("uuid"))
						{
							//System.out.println("uuid   "+all.item(j).getTextContent()+"****"+all.item(j).getNextSibling().getNextSibling().getNodeName());
							if(all.item(j).getNextSibling().getNextSibling().getTextContent().equals("true"))
							{
								allDirectorys.offer(all.item(j).getTextContent());
							}
							else if(all.item(j).getNextSibling().getNextSibling().getTextContent().equals("false"))
							{
								allDeleteFiles.offer(all.item(j).getTextContent());
							}
						}
					}
				}
				
			}
		}
	}
	
	/**
	 * ����uuidString��Document�õ�Node
	 * @param uuidString Ŀ���uuidString�������ѯ��Ŀ¼�Ļ���uuidString.equals("home")
	 * @param document Ҫ��ѯ���ĵ�
	 * @return
	 */
	private Node getNodeByUUID(String uuidString,Document document)
	{
		Node result=null;
		if(!uuidString.equals("home"))
		{
			NodeList tempList= document.getDocumentElement().getElementsByTagName("uuid");// ��ȡ����uuidԪ�أ�����
			for(int i=0;i<tempList.getLength();i++)
			{
				if(tempList.item(i) instanceof Element)
				{
					if(tempList.item(i).getTextContent().equals(uuidString))
					{
						Node temp=tempList.item(i).getParentNode();
						result=temp;
					}
				}
			}
			
		}
		else
		{
			result=document.getDocumentElement();
		}
		return result;
		
	}
	/**
	 * �����ļ��ڵ�
	 * @param fatherDirectoryUUID ��Ŀ¼��UUID�������Ŀ¼�Ǹ�Ŀ¼�Ļ�����ôfatherDirectoryUUID==null
	 * @param fileNameString Ҫ�����ļ��ڵ���ļ���
	 * @param fileSizeString �ļ���С����λMB��
	 * @param uuidString �ļ���uuid
	 * @param document Ҫ����Ŀ¼���ĵ�
	 * @throws XPathExpressionException
	 */
	public void createFileNode(String fatherDirectoryUUID,String fileNameString,String fileSizeString,String uuidString,String lastModifiedString,boolean isPublicBool,Document document) throws XPathExpressionException
	{
		Node temp=getNodeByUUID(fatherDirectoryUUID,document);
		if(temp!=null)
		{
			Element newFile=document.createElement("File");
			Element isDirectory=document.createElement("isDirectory");
			isDirectory.setTextContent("false");
			Element fileNameNode=document.createElement("fileName");
			fileNameNode.setTextContent(fileNameString);
			Element uuid=document.createElement("uuid");
			uuid.setTextContent(uuidString);
			Element fileSize=document.createElement("fileSize");
			fileSize.setTextContent(fileSizeString);
			Element lastModified=document.createElement("lastModified");
			lastModified.setTextContent(lastModifiedString);
			Element isPublic=document.createElement("isPublic");
			isPublic.setTextContent(isPublicBool==true?"true":"false");
			newFile.appendChild(uuid);			
			newFile.appendChild(isDirectory);
			newFile.appendChild(fileNameNode);
			newFile.appendChild(fileSize);
			newFile.appendChild(lastModified);
			newFile.appendChild(isPublic);
			temp.appendChild(newFile);
		}
		else
		{
			System.out.println("null!");
		}
	
	}
	
	/**
	 * ���ݸ�Ŀ¼uuid==uuidString�Ĳ�ѯ����������һ���µ��ĵ�
	 * @param uuidString ��ѯ����
	 * @param ID �����ĵ���rootԪ��
	 * @param doc ��ѯ���ĵ�
	 * @return ��ѯ��� ��document��
	 * @throws Exception
	 */
	public Document  getDirectoryFiles(String uuidString,String userName,Document doc) throws Exception
	{
		Document resultDoc=createDocument(userName);//�����µ��ĵ��������
		Element root=resultDoc.getDocumentElement();//�õ��½��ĵ���rootԪ��
		NodeList allFile;
		if(uuidString.equals("home"))
		{
			allFile=doc.getDocumentElement().getChildNodes();
			for(int i=0;i<allFile.getLength();i++)
			{
				if(allFile.item(i) instanceof Element)
				{
					Node targetNodeWithoutDir=resultDoc.createElement("File");//����һ���µ�Element����һ���ļ������ļ���
					System.out.println(allFile.item(i).getNodeName());
					NodeList all=allFile.item(i).getChildNodes();
					
					for(int j=0;j<all.getLength();j++)
					{
						if(all.item(j) instanceof Element)
						{
							if(!all.item(j).getNodeName().equals("File"))//����Ŀ¼�޳�
							{
								Node targetNode=resultDoc.importNode(all.item(j), true);								
								targetNodeWithoutDir.appendChild(targetNode);
								root.appendChild(targetNodeWithoutDir);
							}
						}
					}
					
				}
			}
		}
		else
		{
			 allFile=getNodeByUUID(uuidString,doc).getChildNodes();
		for(int i=0;i<allFile.getLength();i++)
		{
			if(allFile.item(i) instanceof Element)
			{
				Node targetNodeWithoutDir=resultDoc.createElement("File");//����һ���µ�Element����һ���ļ������ļ���
				System.out.println("hello   "+allFile.item(i).getNodeName()+" "+allFile.item(i).getTextContent());
				if(allFile.item(i).getNodeName().equals("File"))//�õ���Ŀ¼�����ļ�
				{
					NodeList all=allFile.item(i).getChildNodes();				
					for(int j=0;j<all.getLength();j++)
					{
						if(all.item(j) instanceof Element)
						{
							System.out.println(all.item(j).getNodeName());
							if(!all.item(j).getNodeName().equals("File"))//����Ŀ¼�޳�
							{
								Node targetNode=resultDoc.importNode(all.item(j), true);								
								targetNodeWithoutDir.appendChild(targetNode);
								root.appendChild(targetNodeWithoutDir);
							}
						}
					}
					
				}
				
				
			}
		}
		}
		return resultDoc;			
	}
	/**
	 * ��documentת����String���ڷ���
	 * @param doc Ҫת�����ĵ�
	 * @return String ���ɵĽ��
	 * 
	 */
	public void reNameFile(String UUID,String fileName,Document doc)
	{
		Node temp=getNodeByUUID(UUID,doc);
		NodeList allNode=temp.getChildNodes();
		for(int i=0;i<allNode.getLength();i++)
		{
			if(allNode.item(i) instanceof Element)
			{
				if(allNode.item(i).getNodeName().equals("fileName"))
				{
					allNode.item(i).setTextContent(fileName);
				}
			}
		}
	}
	public void setIsPublic(String UUID,boolean isPublic,Document doc)
	{
		Node temp=getNodeByUUID(UUID,doc);
		NodeList allNode=temp.getChildNodes();
		for(int i=0;i<allNode.getLength();i++)
		{
			if(allNode.item(i) instanceof Element)
			{
				if(allNode.item(i).getNodeName().equals("isPublic"))
				{
					allNode.item(i).setTextContent(isPublic==true?"true":"false");
				}
			}
		}
	}
	public  String documentToString(Document doc)
	{
        try {
        	StringWriter   sw   =   new   StringWriter();        	  
            Transformer   serializer   =   TransformerFactory.newInstance().newTransformer();  
            serializer.transform(new  DOMSource(doc),   new   StreamResult(sw));  
            return   sw.toString();  
        } catch (TransformerConfigurationException e) {        	
            e.printStackTrace();
            return null;
        } catch (TransformerException e) {
            e.printStackTrace();
            return null;
        }   
    }
}
