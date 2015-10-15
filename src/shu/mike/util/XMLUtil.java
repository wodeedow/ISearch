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
	 * @param xmlPath xml文件路径
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 * @throws IOException
	 */
	public XMLUtil()
	{
		
	}
	/**根据指定的XML文件路径得到对应的Document
	 * 
	 * @param xmlPath XMl文件路径
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
	 * 生成一个新的文档
	 * @param ID  String 使者的ID，root元素就是ID
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
	 * 保存xml文件
	 * @param fileName 文件名，包括路径
	 * @param doc 要输出的document
	 */
	public void saveXmlFile(String fileName, Document doc) 
	{
		//将Document输出到文件
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
	 * 创建一个新的目录
	 * @param fatherDirectoryUUID 父目录的UUID，如果父目录是根目录的话，那么fatherDirectoryUUID==null
	 * @param document 要创建目录的文档
	 * @param uuidString 新目录的UUID
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
			Element directoryNameNode=document.createElement("fileName");//为了gridpanel显示文件夹，文件名称统一使用fileName
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
	 * 根据uuidString和Document得到Node
	 * @param uuidString 目标的uuidString，如果查询根目录的话，uuidString.equals("home")
	 * @param document 要查询的文档
	 * @return
	 */
	private Node getNodeByUUID(String uuidString,Document document)
	{
		Node result=null;
		if(!uuidString.equals("home"))
		{
			NodeList tempList= document.getDocumentElement().getElementsByTagName("uuid");// 获取所有uuid元素，遍历
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
	 * 创建文件节点
	 * @param fatherDirectoryUUID 父目录的UUID，如果父目录是根目录的话，那么fatherDirectoryUUID==null
	 * @param fileNameString 要创建文件节点的文件名
	 * @param fileSizeString 文件大小（单位MB）
	 * @param uuidString 文件的uuid
	 * @param document 要创建目录的文档
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
	 * 根据父目录uuid==uuidString的查询条件，生成一个新的文档
	 * @param uuidString 查询条件
	 * @param ID 生成文档的root元素
	 * @param doc 查询的文档
	 * @return 查询结果 （document）
	 * @throws Exception
	 */
	public Document  getDirectoryFiles(String uuidString,String userName,Document doc) throws Exception
	{
		Document resultDoc=createDocument(userName);//创建新的文档用于输出
		Element root=resultDoc.getDocumentElement();//得到新建文档的root元素
		NodeList allFile;
		if(uuidString.equals("home"))
		{
			allFile=doc.getDocumentElement().getChildNodes();
			for(int i=0;i<allFile.getLength();i++)
			{
				if(allFile.item(i) instanceof Element)
				{
					Node targetNodeWithoutDir=resultDoc.createElement("File");//创建一个新的Element，是一个文件或者文件夹
					System.out.println(allFile.item(i).getNodeName());
					NodeList all=allFile.item(i).getChildNodes();
					
					for(int j=0;j<all.getLength();j++)
					{
						if(all.item(j) instanceof Element)
						{
							if(!all.item(j).getNodeName().equals("File"))//把子目录剔除
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
				Node targetNodeWithoutDir=resultDoc.createElement("File");//创建一个新的Element，是一个文件或者文件夹
				System.out.println("hello   "+allFile.item(i).getNodeName()+" "+allFile.item(i).getTextContent());
				if(allFile.item(i).getNodeName().equals("File"))//得到子目录或者文件
				{
					NodeList all=allFile.item(i).getChildNodes();				
					for(int j=0;j<all.getLength();j++)
					{
						if(all.item(j) instanceof Element)
						{
							System.out.println(all.item(j).getNodeName());
							if(!all.item(j).getNodeName().equals("File"))//把子目录剔除
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
	 * 把document转换成String用于返回
	 * @param doc 要转换的文档
	 * @return String 生成的结果
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
