<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%  
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//CN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head>
	<!-- Google Web Fonts --> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>提取文件</title>
	<meta name="description" content="搜索引擎">
	<meta name="author" content="Woohao,Zhangminghu">
	<link rel="shortcut icon" href="images/ISearch_Logo.png">
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="js/getFileByUUID.js"></script>  
    <link rel="stylesheet" href="css/style_register_success.css" />
	<script type="text/javascript">

		function menuFix() {
		    var sfEls = document.getElementById("nav").getElementsByTagName("li");
		    for (var i=0; i<sfEls.length; i++) {
		        sfEls[i].onmouseover=function() {
		        this.className+=(this.className.length>0? " ": "") + "sfhover";
		        }
		        sfEls[i].onMouseDown=function() {
		        this.className+=(this.className.length>0? " ": "") + "sfhover";
		        }
		        sfEls[i].onMouseUp=function() {
		        this.className+=(this.className.length>0? " ": "") + "sfhover";
		        }
		        sfEls[i].onmouseout=function() {
		        this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"),

		"");
		        }
		    }
		}
		window.onload=menuFix;
	</script>

</head>

<body>

<div class="divbig">
<!-- - - - - - - - - - - - - - header - - - - - - - - - - - - - - - - -->
<header id="header">
	<div class="header-in">
		<h1 id="logo"><a href="index.html">ISearch</a></h1>
		<a href="index.html">
			<img id="logo_img" src="images/ISearch_Logo_min2.png" width="40" height="40" />
		</a>
		<nav id="navigation" class="navigation">
			<ul id="nav">
				<li><a href="index.html">主页</a></li>
			</ul>
		</nav>
	</div>
</header>

<div class="box">
	<div class="jumbotron">
		<h1>Hello,欢迎提取文件</h1>
	<p>
			<div class="form-group">
				<label>输入文件ID</label>
				<input type="text" id="getFileByUUIDInput" class="form-control" placeholder="输入文件提取码">
			</div>
	</p>
	<p><a class="btn btn-primary btn-lg" onclick="return getFileByUUIDCheck();" role="button">提取文件</a></p>
</div>
</div>
</div>
</body>
</html>