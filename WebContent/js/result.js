/**
 * 
 */
 String.prototype.Trim   =   function()      
{      
    return this.replace(/(^\s*)|(\s*$)/g, "");
}    
 $(document).ready(
		 function()
		 {
			 allLiTags();
		 }
 )
function allLiTags()
{
	  var allpage=document.getElementById('allPageTags');
	  var length=document.getElementById('totalHitsNum').innerHTML;
	  for (var i=0;i<parseInt(length/10)+1;i++)
	  {
		   var li= document.createElement("li");
		   li.innerHTML='<a onclick="return pageClick(this.id)" id="'+i+'">'+(i+1)+'</a>';
		   allpage.appendChild(li);
	  }
}
function pageClick(id)    
{
	document.getElementById('pageIndex').value=id;
	document.getElementById('searchform').submit(); 
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
function searchAgainByUUID(id)
{
	document.getElementById('searchValue').value=document.getElementById(id).innerHTML.Trim();
	document.getElementById('searchform').submit();  
}