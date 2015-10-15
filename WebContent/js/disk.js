/**
 * 
 */
  
 $(document).ready(
		 function()
		 {
			 
		 }
 )
function allLiTags()
{
	 document.getElementById('searchform').submit();
	 showPrivateSearchSide();
	  
}  
function searchAgain(isPublic)
{
	if(!isPublic)
	{
		window.location.href="privateSearch.action?pageIndex=0&searchValue="+document.getElementById('searchValueInput').value; 
	}
	else
	{
		window.location.href="publicSearch.action?pageIndex=0&searchValue="+document.getElementById('searchValueInput').value; 
	}
	return false;
}
function viewFileFunction()
{
	 if(arguments.length==1)
	 {
		  window.location.href="download.action?UUID="+ arguments[0]; 
	 }
	if(arguments.length==3)
	{
		window.open('http://'+arguments[0]+':8080/ISearchDownload/Download?filepath='+encodeURI(encodeURI(arguments[1])),'查看文件');
	}
}
function ChangeDiv()
{
	if(document.getElementById("searchSide").style.display=="none"){
		document.getElementById("searchSide").style.display="block";
		document.getElementById("fileGrid").style.display="none";

	}
	else{
		document.getElementById("searchSide").style.display="none";
		document.getElementById("fileGrid").style.display="block";
		allFunction();//触发全部文件函数，重新生成表格
	}
}
function showPrivateSearchSide()
{
	document.getElementById("searchSide").style.display="block";
	document.getElementById("fileGrid").style.display="none";
}
function checkFileType() {
	document.getElementById('uuid').value=UUIDStack[UUIDStack.length-1];//上传文件的参数，不能删除！！！
	if(document.getElementById('upload').value!="")
		{
			var uploadFilePath=document.getElementById('upload').value; 
			var fileType=uploadFilePath.substring(uploadFilePath.lastIndexOf('.')+1,uploadFilePath.length);
			if(fileType!='doc'&&fileType!='docx'&&fileType!='ppt'&&fileType!='pptx'&&fileType!='xls'
				&&fileType!='xlsx'&&fileType!='pdf'&&fileType!='txt'&&fileType!='java'&&fileType!='cs'&&fileType!='c'&&fileType!='cpp'&&fileType!='py')
				{
					
					document.getElementById('contents').style.display="block"
				}
			else
				{
					document.getElementById('contents').style.display="none"
				}
			
		}
	
}
function checkFileInputForm()
{
	document.getElementById('uuid').value=UUIDStack[UUIDStack.length-1];//上传文件的参数，不能删除！！！
	if(document.getElementById('upload').value!="")
		{
			var uploadFilePath=document.getElementById('upload').value; 
			var fileType=uploadFilePath.substring(uploadFilePath.lastIndexOf('.')+1,uploadFilePath.length);
			if(fileType!='doc'&&fileType!='docx'&&fileType!='ppt'&&fileType!='pptx'&&fileType!='xls'
				&&fileType!='xlsx'&&fileType!='pdf'&&fileType!='txt'&&fileType!='java'&&fileType!='cs'&&fileType!='c'&&fileType!='cpp'&&fileType!='py')
				{
					if(document.getElementById('contents').value=='')
						{
							alert('您要上传的是音视频文件，请输入相关描述信息！');
						}
					else
						{
							document.getElementById('fileUploadForm').submit();
						}
				}
			else
				{
					document.getElementById('fileUploadForm').submit();
				}
			
		}
		
	else
		 alert("请还没有选择文件，不能上传！");
	return false;
}