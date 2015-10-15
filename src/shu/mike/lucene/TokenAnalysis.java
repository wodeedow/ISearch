package shu.mike.lucene;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.analysis.tokenattributes.OffsetAttribute;
import org.apache.lucene.analysis.tokenattributes.PositionIncrementAttribute;
import org.apache.lucene.analysis.tokenattributes.TypeAttribute;
import org.wltea.analyzer.lucene.IKAnalyzer;

public class TokenAnalysis
{
	public static void main(String[] args) throws IOException
	{
		String value="原文写得非常好shu";
		 List<String> result=getToken(value);
		 for(String str:result)
			 System.out.println(str);
	}
	public static List<String> getToken(String contents) throws IOException
	{
		List<String> result=new ArrayList<String>();
		Analyzer analyzer=new IKAnalyzer();
		TokenStream stream=analyzer.tokenStream("contents", new StringReader(contents));
		 PositionIncrementAttribute pis=stream.addAttribute(PositionIncrementAttribute.class);  
	        //每个语汇单元的位置偏移量  
	        OffsetAttribute oa=stream.addAttribute(OffsetAttribute.class);  
	        //存储每一个语汇单元的信息（分词单元信息）  
	        CharTermAttribute cta=stream.addAttribute(CharTermAttribute.class);  
	        //使用的分词器的类型信息  
	        TypeAttribute ta=stream.addAttribute(TypeAttribute.class);  
	        stream.reset();  
	        int lastOffset = -1;  
	        while(stream.incrementToken()) {  
	            if(oa.startOffset() < lastOffset) continue;  
	            lastOffset = oa.endOffset(); 
	            result.add(cta.toString());
	        }  
	        stream.end(); 
	        return result;
	}
}
