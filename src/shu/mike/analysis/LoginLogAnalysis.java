package shu.mike.analysis;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import shu.mike.DAO.LoginLogDAO;
import shu.mike.DAO.UserDAO;
import shu.mike.bean.History;
import shu.mike.bean.IPAddress;
import shu.mike.bean.LoginLog;
import shu.mike.manage.Configuration;
import shu.mike.page.LoginLogPage;
public class LoginLogAnalysis
{

	public static void main(String[] args)
	{

	}
	public void addLoginLog(String userUUID,HttpServletRequest request)
	{
		LoginLog log=new LoginLog();
		log.setUserUUID(userUUID);
		log.setIp(request.getRemoteAddr());
		log.setLoginDate(new Date());
		IPAddress ipAdd=new IPAddress();//获得IPAddress对象，并计算相关地理信息
		ipAdd.setIp(log.getIp());
		IPLocationUtil.setLocation(ipAdd);
		log.setAddress(ipAdd.getAddress());//设置相关地理信息
		log.setX(ipAdd.getX());
		log.setY(ipAdd.getY());
		log.setProvince(ipAdd.getProvince());
		LoginLogDAO.addLoginLog(log);
	}
	public void addUploadLog(String userUUID,String fileUUID)
	{
		
		
	}
	public  int[]  getWeekLoginLog(String userUUID) throws SQLException {
		LoginLogDAO logDAO=new LoginLogDAO();
		return formatResult(logDAO.getWeekLoginLog(userUUID));
	}
	public  int[]  getWeekLoginLog(boolean useAverage) throws SQLException {
		if(!useAverage)
		{
			LoginLogDAO logDAO=new LoginLogDAO();
			return formatResult(logDAO.getWeekLoginLog());
		}
		else
		{
			LoginLogDAO logDAO=new LoginLogDAO();
			int[] result=formatResult(logDAO.getWeekLoginLog());
			int allNum=new UserDAO().getAllUserNum();
			for(int i=0;i<result.length;i++)
				result[i]/=allNum;
			return result;
		}
		
	}
	public int[] getWeekProvinceLoginLog(String provinceName)
	{
		LoginLogDAO logDAO=new LoginLogDAO();
		return formatResult(logDAO.getWeekProvinceLoginLog(provinceName));
	}
	private int[] formatResult(List<LoginLog> result) {
		int[] resultOutput = new int[7];
		Map<String, Integer> allResult = new HashMap<String, Integer>();
		for (int i = 0; i < result.size(); i++) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(result.get(i).getLoginDate());
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
