package shu.mike.lucene;

import java.io.Serializable;
public class DocumentS implements Serializable,Comparable<DocumentS>
{
	private static final long serialVersionUID=-1 ;
	private String title=null;// the title of the file (it maybe the first line of the file)
	private String ip=null;
	private String path=null;//the path of file(it must can be used to download the file )
	private String fileuuid;
	private String filename=null;//the name of file (some time it may be useless)
	private String contents=null;
	private long milliseconds;//the last time (lastModified)
	private float boost;// the boost of the file 
	private float score;//the score of the file
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFileuuid() {
		return fileuuid;
	}
	public void setFileuuid(String fileuuid) {
		this.fileuuid = fileuuid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public long getMilliseconds() {
		return milliseconds;
	}
	public void setMilliseconds(long milliseconds) {
		this.milliseconds = milliseconds;
	}
	public float getBoost() {
		return boost;
	}
	public void setBoost(float boost) {
		this.boost = boost;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    @Override
	public int compareTo(DocumentS other) 
	{
		if(this.boost>other.boost)
		{
			return -1;
		}
		else if( this.boost <other .boost )
		{
			return 1;
		}
		else if(this.score>other.score)
		{
			return -1;
		}
		else if( this.score <other.score )
		{
			return 1;
		} 
		else if (this.milliseconds<other.milliseconds){
			return 1;
		}
		else if  (this.milliseconds>other.milliseconds){
			return -1;
		}
		else {
			return 0;
		}
		
	}
	@Override
	public int hashCode() {
		  int result = 17;  //
		  result = 31*result +title.hashCode();
		  result = 31*result +filename.hashCode();
		  result = 31*result +Float.floatToIntBits(boost);
		  result = 31*result +Float.floatToIntBits(score);
		  return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)  
			   return true;  
			  if (obj == null)  
			   return false;  
			  if (getClass() != obj.getClass())  
			   return false;  
			 DocumentS other = (DocumentS) obj;  
			 if(this.boost!=other.boost)
				{
					return false;
				}
				else {
					if(this.score==other .score)
					{
						return true;						
					}
					else {
						return false;
					}
				}
			 
	}
	public String toString ()
	{
		StringBuffer temp=new StringBuffer();
		temp.append("title:"+title+"\r\n");
		temp.append("path:"+path+"\r\n");
		temp .append("filename:"+filename+"\r\n");
		temp.append("Boost:");
		temp .append(boost);
		temp.append("\r\n");
		temp.append("Score:");
		temp .append(score);
		temp.append("\r\n");
		return temp.toString();
	}
}
