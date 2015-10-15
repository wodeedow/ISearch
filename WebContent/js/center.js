String.prototype.Trim   =   function()      
{       
    return this.replace(/(^\s*)|(\s*$)/g, ""); 
}  
/**
 * 取消文件分享 参数fileUUID
 */
function cancleShared(id)
{
	$.ajax({
		type: "POST",
        url:'FileManage.action',
        data:{operationType: 'cancelSharedFile',fileUUID:id,USER_ID:document.getElementById('center_USER_ID').value,isDirectory:'false'},
        dataType:'json',
		success: function(msg){
			 alert('取消成功！');
			 var tr=document.getElementById(id+'tr');
			    //取出行的索引，设置删除行的索引
			 document.getElementById('sharedFileManageTable').deleteRow(tr.rowIndex);
		
		 }
	})
}
/**
 * 更新个人信息
 */
function updateInfo()
{
	$.ajax({
		type: "POST",
        url:'AccountcService',
        data:{operationType: 'setInfo',
			sex:$("input[name='sex']:checked").val(),
			notTrack:$("input[name='notTrack']:checked").val(),
			organizations:$("input[name='organizations']").val(),
			userEmail:$("input[name='email']").val()
			},
        dataType:'json',
		success: function(msg){
			 if(msg.success!=true)
			 {
				 if(msg.cause=='checkEmail')
				 	alert('该邮箱已经在该平台注册，请更换其他邮箱！');
				else
					alert('保存失败！请重试！')
			 }
			 else
			 {
				 window.location.reload(); 
			 }
		
		 }
	}) 
	return false;
}
/**
 * 显示个人信息
 */
function getPersonInfoFunction()
{
	perpareHTML('infoSet');
	$.ajax({
        type: "POST",
        url:'AccountcService',
        data:{operationType: 'getInfo'},
        dataType:'json',
        success: function(msg){
			document.getElementById('center_USER_ID').value=msg.user.userName;
			document.getElementById('center_ContactInfo').value=msg.user.email;
			var sex=msg.user.sex;
			var notTrack=msg.user.notTrack;
			if(sex)
				$("input[name=sex]:eq(0)").attr("checked",'checked');
			else
				$("input[name=sex]:eq(1)").attr("checked",'checked')
			if(notTrack)
				$("input[name=notTrack]:eq(0)").attr("checked",'checked');
			else
				$("input[name=notTrack]:eq(1)").attr("checked",'checked'); 
			document.getElementById('center_School').value=msg.user.organizations;
        }     
	}
	)
}
function changePasswordFunction()
{
	perpareHTML('changePassword');
}
function sharedFileManageFunction()
{
	perpareHTML('sharedFileManage');
};
function searchTimeFunction()
{
	perpareHTML('searchTimesAnalysis');
	showCharts(); 
	return false;
}
function frequencyAnalysisFunction()
{
	perpareHTML('frequencyAnalysis');
	showfrequencyAnalysisCharts();
	return false;
}
function timesMapAnalysisFunction()
{
	perpareHTML('timesMapAnalysis','provinceCompare'); 
	timesMapAnalysisShow();
	return false;
}
function loginLogTableShowFunction()
{
	perpareHTML('loginLogAnalysis');
	showLoginLogChart();
	return false;
}
function uploadLogTableShowFunction()
{
	perpareHTML('uploadLogAnalysis');
	showUploadLogChart();
	return false;
}
function downloadLogTableShowFunction() 
{
	perpareHTML('downloadLogAnalysis');
	showDownloadLogChart();
	return false;
}

function perpareHTML() 
{
	var allShown=['infoSet','changePassword','sharedFileManage','searchTimesAnalysis','frequencyAnalysis'
		,'timesMapAnalysis','loginLogAnalysis','uploadLogAnalysis','downloadLogAnalysis'];
	for(var i=0;i<allShown.length;i++)
	{
		if(allShown[i]==arguments[0]) 
		{
			document.getElementById(allShown[i]).style.display="block";
		}
		else
		{
			document.getElementById(allShown[i]).style.display="none";
		}
	}
	if(arguments.length==2)
	{
		document.getElementById(arguments[1]).style.display="block";
	}
}
