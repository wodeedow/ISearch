<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="shu.mike.bean.User"%>
<%@ page language="java" import="shu.mike.util.UUIDUtil"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//CN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>搜索结果</title>
	<meta name="description" content="搜索引擎">
	<meta name="author" content="Woohao,Zhangminghu">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="js/result.js"></script>

    <link rel="stylesheet" href="css/style_result.css" />
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
<header id="header" class="row">
	<div class="header-in col-xs-12">
		<h1 id="logo"><a href="index.html">ISearch</a></h1>
		<a href="iSearch_INDEX.html">
			<img id="logo_img" src="images/ISearch_Logo_min2.png" width="40" height="40" />
		</a>
		<nav id="navigation" class="navigation">
			<ul id="nav">
				<li><a href="index.html">主页</a></li>
				<li><a href="disk.jsp">网盘</a></li>
				<li><a href="#"><%=session.getAttribute("USER_NAME") %></a></li>
			</ul>
		</nav>
	</div>
	<div id="search">   
		<form action="publicSearch.action" id="searchform" method="post">
			<p>
				<input placeholder="点此输入搜索内容" type="text" id="searchValue" value="<s:property value="searchValue" escape='false'/>" name="searchValue">
				<input  type="hidden" value="${applicationScope.USER.ID}" name="USER_ID"/>
				<input  type="hidden" value="0" id="pageIndex"name="pageIndex"/>
				<button class="submit-search" type="submit" id="searchFormSubmit" onclick="return submitValue();">iSearch</button>
			</p>
		</form>	
	</div>
</header> 
<div class="box row"> 
<!-- - - - - - - - - - - - - - leftSide - - - - - - - - - - - - - - - - -->
<div id="leftside" class="navigation_side">
</div>
<div class="col-xs-8">
	<div id="result">
		<s:iterator value="publicDocuments" >
			<div class="list-group">
	 		 <a class="list-group-item" onclick="return viewFileFunction(<s:if test='path!=null'>'<s:property value="ip" escape='false' />','<s:property value="path" escape='false' />',</s:if>'<s:property value="fileuuid" escape='false' />')">
	   		 <h3 class="list-group-item-heading"><s:property value="title" escape='false'/></h3>
	   		 <h4 class="list-group-item-heading"><s:property value="filename" escape='false' /> </h4>
	   		 <div class="abstract"><p class="list-group-item-text"><s:property value="contents" escape='false'/> </p></div>
	 		 </a> 
			</div>  
	    </s:iterator> 
		<br/>
		<div class="list-group">
	 		 <a href="#" class="list-group-item">
	   			<p>搜索到 :<label id="totalHitsNum"><s:property value="publicTotalHits" escape='false'/></label> 条结果</p>
	   			<nav>  
					<ul class="pagination" id="allPageTags">
					</ul> 
				</nav>
	 		 </a>
		</div>  
	</div>
</div>
<div class="col-xs-4">
	<div id="recommendation">
		<s:if test="recommendations!=null">
			<h3 class=\"list-group-item-heading\"><a>为您推荐与"<s:property value="searchValue" escape='false'/>"相关的语义关键字</a></h3>
				<s:iterator value="recommendations" id="content" >
					<div class="list-group">
					<%
						out.println("<a class=\"list-group-item\" id=\""+UUIDUtil.getUUID()+"\" onclick=\"searchAgainByUUID(this.id);\">");
					%>
					 <s:property value="content" escape='false'/>
					 </a>  
					</div>  
				</s:iterator> 
		</s:if>
		<s:else>
			<h3 class=\"list-group-item-heading\">抱歉未找到相关的语义关键字</a></h3>	
		</s:else>
	</div>
</div>
</div>
</body>
</html>