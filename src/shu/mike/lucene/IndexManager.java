package shu.mike.lucene;

import java.io.File;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

import shu.mike.file.FilePathUtil;

public class IndexManager {
	private IndexWriter writer = null;
	private Directory directory = null;
	private Analyzer analyzer = null;
	private String INDEX_STORE_PATH;
	private Logger logger=null;
	public IndexManager() {
		INDEX_STORE_PATH = FilePathUtil.INDEX_STORE_PATH;
		logger=Logger.getLogger(IndexManager.class.getName());
		PropertyConfigurator.configure(FilePathUtil.LOG4J);
	}

	public IndexManager(String indexStorePath) {
		INDEX_STORE_PATH = indexStorePath;
		PropertyConfigurator.configure(FilePathUtil.LOG4J);
	}

	private Directory getDirectory() throws IOException {
		if (directory == null) {
			return FSDirectory.open(new File(INDEX_STORE_PATH));
		} else {
			return directory;
		}
	}

	private Analyzer getAnalyzer() {
		if (analyzer == null) {

			return new IKAnalyzer();
		} else {
			return analyzer;
		}
	}

	private IndexWriter getIndexWriter() throws IOException {
		if (writer == null) {
			IndexWriterConfig iwc = new IndexWriterConfig(Version.LUCENE_35,
					getAnalyzer());
			writer = new IndexWriter(directory, iwc);
		}
		return writer;

	}

	private void initLucene() throws IOException {
		directory = getDirectory();
		analyzer = getAnalyzer();
		writer = getIndexWriter();
	}

	private void writerCommit() {
		try {
			writer.commit();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void writeIndex(String realPath, String realFileName,
			String fileUUID) {
		try {
			initLucene();
		} catch (IOException e) {
			logger.error("exception occurs in execute initLucene()");
			e.printStackTrace();
		}
		try {
			writeToIndex(new File(realPath), realFileName, fileUUID);
			writerCommit();
			writer.close();
		} catch (Exception e) {
			logger.error("exception occurs in execute writeToIndex()-writerCommit()-close()");
			e.printStackTrace();
		}
	}
	public void writeIndex(String realPath, String realFileName,
			String fileUUID,String contents) {
		try {
			initLucene();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			writeToIndex(new File(realPath), realFileName, fileUUID,contents);
			writerCommit();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void writeToIndex(File folder, String realFileName, String fileUUID,String contents) throws CorruptIndexException, IOException
	{
		FileToText ftt = new FileToText();
		Document doc=ftt.getDocumentAudio(folder, realFileName, fileUUID, contents);
		writer.addDocument(doc);
	}
	private void writeToIndex(File folder, String realFileName, String fileUUID) throws CorruptIndexException, IOException
	{
	
		Document doc=null;
		try
		{
			doc = getLuceneDocument(folder, realFileName, fileUUID);
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(doc!=null)
			writer.addDocument(doc);
			
	}
	private Document getLuceneDocument(File folder, String realFileName, String fileUUID)
			throws Exception {
		FileToText ftt = new FileToText();
		String folderName=folder.getName().toLowerCase();
		if (folderName.endsWith(".txt")
				|| folderName.endsWith(".java")
				|| folderName.endsWith(".cs")
				|| folderName.endsWith(".cpp")
				|| folderName.endsWith(".py")
				|| folderName.endsWith(".c")) {
			Document doc = ftt.getDocument(folder, realFileName, fileUUID);
			if(doc!=null)
				return doc;
			else
				System.out.println(folderName);
		} else if (folderName.endsWith("pdf")) {
			Document doc = ftt.getDocumentpdf(folder, realFileName, fileUUID);
			if(doc!=null)
				return doc;
			else
				System.out.println(folderName);
		} else if (folderName.endsWith("xls")) {
			Document doc = ftt.getDocumentxls(folder, realFileName, fileUUID);
			if(doc!=null)
				return doc;
			else
				System.out.println(folderName);
		} else if (folderName.endsWith("ppt")) {
			Document doc = ftt.getDocumentppt(folder, realFileName, fileUUID);
			if(doc!=null)
				return doc;
			else
				System.out.println(folderName);
		} else if (folderName.endsWith("doc")) {
			Document doc = ftt.getDocumentword(folder, realFileName, fileUUID);
			if(doc!=null)
				return doc;
			else
				System.out.println(folderName);
		} else if (folderName.endsWith("docx")) {
			Document doc = ftt.getDocumentdocx(folder, realFileName, fileUUID);
			writer.addDocument(doc);
		} else if (folderName.endsWith("pptx")) {
			Document doc = ftt.getDocumentPptx(folder, realFileName, fileUUID);
			if(doc!=null)
				return doc;
			else
				System.out.println(folderName);
		} else if (folderName.endsWith("xlsx")) {
			Document doc = ftt.getDocumentXlsx(folder, realFileName, fileUUID);
			if(doc!=null)
				return doc;
			else
				System.out.println(folderName);
		} else {
			System.out.println("the file is not supported !" + folder);
			return null;
		}
		return null;
	}

	public void deleteIndex(String fileUUID) throws IOException {
		initLucene();
		writer.deleteDocuments(new Term("fileuuid", fileUUID));// /////////////////
		writer.close();
	}

}
