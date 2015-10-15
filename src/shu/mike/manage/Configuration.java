package shu.mike.manage;

public class Configuration
{
	private  static ManageDAO manage=new ManageDAO();
	private  static ManageInfo info=manage.getManageInfo();
	public static  String getValue(String key)
	{
		switch (key)
		{
		case "serverNum":
			return info.getServerNum()+"";
		case "port":
			return info.getPort()+"";
		case "pageMaxSize":
			return info.getPageMaxSize()+"";
		case "totalHits":
			return info.getTotalHits()+"";
		case "searchMaxItem":
			return info.getSearchMaxItem()+"";
		case "defaultCapacity":
			return info.getDefaultCapacity()+"";
		case "loginLogMaxSize":
			return info.getLoginLogMaxSize()+"";
		case "ResourceManagerLogMaxSize":
			return info.getResourceManagerLogMaxSize()+"";
		case "defaultPermissionLevel":
			return info.getDefaultCapacity()+"";
		case "downloadName":
			return info.getDownloadName();
		case "EmailAccountUserName":
			return info.getEmailAccountUserName();
		case "EmailAccountPassWord":
			return  info.getEmailAccountPassWord();
		case "EmailAccountSmtpHost":
			return  info.getEmailAccountSmtpHost();
		default:
			System.out.println("param error!"+Configuration.class+"--Param:"+key);
			return null;
		}
	}
	public static void saveValue(String key,String value)
	{
		switch (key)
		{
		case "serverNum":
			manage.updateManageInfo(MangeInfoField.SERVERNUM, value);
			break;
		case "pageMaxSize":
			manage.updateManageInfo(MangeInfoField.PAGEMAXSIZE, value);
			break;
		case "totalHits":
			manage.updateManageInfo(MangeInfoField.TOTALHITS, value);
			break;
		case "searchMaxItem":
			manage.updateManageInfo(MangeInfoField.SEARCHMAXITEM, value);
			break;
		case "defaultCapacity":
			manage.updateManageInfo(MangeInfoField.DEFAULTCAPACITY, value);
			break;
		case "loginLogMaxSize":
			manage.updateManageInfo(MangeInfoField.LOGINGLOGMAXSIZE, value);
			break;
		case "ResourceManagerLogMaxSize":
			manage.updateManageInfo(MangeInfoField.RESOURCEMANAGERLOGMAXSIZE, value);
			break;
		case "downloadName":
			manage.updateManageInfo(MangeInfoField.DOWNLOADNAME, value);
			break;
		case "EmailAccountUserName":
			manage.updateManageInfo(MangeInfoField.EMAILACCOUNTUSERNAME, value);
			break;
		case "EmailAccountPassWord":
			manage.updateManageInfo(MangeInfoField.EMAILACCOUNTPASSWORD, value);
			break;
		case "EmailAccountSmtpHost":
			manage.updateManageInfo(MangeInfoField.EMAILACCOUNTSMTPHOST, value);
			break;
		default:
			System.out.println("param error!"+Configuration.class+"--Param:"+key);
		}
	}

}
