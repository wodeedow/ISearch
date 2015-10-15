package shu.mike.page;
public abstract class Page
{
	protected int pageCount;
	protected int pageMaxSize;
	protected int maxItems;
	protected String userUUID;
	public  Page(String userUUID,int pageMaxSize)
	{
		this.userUUID=userUUID;
		this.pageMaxSize=pageMaxSize;
	}
	
	public int getPageCount()
	{
		return pageCount;
	}
	public int getPageMaxSize()
	{
		return pageMaxSize;
	}
	public void setPageMaxSize(int pageMaxSize)
	{
		this.pageMaxSize = pageMaxSize;
	}
}
