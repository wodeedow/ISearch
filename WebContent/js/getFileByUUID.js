/**
 * getFileByUUID
 */
function getFileByUUIDCheck()
{
	var UUID=document.getElementById('getFileByUUIDInput').value;
	if(UUID!="")
	{
		 window.location.href="download.action?UUID="+UUID; 
	}
	else
	{
		alert('请输入文件提取码！');
	}
	return false;
}