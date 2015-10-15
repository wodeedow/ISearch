package shu.mike.analysis;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import shu.mike.DAO.HistoryDAO;
import shu.mike.DAO.UserDAO;
import shu.mike.bean.History;

public class PersonSearchInfo {
	private static  HistoryDAO hd=new HistoryDAO();
	/**
	 * 获取全网最近一周的搜索次数
	 * @param useAverage 是否查看平均信息
	 * @return
	 * @throws SQLException
	 */
	public static  int[] getWeekAllSearchInfo(boolean useAverage) throws SQLException {
		if(!useAverage)
			return formatResult(hd.getAllWeekHistory());
		else
		{
			int[] result=formatResult(hd.getAllWeekHistory());
			int allNum=new UserDAO().getAllUserNum();
			for(int i=0;i<result.length;i++)
				result[i]/=allNum;
			return result;
		}
	}
	/**
	 * 从数据库中获取某人最近一周的搜索次数
	 * @return
	 * @throws SQLException
	 */
	public static int[] getWeekSearchInfo(String userUUID) throws SQLException {
		return formatResult(hd.getWeakHistory(userUUID));
	}
	private static int[] formatResult(List<History> result) {
		int[] resultOutput = new int[7];
		Map<String, Integer> allResult = new HashMap<String, Integer>();
		for (int i = 0; i < result.size(); i++) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(result.get(i).getSearchDate());
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