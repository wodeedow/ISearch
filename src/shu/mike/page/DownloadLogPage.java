package shu.mike.page;

import java.util.ArrayList;
import java.util.List;

import shu.mike.DAO.ResourceManagerLogDAO;
import shu.mike.DAO.ResourceManagerLogFileld;
import shu.mike.bean.ResourceManagerLog;

public class DownloadLogPage extends Page {

	public DownloadLogPage(String userUUID, int pageMaxSize) {
		super(userUUID, pageMaxSize);
		maxItems=ResourceManagerLogDAO.getResourceManagerLogCount(userUUID,ResourceManagerLogFileld.DOWNLOAD);
		pageCount=maxItems/pageMaxSize;
		if(maxItems%pageMaxSize>0)
			pageCount++;
	}
	public List<ResourceManagerLog> getResult(int currentPageIndex) {
		 int startIndex=(currentPageIndex-1)*pageMaxSize;
		 List<ResourceManagerLog> result=new ArrayList<ResourceManagerLog>();
		 result=ResourceManagerLogDAO.getUserResourceManagerLog(userUUID,ResourceManagerLogFileld.DOWNLOAD,startIndex,pageMaxSize);
		 return result;
	}
}
