package shu.mike.actionset;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import shu.mike.DAO.HistoryDAO;
import shu.mike.bean.History;
import shu.mike.bean.User;
import shu.mike.jena.JenaUtils;
import shu.mike.lucene.DocumentS;
import shu.mike.lucene.ServerSearch;
import shu.mike.util.UUIDUtil;

import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1521052806965466530L;
	private ArrayList<DocumentS> publicDocuments;
	private ArrayList<DocumentS> privateDocumentS;
	private ArrayList<String> recommendations;
	private String searchValue;
	private int privateTotalHits;
	private int publicTotalHits;
	private int pageIndex=0;
	public String execute() {
	
		HttpServletRequest httpRequest= ServletActionContext.getRequest();
		HttpSession session=httpRequest.getSession();
		User user=(User) session.getAttribute("USER_OBJ");
		if(user!=null)
		{
			ServerSearch search=new ServerSearch();
			try {
				publicDocuments=search.searchPage("contents", searchValue, pageIndex);
				setPublicTotalHits(search.getPublicHitsNum());
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
	public String publicSearch() {
		HttpServletRequest httpRequest= ServletActionContext.getRequest();
		User user=(User) httpRequest.getSession().getAttribute("USER_OBJ");
		String userUUID="";
		if(user!=null)
			userUUID=user.getUserUUID();
		ServerSearch search=new ServerSearch();
		try {
			publicDocuments=search.searchPage("contents", searchValue, pageIndex);
			setPublicTotalHits(search.getPublicHitsNum());
			setRecommendations(JenaUtils.getRecommendationList(searchValue));//关键词推荐
			History history=generateHistory(userUUID,searchValue,httpRequest.getRemoteAddr());
			new HistoryDAO().addHistory(history);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}		
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
	
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public ArrayList<DocumentS> getPublicDocuments() {
		return publicDocuments;
	}

	public void setPublicDocuments(ArrayList<DocumentS> publicDocuments) {
		this.publicDocuments = publicDocuments;
	}

	public ArrayList<DocumentS> getPrivateDocumentS() {
		return privateDocumentS;
	}

	public void setPrivateDocumentS(ArrayList<DocumentS> privateDocumentS) {
		this.privateDocumentS = privateDocumentS;
	}
	public int getPrivateTotalHits() {
		return privateTotalHits;
	}
	public void setPrivateTotalHits(int privateTotalHits) {
		this.privateTotalHits = privateTotalHits;
	}
	public int getPublicTotalHits() {
		return publicTotalHits;
	}
	public void setPublicTotalHits(int publicTotalHits) {
		this.publicTotalHits = publicTotalHits;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public ArrayList<String> getRecommendations() {
		return recommendations;
	}
	public void setRecommendations(ArrayList<String> recommendations) {
		this.recommendations = recommendations;
	}
}
