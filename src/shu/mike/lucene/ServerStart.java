package shu.mike.lucene;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import shu.mike.manage.Configuration;

	public class ServerStart {
		public static void main(String[] agrs)
		{
			receiveServer();		
		}
		public static  void  receiveServer() { 
			ServerSocket rServer=null; 	//ServerSocket
			Socket request=null; 
			final int RECEIVE_PORT=Integer.parseInt(Configuration.getValue("port"));
			Thread receiveThread=null; 
			try
			{ 
				rServer=new ServerSocket(RECEIVE_PORT); //
				while(true){ //绛夊緟鐢ㄦ埛璇锋�? 
				request=rServer.accept(); //鎺ユ敹�?�㈡埛鏈鸿繛鎺ヨ姹�? 
				receiveThread=new serverThread(request); //鐢熸垚serverThread鐨勫疄渚�? 
				receiveThread.start(); //鍚姩serverThread绾跨�? 
			} 
		}catch(IOException e){ 
		System.out.println(e.getMessage());} 
		} 
		
	}
	
	
	class serverThread extends Thread
	{
		private Socket socket=null;
		public serverThread(Socket socket)
		{
			this.socket=socket;
		}
		public void run ()
		{
			ObjectOutputStream objos=null;
			try
			{
				BufferedReader is =new BufferedReader(new InputStreamReader(socket.getInputStream(),"UTF-8"));
				String contents=is.readLine();
				String keyword=is.readLine();
				System .out.println (contents);
				System .out.println (keyword);
				IndexSearch indexSearch=new IndexSearch();
				DocumentS[] docss=indexSearch.searchByQueryParser(contents,keyword);
				objos=new ObjectOutputStream(socket.getOutputStream());
				objos.writeObject(docss);
				objos.flush ();
			} 
			catch (Exception e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

