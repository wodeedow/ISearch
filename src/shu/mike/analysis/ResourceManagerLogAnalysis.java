package shu.mike.analysis;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import shu.mike.DAO.ResourceManagerLogDAO;
import shu.mike.DAO.ResourceManagerLogFileld;
import shu.mike.DAO.UserDAO;
import shu.mike.bean.ResourceManagerLog;

public class ResourceManagerLogAnalysis
{
	public int[] getWeekResourceLog(ResourceManagerLogFileld field,String userUUID)
	{
		return formatResult(ResourceManagerLogDAO.getWeekResourceLog(field,userUUID));
	}
	public int[] getWeekResourceLog(ResourceManagerLogFileld field,boolean useAverage)
	{
		if(!useAverage)
		{
			return formatResult(ResourceManagerLogDAO.getWeekResourceLog(field));
		}
		else
		{
			int[] result=formatResult(ResourceManagerLogDAO.getWeekResourceLog(field));
			int allNum;
			try
			{
				allNum = new UserDAO().getAllUserNum();
				for(int i=0;i<result.length;i++)
					result[i]/=allNum;
				return result;
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
			
		}
		
	}
	public int[] getWeekProvinceResourceLog(ResourceManagerLogFileld field,String provinceName)
	{
		return formatResult(ResourceManagerLogDAO.getWeekProvinceResourceLog(field, provinceName));
	}
	private int[] formatResult(List<ResourceManagerLog> result) {
		int[] resultOutput = new int[7];
		Map<String, Integer> allResult = new HashMap<String, Integer>();
		for (int i = 0; i < result.size(); i++) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(result.get(i).getLoadDate());
			String month = cal.get(Calendar.MONTH) + 1 + "-"
					+ cal.get(Calendar.DAY_OF_MONTH);
			if (allResult.containsKey(month))// 将结果放入hashmap中
			{
				allResult.put(month, (Integer) allResult.get(month) + 1);
			} else {
				allResult.put(month, 1);
			}
		}
		for (int i = 0; i < 7; i++) {
			Calendar calCurent = Calendar.getInstance();
			calCurent.add(Calendar.DAY_OF_MONTH, i - 7);//
			String month = calCurent.get(Calendar.MONTH) + 1 + "-"
					+ calCurent.get(Calendar.DAY_OF_MONTH);
			if (allResult.containsKey(month)) {
				resultOutput[i] = allResult.get(month).intValue();
			} else {
				resultOutput[i] = 0;
			}
		}
		return resultOutput;
	}
}
