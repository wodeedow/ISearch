package shu.mike.DAO;

import java.util.List;

import org.hibernate.Session;

import shu.mike.bean.AnalyticsToken;
import shu.mike.util.HibernateUtil;

public class AnalyticsTokenDAO
{
	/**
	 * 添加分词后的词语的次数
	 * 
	 * @param userUUID
	 *            用户的唯一标识符
	 * @param tokenWord
	 *            分词信息
	 */
	public static void addTimes(String userUUID, String tokenWord)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		List<AnalyticsToken> result = null;
		if (!userUUID.equals(""))
		{
			@SuppressWarnings("unchecked")
			List<AnalyticsToken> tokenList = (List<AnalyticsToken>) session
					.createQuery(
							"from AnalyticsToken where userUUID =:userUUID and tokenWord=:tokenWord")
					.setParameter("userUUID", userUUID)
					.setParameter("tokenWord", tokenWord).list();
			result = tokenList;
		} else
		{
			@SuppressWarnings("unchecked")
			List<AnalyticsToken> tokenList = (List<AnalyticsToken>) session
					.createQuery(
							"from AnalyticsToken where tokenWord=:tokenWord")
					.setParameter("tokenWord", tokenWord).list();
			result = tokenList;
		}
		if (result.size() == 1)
		{
			AnalyticsToken temp = result.get(0);
			temp.setTimes(temp.getTimes() + 1);
		} else
		{
			AnalyticsToken newToken = new AnalyticsToken();
			newToken.setUserUUID(userUUID);
			newToken.setTokenWord(tokenWord);
			newToken.setTimes(1);
			session.save(newToken);
		}

		session.getTransaction().commit();
		HibernateUtil.close(session);
	}

	public static List<AnalyticsToken> getMostAnalyticsToken(String userUUID)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<AnalyticsToken> tokenList = (List<AnalyticsToken>) session
				.createQuery("from AnalyticsToken where userUUID =:userUUID order by times desc").setFirstResult(0).setMaxResults(10)
				.setParameter("userUUID", userUUID).list();
		HibernateUtil.close(session);
		return tokenList;
	}
}
