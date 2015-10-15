package shu.mike.bean;

public class AnalyticsToken {
	private String randomUUID;
	private String userUUID;
	private String tokenWord;
	private int times;

	public AnalyticsToken() {

	}

	public AnalyticsToken(String userUUID, String tokenWord, int times) {
		super();
		this.userUUID = userUUID;
		this.tokenWord = tokenWord;
		this.times = times;
	}

	public String getUserUUID() {
		return userUUID;
	}

	public void setUserUUID(String userUUID) {
		this.userUUID = userUUID;
	}

	public String getTokenWord() {
		return tokenWord;
	}

	public void setTokenWord(String tokenWord) {
		this.tokenWord = tokenWord;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public String getRandomUUID()
	{
		return randomUUID;
	}

	public void setRandomUUID(String randomUUID)
	{
		this.randomUUID = randomUUID;
	}

}
