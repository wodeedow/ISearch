package shu.mike.lucene;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.TreeSet;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;

import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;

import shu.mike.manage.Configuration;

public class ServerSearch {
	TreeSet<DocumentS> docset = new TreeSet<DocumentS>();
	Socket[] sockets = null;
	private int serverNum = 0;
	private ArrayBlockingQueue<DocumentS[]> queue = null;
	private int pageMaxSize = 0;
	private int port;
	private int privateHitsNum;
	private int publicHitsNum;
	public ServerSearch() {
		serverNum = Integer.parseInt(Configuration.getValue("serverNum"));
		port = Integer.parseInt(Configuration.getValue("port"));
		pageMaxSize = Integer.parseInt(Configuration.getValue("pageMaxSize"));

	}

	public int getpageMaxSize() {
		return pageMaxSize;
	}

	public ArrayList<DocumentS> searchPage(String fieldName, String value, int pageindex)
			throws InterruptedException {
		getTreeSetFromServer(fieldName, value);
		int startDoc = pageindex * pageMaxSize;
		int endDoc = Math.min(startDoc + pageMaxSize, docset.size());
		ArrayList<DocumentS> result=new ArrayList<DocumentS>();
		int index = 0;
		Iterator<DocumentS> iterator = docset.iterator();
		setPublicHitsNum(docset.size());
		while (true) {
			if (index >= startDoc && index < endDoc) {
				DocumentS doc = iterator.next();
				result.add(doc);
			}
			if (index >= endDoc) {
				break;
			}
			index++;

		}
		return result;

	}
	public ArrayList<DocumentS> searchPersonalPage(String userUUID,String fieldName, String value, int pageindex)
			throws InterruptedException, IOException, ParseException, InvalidTokenOffsetsException {
		DocumentS[] personalPage= getDocumentsFromPersonalServer(userUUID,fieldName,value) ;
		int startDoc = pageindex * pageMaxSize;
		int endDoc = Math.min(startDoc + pageMaxSize, personalPage.length);
		ArrayList<DocumentS> result=new ArrayList<DocumentS>();
		int index = 0;
		setPrivateHitsNum(personalPage.length);
		while (true) {
			if (index >= startDoc && index < endDoc) {
				DocumentS doc =personalPage[index];
				result.add(doc);
			}
			if (index >= endDoc) {
				break;
			}
			index++;

		}
		return result;

	}
	private DocumentS[]  getDocumentsFromPersonalServer(String userUUID,String fieldName,String value) throws IOException, ParseException, InvalidTokenOffsetsException
	{
		IndexSearch indexSearch=new IndexSearch(userUUID);
		DocumentS[] docss=indexSearch.searchByQueryParser(fieldName,value);
		return docss;
	}
	private void getTreeSetFromServer(String fieldName, String value)
			throws InterruptedException {
		sendToServer(fieldName, value);
		for (int i = 0; i < serverNum; i++) {
			DocumentS[] docs = queue.poll(20, TimeUnit.SECONDS);
			for (int j = 0; j < docs.length; j++) {
				docset.add(docs[j]);
			}

		}

	}

	private void sendToServer(String fieldName, String value) {
		queue = new ArrayBlockingQueue<DocumentS[]>(serverNum, true);// 实例化消息队列（根据服务器数目）
		java.util.Date d1 = new java.util.Date();
		sockets = new Socket[serverNum];
		for (int i = 0; i < serverNum; i++) {
			String getIPString = "ip" + i;
			getIPString=Configuration.getValue(getIPString);
			Socket socket;
			try {
				socket = new Socket(getIPString, port);
				sockets[i] = socket;
			} catch (NumberFormatException e) {
				System.out.println("the port number of configuration file is error !");
				e.printStackTrace();
			} catch (UnknownHostException e) {
				System.out.println("can not find the host!");
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println("IO error !");
				e.printStackTrace();
			}

		}
		java.util.Date d2 = new java.util.Date();
		System.out.println("连接到服务器用时：" + (d2.getTime() - d1.getTime()));
		// send message to servers.....
		java.util.Date d3 = new java.util.Date();
		for (int i = 0; i < serverNum; i++) {
			PrintWriter printWriter;
			try {
				printWriter = new PrintWriter(new BufferedWriter(
						new OutputStreamWriter(sockets[i].getOutputStream(),
								"utf-8")), true);
				printWriter.println(fieldName + "\r\n" + value);
				printWriter.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		java.util.Date d4 = new java.util.Date();
		System.out.println("发送信息请求用时：" + (d4.getTime() - d3.getTime()));
		java.util.Date d5 = new java.util.Date();
		// read message from servers....
		for (int i = 0; i < serverNum; i++) {
			QueryThread qt = new QueryThread(queue, sockets, i);
			qt.start();
		}
		java.util.Date d6 = new java.util.Date();
		System.out.println("获取回复用时:" + (d6.getTime() - d5.getTime()));
		/*
		 * for (int i = 0; i < serverNum; i++) { try { sockets[i].close(); }
		 * catch (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); } }
		 */
	}

	public int getPrivateHitsNum() {
		return privateHitsNum;
	}

	public void setPrivateHitsNum(int privateHitsNum) {
		this.privateHitsNum = privateHitsNum;
	}

	public int getPublicHitsNum() {
		return publicHitsNum;
	}

	public void setPublicHitsNum(int publicHitsNum) {
		this.publicHitsNum = publicHitsNum;
	}
}
