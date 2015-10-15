function checkValue()
{
	var UserName=document.getElementById('userName').value;
	var ContactInfo=document.getElementById('email').value;
	var Password=document.getElementById('password').value;
	if(UserName==""||ContactInfo==""||Password=="")
	{
		alert('请输入必要的信息！');
	}
	document.getElementById('registerForm').submit();
	return false;
}
function checkUserName() {
	var UserName=document.getElementById('userName').value;
	if(UserName!='')
	{
		$.ajax({ 
		type: "POST",
		url: 'RegisterService',
		data: { operationType: 'checkUserName', userName:UserName },
		dataType: 'json',
		success: function (msg) 
		{
			if(msg.success==false)
				alert('用户名重复请重新输入！');
		}
		})
	}
	
}
function checkUserEmail() { 
	var UserEmail=document.getElementById('email').value;
	if(UserEmail!='')
	{
		$.ajax({
		type: "POST",
		url: 'RegisterService',
		data: { operationType: 'checkUserEmail', userEmail:UserEmail },
		dataType: 'json',
		success: function (msg) 
		{
			 if(msg.success==false)
				alert('该邮箱已经用于注册该平台，请更换邮箱地址！');
		}
		})
	}
	
	
}
function checkPassword()
{
	var Password=document.getElementById('password').value;
	var Password2=document.getElementById('password2').value; 
	if(Password!=Password2)
	{
		alert('两次密码不一致！请确认！');
	}
}