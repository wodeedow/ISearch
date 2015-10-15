window.onload = function () {

	var login = $().getId('login');
	var screen = $().getId('screen');
	login.center(450, 357);
	$().resize(function () {
		login.center(450, 357);
		if (login.css('display') == 'block') {
			screen.lock();
		}
	});
	$().getClass('login').click(function () {
		login.css('display', 'block');
		screen.lock();
	});
	$().getClass('close').click(function () {
		login.css('display', 'none');
		screen.unlock();
	});

};
/**
 * login 
 */
function loginCheckFunction()
{
	var identity=document.getElementById('loginIdentity').value;
	var password=document.getElementById('loginPassword').value;
	if(identity==''||password=='')
	{
		alert('请输入帐号和密码');
		return false;
	}
	return true;
}
