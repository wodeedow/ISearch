package shu.mike.file;

public class FilePathUtil
{
	private static String realpath =FilePathUtil.class.getClassLoader().getResource("/").toString();
	public static String BASE_PATH =realpath.substring(realpath.indexOf("file:/") + 6, realpath.indexOf("WEB-INF")).replaceAll("%20", " ");
	public  static String INDEX_FILE_PATH =BASE_PATH + "upload";
	public static  String INDEX_STORE_PATH = BASE_PATH + "index/public";
	public static String  XPDF_PATH = BASE_PATH + "xpdf/bin32/pdftotext.exe";
	public static String SYS_CONF_PATH=BASE_PATH+"conf/ApplicationSystem.properties";
	public static String UPLAOD_PATH=BASE_PATH+"upload/";
	public static String LOG4J=BASE_PATH+"debug/conf.properties";
	public static String XML_PATH=BASE_PATH+"xml/";
	public static String LIBOWL_PATH=BASE_PATH+"owl/lib.owl";
	public static  String getXmlFileByID(String userUUID)
	{
		return BASE_PATH+"xml/"+userUUID+".xml";
	}
	public static String getTempDirectory()
	{
		return BASE_PATH+"ext";
	}
	public static String getUploadDirectory()
	{
		return BASE_PATH+"upload";
	}
	
	
}
