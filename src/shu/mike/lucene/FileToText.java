package shu.mike.lucene;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.UnknownHostException;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.NumericField;
import org.apache.lucene.document.Field.TermVector;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.poi.hslf.HSLFSlideShow;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.model.TextRun;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xslf.extractor.XSLFPowerPointExtractor;
import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class FileToText {
	private static String ip;
	public static void setIp() {

		try {
			InetAddress addr = InetAddress.getLocalHost();
			ip = addr.getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

	}
	public Document getDocument(File f, String realFileName, String fileUUID)
			throws Exception//
	{
		if (ip == null)
			setIp();
		Document doc = new Document();
		FileInputStream is = new FileInputStream(f);
		BufferedReader reader = new BufferedReader(new InputStreamReader(is));
		StringBuffer urlcont = new StringBuffer();
		String line = null;
		while ((line = reader.readLine()) != null) {
			urlcont.append(line + "\n");
		}
		reader.close();
		String title = urlcont.toString().substring(0,
				urlcont.toString().indexOf("\n"));
		if (title.length() > 40)
			title = title.substring(0, 40);
		doc.add(new Field("title", title, Field.Store.YES,
				Field.Index.ANALYZED, Field.TermVector.NO));
		doc.add(new Field("filename", realFileName, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS, Field.TermVector.YES));
		doc.add(new Field("contents", urlcont.toString()
				.replaceAll("<(S*?)[^>]*>.*?|<.*?/>", "").trim(),
				Field.Store.YES, Field.Index.ANALYZED,
				Field.TermVector.WITH_POSITIONS_OFFSETS));
		doc.add(new Field("fileuuid", fileUUID, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("ip", ip, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS));
		doc.add(new NumericField("milliseconds", Field.Store.YES, true)
				.setLongValue(f.lastModified()));
		return doc;
	}

	public Document getDocumentpdf(File f, String realFileName, String fileUUID)
			 {
		// File_Path fPath=new File_Path();
		if (ip == null)
			setIp();
		try
		{
			String title;
			Document doc = new Document();
			FileInputStream instream = new FileInputStream(f); // 根据指定文件创建输入�?
			PDFParser parser = new PDFParser(instream); // 创建PDF解析�?
			parser.parse(); // 执行PDF解析过程
			PDDocument pdfdocument = parser.getPDDocument(); // 获取解析器的PDF文档对象
			PDFTextStripper pdfstripper = new PDFTextStripper(); // 生成PDF文档内容剥离�?
			String contenttxt = pdfstripper.getText(pdfdocument); // 利用剥离器获取文�?
			title = contenttxt;
			if (title.length() > 40)
				title = title.substring(0, 40);
			doc.add(new Field("title", title, Field.Store.YES,
					Field.Index.ANALYZED, Field.TermVector.NO));
			doc.add(new Field("filename", realFileName, Field.Store.YES,
					Field.Index.ANALYZED, TermVector.NO));
			doc.add(new Field("contents", contenttxt, Field.Store.YES,
					Field.Index.ANALYZED, Field.TermVector.WITH_POSITIONS_OFFSETS));
			doc.add(new Field("fileuuid", fileUUID, Field.Store.YES,
					Field.Index.NOT_ANALYZED_NO_NORMS, Field.TermVector.NO));
			doc.add(new Field("ip", ip, Field.Store.YES,
					Field.Index.NOT_ANALYZED_NO_NORMS));
			doc.add(new NumericField("milliseconds", Field.Store.YES, true)
					.setLongValue(f.lastModified()));
			return doc;
		}
		catch (Exception e )
		{
			System.out.println(f.getName());
			e.printStackTrace();
			return null;
		}
		
	}

	public Document getDocumentxls(File f, String realFileName, String fileUUID)
			throws Exception {
		if (ip == null)
			setIp();
		String all = "";
		String title = "";
		int log = 0;
		Document doc = new Document();
		FileInputStream is = new FileInputStream(f);
		StringBuffer content = new StringBuffer();
		try {
			HSSFWorkbook workbook = new HSSFWorkbook(is);// 鍒涘缓�?�笶xcel宸ヤ綔绨挎枃浠剁殑寮曠敤
			for (int numSheets = 0; numSheets < workbook.getNumberOfSheets(); numSheets++) {
				if (null != workbook.getSheetAt(numSheets)) {
					HSSFSheet aSheet = workbook.getSheetAt(numSheets);// 鑾峰緱锟�??锟斤拷sheet
					for (int rowNumOfSheet = 0; rowNumOfSheet <= aSheet
							.getLastRowNum(); rowNumOfSheet++) {
						if (null != aSheet.getRow(rowNumOfSheet)) {
							HSSFRow aRow = aSheet.getRow(rowNumOfSheet); // 鑾峰緱锟�??锟斤拷锟�??
							for (int cellNumOfRow = 0; cellNumOfRow <= aRow
									.getLastCellNum(); cellNumOfRow++) {
								if (null != aRow.getCell(cellNumOfRow)) {
									HSSFCell aCell = aRow.getCell(cellNumOfRow);// 鑾峰緱鍒楋拷?
									String strCell = "";
									switch (aCell.getCellType()) {
									case HSSFCell.CELL_TYPE_NUMERIC:
										strCell = String.valueOf(aCell
												.getNumericCellValue());
										break;
									case HSSFCell.CELL_TYPE_STRING:
										strCell = aCell.getStringCellValue();
										break;
									case HSSFCell.CELL_TYPE_BOOLEAN:
										strCell = String.valueOf(aCell
												.getBooleanCellValue());
										break;
									default:
										strCell = "";
										break;
									}
									if (log == 0) {
										title = strCell;
										log = 1;
									}
									content.append(strCell);

								}
							}
						}
					}
				}
			}
			if (!content.equals("")) {
				all += content.toString();
			}
			is.close();
		} catch (Exception e) {
		} finally {
			System.gc();
		}
		if (title.length() > 40)
			title = title.substring(0, 40);
		doc.add(new Field("title", title, Field.Store.YES,
				Field.Index.ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("filename", realFileName, Field.Store.YES,
				Field.Index.ANALYZED, Field.TermVector.NO));
		doc.add(new Field("contents", all.toString(), Field.Store.YES,
				Field.Index.ANALYZED_NO_NORMS,
				Field.TermVector.WITH_POSITIONS_OFFSETS));
		doc.add(new Field("fileuuid", fileUUID, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("ip", ip, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS));
		doc.add(new NumericField("milliseconds", Field.Store.YES, true)
				.setLongValue(f.lastModified()));
		return doc;
	}

	public Document getDocumentword(File f, String realFileName, String fileUUID)
			throws Exception {
		if (ip == null)
			setIp();
		Document doc = new Document();
		FileInputStream is = new FileInputStream(f);
		String bodyText = null;
		WordExtractor ex = new WordExtractor(is);// is鏄疻ORD鏂囦欢鐨処nputStream
		bodyText = ex.getText();
		if (!bodyText.equals("")) {
			if (bodyText.length() >= 30) {

				doc.add(new Field("title",
						bodyText.toString().substring(0, 29), Field.Store.YES,
						Field.Index.ANALYZED, Field.TermVector.NO));
			} else {
				doc.add(new Field("title", bodyText, Field.Store.YES,
						Field.Index.ANALYZED, Field.TermVector.NO));
			}
			doc.add(new Field("filename", realFileName, Field.Store.YES,
					Field.Index.ANALYZED, Field.TermVector.NO));
			doc.add(new Field("contents", bodyText.toString(), Field.Store.YES,
					Field.Index.ANALYZED,
					Field.TermVector.WITH_POSITIONS_OFFSETS));
			doc.add(new Field("fileuuid", fileUUID, Field.Store.YES,
					Field.Index.ANALYZED, Field.TermVector.NO));
			doc.add(new Field("ip", ip, Field.Store.YES,
					Field.Index.NOT_ANALYZED_NO_NORMS));
			doc.add(new NumericField("milliseconds", Field.Store.YES, true)
					.setLongValue(f.lastModified()));
		}
		ex.close();
		return doc;
	}

	public Document getDocumentppt(File f, String realFileName, String fileUUID)
			throws Exception {
		if (ip == null)
			setIp();
		Document doc = new Document();
		FileInputStream is = new FileInputStream(f);
		StringBuffer content = new StringBuffer("");
		try {
			SlideShow ss = new SlideShow(new HSLFSlideShow(is));// is
																// 涓烘枃浠剁殑InputStream锛屽缓绔婼lideShow
			Slide[] slides = ss.getSlides();// 鑾峰緱姣忎竴寮犲够鐏墖
			for (int i = 0; i < slides.length; i++) {
				TextRun[] t = slides[i].getTextRuns();// 涓轰簡鍙栧緱骞荤伅鐗囩殑鏂囧瓧鍐呭锛屽缓绔婽extRun
				for (int j = 0; j < t.length; j++) {
					content.append(t[j].getText() + "\n");// 杩欓噷浼氬皢鏂囧瓧鍐呭鍔犲埌content涓�?
				}
				content.append(slides[i].getTitle());
			}
			String title = content.toString();
			if (title.length() > 40)
				title = title.substring(0, 40);
			doc.add(new Field("title", title, Field.Store.YES,
					Field.Index.ANALYZED_NO_NORMS, Field.TermVector.NO));
			doc.add(new Field("filename", realFileName, Field.Store.YES,
					Field.Index.ANALYZED, Field.TermVector.NO));
			doc.add(new Field("contents", content.toString(), Field.Store.YES,
					Field.Index.ANALYZED_NO_NORMS,
					Field.TermVector.WITH_POSITIONS_OFFSETS));
			doc.add(new Field("fileuuid", fileUUID, Field.Store.YES,
					Field.Index.NOT_ANALYZED_NO_NORMS, Field.TermVector.NO));
			doc.add(new Field("ip", ip, Field.Store.YES,
					Field.Index.NOT_ANALYZED_NO_NORMS));
			doc.add(new NumericField("milliseconds", Field.Store.YES, true)
					.setLongValue(f.lastModified()));

		} catch (Exception ex) {
			System.out.println("<br>" + ex.toString());
		} finally {
			System.gc();
		}
		return doc;

	}

	public Document getDocumentdocx(File f, String realFileName, String fileUUID)
			throws Exception {
		if (ip == null)
			setIp();
		Document doc = new Document();
		FileInputStream is = new FileInputStream(f);
		String bodyText = null;
		XWPFDocument docFromFile = new XWPFDocument(is);
		XWPFWordExtractor xpe = new XWPFWordExtractor(docFromFile);
		bodyText = xpe.getText();
		try {
			xpe.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String title = bodyText;
		if (title.length() > 40)
			title = title.substring(0, 40);
		doc.add(new Field("title", title, Field.Store.YES,
				Field.Index.ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("filename", realFileName, Field.Store.YES,
				Field.Index.ANALYZED, Field.TermVector.NO));
		doc.add(new Field("contents", bodyText, Field.Store.YES,
				Field.Index.ANALYZED_NO_NORMS,
				Field.TermVector.WITH_POSITIONS_OFFSETS));
		doc.add(new Field("fileuuid", fileUUID, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("ip", ip, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS));
		doc.add(new NumericField("milliseconds", Field.Store.YES, true)
				.setLongValue(f.lastModified()));
		return doc;

	}

	public Document getDocumentXlsx(File f, String realFileName, String fileUUID)
			throws Exception {
		if (ip == null)
			setIp();
		Document doc = new Document();
		OPCPackage pkg = OPCPackage.open(f);
		XSSFWorkbook wb = new XSSFWorkbook(pkg);
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < wb.getNumberOfSheets(); i++) {
			Sheet sheet1 = wb.getSheetAt(i);
			for (Row row : sheet1) {
				for (Cell cell : row) {
					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_STRING:
						sb.append(cell.getRichStringCellValue().getString());
						break;
					case Cell.CELL_TYPE_NUMERIC:
						if (DateUtil.isCellDateFormatted(cell)) {
							sb.append(cell.getDateCellValue());
						} else {
							sb.append(cell.getNumericCellValue());
						}
						break;
					case Cell.CELL_TYPE_BOOLEAN:
						sb.append(cell.getBooleanCellValue());
						break;
					case Cell.CELL_TYPE_FORMULA:
						sb.append(cell.getCellFormula());
						break;
					}
				}
			}
		}
		pkg.close();
		String title = sb.toString();
		if (title.length() > 40)
			title = title.substring(0, 40);
		doc.add(new Field("title", title, Field.Store.YES,
				Field.Index.ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("filename", realFileName, Field.Store.YES,
				Field.Index.ANALYZED, Field.TermVector.NO));
		doc.add(new Field("contents", sb.toString(), Field.Store.YES,
				Field.Index.ANALYZED_NO_NORMS,
				Field.TermVector.WITH_POSITIONS_OFFSETS));
		doc.add(new Field("fileuuid", fileUUID, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("ip", ip, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS));
		doc.add(new NumericField("milliseconds", Field.Store.YES, true)
				.setLongValue(f.lastModified()));
		return doc;
	}

	public Document getDocumentPptx(File f, String realFileName, String fileUUID)
			throws Exception {
		if (ip == null)
			setIp();
		Document doc = new Document();
		XMLSlideShow ppt = new XMLSlideShow(new FileInputStream(f));
		XSLFPowerPointExtractor xe = new XSLFPowerPointExtractor(ppt);
		String allContent = xe.getText();
		String title = allContent;
		if (title.length() > 40)
			title = title.substring(0, 40);
		doc.add(new Field("title", title, Field.Store.YES,
				Field.Index.ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("filename", realFileName, Field.Store.YES,
				Field.Index.ANALYZED, Field.TermVector.NO));
		doc.add(new Field("contents", allContent, Field.Store.YES,
				Field.Index.ANALYZED_NO_NORMS,
				Field.TermVector.WITH_POSITIONS_OFFSETS));
		doc.add(new Field("fileuuid", fileUUID, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("ip", ip, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS));
		doc.add(new NumericField("milliseconds", Field.Store.YES, true)
				.setLongValue(f.lastModified()));
		xe.close();
		return doc;
	}
	public Document getDocumentAudio(File f, String realFileName, String fileUUID,String contents)
	{
		if (ip == null)
			setIp();
		Document doc = new Document();
		doc.add(new Field("title", realFileName.substring(0,realFileName.indexOf(".")), Field.Store.YES,
				Field.Index.ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("filename", realFileName, Field.Store.YES,
				Field.Index.ANALYZED, Field.TermVector.NO));
		doc.add(new Field("contents", contents, Field.Store.YES,
				Field.Index.ANALYZED_NO_NORMS,
				Field.TermVector.WITH_POSITIONS_OFFSETS));
		doc.add(new Field("fileuuid", fileUUID, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS, Field.TermVector.NO));
		doc.add(new Field("ip", ip, Field.Store.YES,
				Field.Index.NOT_ANALYZED_NO_NORMS));
		doc.add(new NumericField("milliseconds", Field.Store.YES, true)
				.setLongValue(f.lastModified()));
		return doc;
	}

}
