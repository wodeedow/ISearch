package shu.mike.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import shu.mike.manage.Configuration;

public class BaseDAO {
	private  String dbURL;
	private  String userName;
	private  String userPwd;
	protected Connection connection =null;
	public String getDbURL() {
		return dbURL;
	}
	public void setDbURL(String dbURL) {
		this.dbURL = dbURL;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public Connection getConnection() {
		return connection;
	}
	public void setConnection(Connection connection) {
		this.connection = connection;
	}
	public BaseDAO ()
	{
		dbURL=Configuration.getValue("dbURL");
		userName=Configuration.getValue("userName");
		userPwd=Configuration.getValue("userPwd");
	}
	public  BaseDAO (String dbURL, String userName, String userPwd) {
		super();
		this.dbURL = dbURL;
		this.userName = userName;
		this.userPwd = userPwd;
	}
	public void initConnection()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection =DriverManager.getConnection(dbURL, userName, userPwd);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public  void closeConnection()
	{
		if(connection!=null)
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}
