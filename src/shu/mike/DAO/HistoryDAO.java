package shu.mike.DAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONObject;

import shu.mike.analysis.IPLocationUtil;
import shu.mike.bean.History;
import shu.mike.lucene.TokenAnalysis;
import shu.mike.util.DateUtil;
import shu.mike.util.HibernateUtil;

public class HistoryDAO extends BaseDAO
{
	public boolean addHistory(History history)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		IPLocationUtil.setLocation(history);
		session.save(history);
		try
		{
			List<String> result=TokenAnalysis.getToken(history.getContents());
			String userUUID=history.getUserUUID();
			for(String str:result)
			{
				AnalyticsTokenDAO.addTimes(userUUID, str);
			}
		
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		session.getTransaction().commit();
		HibernateUtil.close(session);
		return true;
	}

	/**
	 * 返回userUUID最近一周的查询情况
	 * 
	 * @param userUUID
	 * @return
	 * @throws SQLException
	 */
	public List<History> getWeakHistory(String userUUID) throws SQLException
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<History> weekHistory = (List<History>) session
				.createQuery(
						"from History as his where his.userUUID =:userUUID and his.searchDate>=:beforeOneWeek and his.searchDate<=:oneDayBefore")
				.setParameter("userUUID", userUUID).setParameter("beforeOneWeek", DateUtil.getBeforeOneWeek()).setParameter("oneDayBefore", DateUtil.getBeforeOneDay()).list();
		HibernateUtil.close(session);
		return weekHistory;
	}
	/**
	 *  获取全网最近一周的搜索记录
	 * @return List<History>
	 */
	public List<History> getAllWeekHistory()
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<History> weekHistory = (List<History>) session
				.createQuery(
						"from History as his where his.searchDate>=:beforeOneWeek and his.searchDate<=:oneDayBefore")
				.setParameter("beforeOneWeek", DateUtil.getBeforeOneWeek()).setParameter("oneDayBefore", DateUtil.getBeforeOneDay()).list();
		HibernateUtil.close(session);
		return weekHistory;
	}

	/**
	 * 获取某人某天的搜索记录
	 * 
	 * @param  userUUID
	 * @param date 
	 * @return
	 * @throws SQLException
	 */
	public List<History> getDayHistory(String userUUID,
			Date date) throws SQLException
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<History> dayHistory = (List<History>) session
				.createQuery(
						"from History where userUUID =:userUUID and DATE_SUB(\":date\", INTERVAL 0 DAY) = date(searchDate)"
				).setParameter("userUUID", userUUID).setParameter("date", date).list();
		HibernateUtil.close(session);
		return 	dayHistory;
	}
	/**
	 * 获取各省的历史次数
	 * @return
	 */
	public String getProvinceData()
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		String[] allProvince = { "广东", "青海", "四川", "海南", "陕西", "甘肃", "云南", "湖南",
				"湖北", "黑龙江", "贵州", "山东", "江西", "河南", "河北", "山西", "安徽", "福建",
				"浙江", "江苏", "吉林", "辽宁", "台湾", "新疆", "广西", "宁夏", "内蒙古", "西藏",
				"北京", "天津", "上海", "重庆","香港","澳门"};
		int[] provinceData=new int[34];
		JSONArray result=new JSONArray();
		for(int i=0;i<34;i++)
		{
			long num = (Long)session.createQuery("select count(*) from History where PROVINCE like:province").setParameter("province", allProvince[i]+"%").uniqueResult();
			provinceData[i]=(int)num;
			JSONObject obj=new JSONObject();
			obj.put("name",allProvince[i]);
			obj.put("value", provinceData[i]);
			result.put(obj);
		}
		HibernateUtil.close(session);
		return result.toString();
	}
}
