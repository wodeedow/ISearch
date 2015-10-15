package shu.mike.DAO;

import java.sql.SQLException;
import shu.mike.bean.User;


public class FileCapacityDAO {

	public boolean adjustCapacity(String userUUID,int  fileSize) throws SQLException
	{
		UserDAO ud=new UserDAO();
		User user=ud.getUserByUserUUID(userUUID);
		int  newSize=user.getUsedCapacity()+fileSize;
		if(newSize<user.getMaxCapacity())
		{
			user.setUsedCapacity(newSize);
			return true;
		}
		else
		{
			return false;
		}
		
	}
	public boolean isAllowed(String userUUID,int fileSize) throws SQLException
	{
		UserDAO ud=new UserDAO();
		User user=ud.getUserByUserUUID(userUUID);
		int  newSize=user.getUsedCapacity()+fileSize;
		if(newSize<user.getMaxCapacity())
		{
			return true;
		}
		else
		{
			return false;
		}
	}

}
