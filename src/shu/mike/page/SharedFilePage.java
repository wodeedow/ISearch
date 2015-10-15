package shu.mike.page;

import java.util.ArrayList;
import java.util.List;

import shu.mike.DAO.UserFileDAO;
import shu.mike.bean.UserFile;

public class SharedFilePage extends Page {

	public SharedFilePage(String userUUID, int pageMaxSize) {
		super(userUUID, pageMaxSize);
		new UserFileDAO();
		maxItems=UserFileDAO.getSharedFilesCount(userUUID);
		pageCount=maxItems/pageMaxSize;
		if(maxItems%pageMaxSize>0)
			pageCount++;
	}

	public List<UserFile> getResult(int currentPageIndex) {
		 int startIndex;
		 startIndex=(currentPageIndex-1)*pageMaxSize;
		 List<UserFile> result=new ArrayList<UserFile>();
		 result=UserFileDAO.getSharedFiles(userUUID, startIndex, pageMaxSize);
		 return result;
	}
}
