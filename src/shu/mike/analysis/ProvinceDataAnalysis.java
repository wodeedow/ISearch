package shu.mike.analysis;

import org.json.JSONArray;
import org.json.JSONObject;

import shu.mike.DAO.LoginLogDAO;
import shu.mike.DAO.ResourceManagerLogFileld;

public class ProvinceDataAnalysis
{
	private String provinceName[];
	public ProvinceDataAnalysis(String[] provinceName)
	{
		super();
		this.provinceName = provinceName;
	}
	public String getData(AnalysisType analysisType)
	{
		switch(analysisType)
		{
		case PROVINCElOGINlOG:
			return getLoginLog();
		case PROVINCEUPLOADLOG:
			return getUploadLog();
		case PROVINCEDOWNLOADLOG:
			return getDownloadLog();
		default:
			System.out.println(ProvinceDataAnalysis.class.toString()+"   params error!");
		}
		return null;
	}
	private String getLoginLog()
	{
		JSONArray provinceData=new JSONArray();
		LoginLogAnalysis analysis=new LoginLogAnalysis();
		JSONArray provinceNameJSON=new JSONArray(provinceName);
		for(String province:provinceName)
		{
			JSONObject temp=new JSONObject();
			temp.put("name", province);
			temp.put("type", "line");
			temp.put("stack", "总量");
			temp.put("data", new JSONArray(analysis.getWeekProvinceLoginLog(province)));
			provinceData.put(temp);
		}
		JSONObject result=new JSONObject();
		result.put("provinceName", provinceNameJSON);
		result.put("provinceData", provinceData);
		return result.toString();
	}
	private String getUploadLog()
	{
		JSONArray provinceData=new JSONArray();
		ResourceManagerLogAnalysis resource=new ResourceManagerLogAnalysis();
			
		JSONArray provinceNameJSON=new JSONArray(provinceName);
		for(String province:provinceName)
		{
			JSONObject temp=new JSONObject();
			temp.put("name", province);
			temp.put("type", "line");
			temp.put("stack", "总量");
			temp.put("data", new JSONArray(resource.getWeekProvinceResourceLog(ResourceManagerLogFileld.UPLOAD, province)));
			provinceData.put(temp);
		}
		JSONObject result=new JSONObject();
		result.put("provinceName", provinceNameJSON);
		result.put("provinceData", provinceData);
		return result.toString();
	}
	private String getDownloadLog()
	{
		JSONArray provinceData=new JSONArray();
		ResourceManagerLogAnalysis resource=new ResourceManagerLogAnalysis();
			
		JSONArray provinceNameJSON=new JSONArray(provinceName);
		for(String province:provinceName)
		{
			JSONObject temp=new JSONObject();
			temp.put("name", province);
			temp.put("type", "line");
			temp.put("stack", "总量");
			temp.put("data", new JSONArray(resource.getWeekProvinceResourceLog(ResourceManagerLogFileld.DOWNLOAD, province)));
			provinceData.put(temp);
		}
		JSONObject result=new JSONObject();
		result.put("provinceName", provinceNameJSON);
		result.put("provinceData", provinceData);
		return result.toString();
	}

}
