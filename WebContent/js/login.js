/**
 * login 
 */
function loginCheckFunction()
{
	var USER_ID=document.getElementById('loginIdentity').value;
	var Password=document.getElementById('loginPassword').value;
	if(USER_ID==''||Password=='')
	{
		alert('请输入帐号和密码');
		return false;
	}
	return true;
}