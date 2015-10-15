package shu.mike.page;

import java.util.ArrayList;
import java.util.List;

import shu.mike.DAO.LoginLogDAO;
import shu.mike.bean.LoginLog;

public class LoginLogPage extends Page {

	public LoginLogPage(String userUUID, int pageMaxSize) {
		super(userUUID, pageMaxSize);
		maxItems=LoginLogDAO.getUserLoginLogCount(userUUID);
		pageCount=maxItems/pageMaxSize;
		if(maxItems%pageMaxSize>0)
			pageCount++;
	}

	public List<LoginLog> getResult(int currentPageIndex) {
		 int startIndex;
		 startIndex=(currentPageIndex-1)*pageMaxSize;
		 List<LoginLog> result=new ArrayList<LoginLog>();
		 result=LoginLogDAO.getUserLoginLog(userUUID,startIndex,pageMaxSize);
		 return result;
	}

}
