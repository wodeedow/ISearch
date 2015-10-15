package shu.mike.ikanalyzer;

public class Stopwords
{
	private String words;
	private String id;
	
	public Stopwords(String words, String id)
	{
		super();
		this.words = words;
		this.id = id;
	}
	public Stopwords()
	{
		
	}
	public String getWords()
	{
		return words;
	}
	public void setWords(String words)
	{
		this.words = words;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	
	
}
