package shu.mike.analysis;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import shu.mike.DAO.AnalyticsTokenDAO;
import shu.mike.bean.AnalyticsToken;

public class DataAnalysisUtil
{
	public static void main (String args[])
	{
		String result=getMostTokenWord("7a315bdfac764ce5a8f954f13888ffc3");
		System.out.println(result);
	}
	public static String getMostTokenWord(String userUUID)
	{
		System.out.println("userUUID"+userUUID);
		List<AnalyticsToken> analyticsTokenList=AnalyticsTokenDAO.getMostAnalyticsToken(userUUID);
		JSONArray tokenWordList=new JSONArray();
		JSONArray tokenWordObjList=new JSONArray();
		
		for(AnalyticsToken analyticsToken:analyticsTokenList)
		{
			tokenWordList.put(analyticsToken.getTokenWord());
			JSONObject obj=new JSONObject();
			obj.put("value", analyticsToken.getTimes());
			obj.put("name", analyticsToken.getTokenWord());
			tokenWordObjList.put(obj);
		}
		JSONArray result=new JSONArray();
		result.put(tokenWordList);
		result.put(tokenWordObjList);
		System.out.println(result.toString());
		return result.toString();
	}
}
