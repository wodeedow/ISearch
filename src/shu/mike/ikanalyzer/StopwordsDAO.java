package shu.mike.ikanalyzer;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.hibernate.Session;
import shu.mike.util.HibernateUtil;

public class StopwordsDAO
{
	public static Collection<String> getAllStopwords()
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<Stopwords> list = (List<Stopwords>) session.createQuery("from Stopwords").list();
		Collection<String> result=new ArrayList<String>();
		for(Stopwords word:list)
		{
			result.add(word.getWords());
		}
		HibernateUtil.close(session);
		return result;
	}
	public static void addStopwords(String word)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		Stopwords stopwords=new Stopwords();
		stopwords.setWords(word);
		session.save(stopwords);
		session.getTransaction().commit();
		HibernateUtil.close(session);
	}
}
