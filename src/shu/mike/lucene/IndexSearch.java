package shu.mike.lucene;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

import shu.mike.file.FilePathUtil;

public class IndexSearch {
	private Directory directory = null;
	private IndexReader reader = null;
	private String INDEX_STORE_PATH=null;
	private IndexReader getReader() throws IOException {
			directory = FSDirectory.open(new File(INDEX_STORE_PATH));
			if (reader == null) {
				reader = IndexReader.open(directory);
				return reader;
			} else {
				return reader;
			}
	}
	
	public IndexSearch(String USER_ID)
	{
		INDEX_STORE_PATH=FilePathUtil.BASE_PATH+"index/"+USER_ID;
	}
	public IndexSearch()
	{
		INDEX_STORE_PATH=FilePathUtil.INDEX_STORE_PATH;
	}
	public DocumentS[] searchByQueryParser(String tempField, String value) {
		try
		{
			Date start = new Date();
			IndexReader reader = getReader();
			if (reader == null) {
				System.out.println("get Indexreader error!");
				return null;
			} else {
				IndexSearcher searcher = new IndexSearcher(reader);
				Analyzer a = new IKAnalyzer(true);
				QueryParser queryParser = new QueryParser(Version.LUCENE_35,
						tempField, a);
				Query query = queryParser.parse(value);
				TopDocs tds = searcher.search(query, 500);
				ScoreDoc[] sdc = tds.scoreDocs;
				int totalHits = tds.totalHits;
				DocumentS[] docss = new DocumentS[totalHits];
				for (int i = 0; i < sdc.length; i++) {
					DocumentS doctemp = new DocumentS();
					Document doc = searcher.doc(sdc[i].doc);
					doctemp.setFilename(doc.get("filename"));
					doctemp.setPath(doc.get("path"));
					doctemp.setFileuuid(doc.get("fileuuid"));
					doctemp.setMilliseconds(Long.parseLong(doc.get("milliseconds")));
					doctemp.setScore(sdc[i].score);
					doctemp.setBoost(doc.getBoost());
					String titleString = doc.get("title");
					doctemp.setTitle(titleString);
					doctemp.setIp(doc.get("ip"));
					String contentString = doc.get("contents");
					// contentString =Lighter.lighter(a, query,
					// contentString,"contents");
					contentString = ContentLighter.fastLighter(contentString,
							query, reader, sdc[i].doc, "contents");
					doctemp.setContents(contentString);
					docss[i] = doctemp;
					doctemp = null;
				}
				searcher.close();
				directory.close();
				reader.close();
				return docss;
		}
			}
		catch(Exception e)
		{
			DocumentS[] nullSet= new DocumentS[1];
			e.printStackTrace();
			return nullSet;
		}
		
		}
	}

