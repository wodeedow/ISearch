package shu.mike.file;

public class FileType
{
	private static String[] documentFileType={".doc",".docx",".ppt",".pptx",".xls",".xlsx",".pdf",".txt",".java",".cs",".cpp",".py"};
	public static boolean isAudioType(String type)
	{
		for(String docType:documentFileType)
		{
			if(type.equals(docType))
			{
				return false;
			}
		}
		return true;
	}
}
