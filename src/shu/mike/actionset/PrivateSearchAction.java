package shu.mike.actionset;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import shu.mike.DAO.HistoryDAO;
import shu.mike.bean.History;
import shu.mike.bean.User;
import shu.mike.lucene.DocumentS;
import shu.mike.lucene.ServerSearch;
import shu.mike.util.UUIDUtil;

public class PrivateSearchAction extends ActionSupport
{
	private static final long serialVersionUID = 783721622590970619L;
	private ArrayList<DocumentS> privateDocumentS;
	private ArrayList<String> recommendations;
	private String searchValue;
	private int privateTotalHits;
	private int pageIndex;
	public String execute() {
		
		HttpServletRequest httpRequest= ServletActionContext.getRequest();
		HttpSession session=httpRequest.getSession();
		User user=(User) session.getAttribute("USER_OBJ");
		if(user!=null)
		{
			ServerSearch search=new ServerSearch();
			try {
				privateDocumentS=search.searchPersonalPage(user.getUserUUID(),"contents", searchValue, pageIndex);
				setPrivateTotalHits(search.getPrivateHitsNum());
				History history=generateHistory(user.getUserUUID(),searchValue,httpRequest.getRemoteAddr());
				new HistoryDAO().addHistory(history);
				return SUCCESS;
			} catch (Exception e) 
			{
				e.printStackTrace();
				return ERROR;
			}		
		}
		return LOGIN;
	}
	public ArrayList<DocumentS> getPrivateDocumentS()
	{
		return privateDocumentS;
	}
	public void setPrivateDocumentS(ArrayList<DocumentS> privateDocumentS)
	{
		this.privateDocumentS = privateDocumentS;
	}
	public ArrayList<String> getRecommendations()
	{
		return recommendations;
	}
	public void setRecommendations(ArrayList<String> recommendations)
	{
		this.recommendations = recommendations;
	}
	public String getSearchValue()
	{
		return searchValue;
	}
	public void setSearchValue(String searchValue)
	{
		this.searchValue = searchValue;
	}
	public int getPrivateTotalHits()
	{
		return privateTotalHits;
	}
	public void setPrivateTotalHits(int privateTotalHits)
	{
		this.privateTotalHits = privateTotalHits;
	}
	public int getPageIndex()
	{
		return pageIndex;
	}
	public void setPageIndex(int pageIndex)
	{
		this.pageIndex = pageIndex;
	}
	/**
	 * 在数据库中插入搜索记录，用户明可以为null
	 * @param ObjectUUID 
	 * @param searchContents 
	 * @param ip
	 */
	private History generateHistory(String userUUID,String searchContents,String ip)
	{
		History history=new History();
		history.setRandomUUID(UUIDUtil.getUUID());
		history.setContents(searchContents);
		history.setIp(ip);
		history.setSearchDate(new Date());
		history.setUserUUID(userUUID);
		return history;
	}
	
}
