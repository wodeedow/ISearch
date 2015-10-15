package shu.mike.ikanalyzer;

import org.wltea.analyzer.cfg.DefualtConfig;
import org.wltea.analyzer.dic.Dictionary;

public class StopWordSetting
{

	public static void addWords()
	{
		prepareDictionary();
	}
	public static void  prepareDictionary()
	{
		Dictionary.initial(DefualtConfig.getInstance());
		Dictionary.getSingleton().disableWords(StopwordsDAO.getAllStopwords());
	}

}
