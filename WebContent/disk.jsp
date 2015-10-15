<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="shu.mike.bean.User"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%  
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>ISearchDISK</title>
	<meta name="description" content="搜索引擎">
	<meta name="author" content="Woohao,Zhangminghu">
	<link rel="shortcut icon" href="images/ISearch_Logo.png">
	<script type="text/javascript" src="ext/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="ext/resources/css/ext-all.css" />

	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/file_home.js"></script>
	<script src="js/disk.js"></script>
    <link rel="stylesheet" href="css/style_disk.css" />
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
		        this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"),"");
		        }
		    }
			var data =document.getElementsByClassName('list-group-item'); 
			if(data.length>0)
			{
				document.getElementById('fileGrid').style.width=document.getElementById('searchSide').style.width;
				showPrivateSearchSide();
			}
		}
		window.onload=menuFix;
	</script>


</head>

<body>

<div class="divbig">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">分享文件</h4>
					</div>

					<div class="modal-body">
						</br></br></br><h4>分享您的文件，分享您的知识，供别人检索和下载学习！</h4></br></br></br>
						<h5>您可以在个人中心，管理您的共享文件！</h5>
						</br></br><h5>当前文件id为</h5>
						<input type="text" class="form-control"  id='prepareShareFileUUID'placeholder="文件ID" readonly>
						</br></br>
						<h5>您可以直接将id分享给他人，本网站支持根据id下载文件</h5>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" onClick="shareFile();">分享</button>
					</div>

				</div>
			</div>
	</div>
	<div class="modal fade" id="fileUploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">上传文件</h4>
	      </div>
	      <div class="modal-body">
		  <form id="fileUploadForm" method="post" action="fileupload.action"  enctype="multipart/form-data">
			<div class="form-group">
				 <input type="file" name="upload" id="upload" onchange="checkFileType();">
				 <input type="text" style="display:none" name="uuid" id="uuid">
				 </br></br>
			</div>
			<div class="form-group">
				<label for="isPublicSet">是否共享文件？</label>
				<label class="radio-inline">
				<input type="radio" name="isPublic" id="isPublic" value="true" checked=true> 共享我的文件，允许别人搜索，下载该文件
				</label>
				<label class="radio-inline">
				<input type="radio" name="isPublic" id="isPublic" value="false"> 禁止别人搜索，下载该文件
				</label>
				<br/>
				<input type="text" class="form-control" id="contents" style="display:none" name="contents"  style="height:250px"   placeholder="请输入该音视频文件相关的描述，以供他人检索和下载">
			</div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="return checkFileInputForm();">上传</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- renameModal -->
	<div class="modal fade" id="renameModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="renameModalLabel">创建文件夹</h4>
	      </div>
	      <div class="modal-body">
			<form id="createDirectoryForm" action="FileManage.action" method="post">
			 <input type="text" style="display:none" name="fatherDirectoryUUID" id="fatherDirectoryUUID">
			 <input type="text" style="display:none" name="USER_ID" id="create_USER_ID">
			 <input type="text" style="display:none" name="fileUUID">
			 <input type="text" style="display:none" name="operationType" value="create">
			 <input type="text" style="display:none" name="isDirectory" value="true">
			<div class="form-group">
			  <input type="text" >
			  <input type="text" name="fileName" id="fileName" class="form-control" placeholder="输入新的文件夹名称">
			 </div>		
			 <span class="label label-info" style="display:none" id="infoSpanText">正在检查是否文件夹名称重复。。。</span>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="return renameFormCheck();">应用</button>
	      </div>
	    </div>
	  </div>
	</div>
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
					<li class="current-menu-item"><a href="">网盘</a></li>			
				<input type="text" style="display:none"  id="UER_UUID" name="userUUID" value="<%=session.getAttribute("USER_UUID") %>">	
				<input type="text" style="display:none"  id="USER_NAME" name="userUUID" value="<%=session.getAttribute("USER_NAME") %>">		  				  			
				<li><a id ="SPAN_USER_ID" href="#"><%=session.getAttribute("USER_NAME") %></a>
						<ul>
							<li><a href="viewCenter.action">个人中心</a></li>
							<li><a href="logout.action">注 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
		<div id="search">
			<form action="Search.action" id="searchform" method="post">
				<p>
					<input placeholder="点此输入搜索内容" type="text" id='searchValueInput' value="<s:property value="searchValue" escape='false'/>" name="searchValue">
					<button class="submit-search" type="submit" onclick="allLiTags();">ISearch</button>
				</p>
			</form>	
		</div>
	</header>

	<div class="box">
		<span id="changeButton" onclick="JavaScript:ChangeDiv()">切换</span>
	<!-- - - - - - - - - - - - - - leftSide - - - - - - - - - - - - - - - - -->
		<div id="leftside" class="navigation_side">
			<div><h4>文件分类</h4></div>
			<ul class="">
				<li class="current-menu-item"><a onclick="return allFunction()">全部文件</a></li>
				<li><a onclick="return wordFunction();">Word文档</a></li>
				<li><a onclick="return excelFunction();">Excel文档</a></li>
				<li><a onclick="return pptFunction();">PPT文档</a></li>
				<li><a onclick="return pdfFunction();">PDF文档</a></li>
				<li><a onclick="return textFunction();">纯文本文档</a></li>
				<li><a onclick="return audioFunction();">音频文件</a></li>
				<li><a onclick="return vedioFunction();">视频文件</a></li>
				<li><a onclick="return pictureFunction();">图片文件</a></li>
			</ul>
		</div>

		<div id="fileGrid"></div>
		<div id="searchSide" style="display:none">
			<s:if test="privateDocumentS!=null">  
				<h4>个人文件</h4>
				<s:iterator value="privateDocumentS" status='status'>
					<s:if test="#status.getIndex()<2">
						<div class="list-group">
				 		 <a class="list-group-item" onclick="return viewFileFunction( <s:if test='path!=null'>'<s:property value="ip" escape='false' />','<s:property value="path" escape='false' />',</s:if>'<s:property value="fileuuid" escape='false' />')">
				   		 <h3 class="list-group-item-heading"><s:property value="title" escape='false'/></h3>
				   		  <h4 class="list-group-item-heading"><s:property value="filename" escape='false' /> </h4> 
				   		 <div class="abstract"><p class="list-group-item-text"><s:property value="contents" escape='false'/> </p></div>
				 		 </a> 
						</div> 
					</s:if>
					<s:if test="#status.getIndex()==2">
						<div><p>搜索到 :<label id="totalHitsNum"><s:property value="privateTotalHits" escape='false'/></label> 条结果</p><a id="more" href="" onclick="return searchAgain(false);">更多搜索结果</a></div>
					</s:if>
			    </s:iterator> 		  
			    <h4>他人共享文件</h4>
					
				<s:iterator value="publicDocuments" status='status' > 
					<s:if test="#status.getIndex()<2">
						<div class="list-group">
					 		 <a class="list-group-item" onclick="return viewFileFunction( <s:if test='path!=null'>'<s:property value="ip" escape='false' />','<s:property value="path" escape='false' />',</s:if>'<s:property value="fileuuid" escape='false' />')">
					   		 <h3 class="list-group-item-heading"><s:property value="title" escape='false'/></h3>
					   		 <h4 class="list-group-item-heading"><s:property value="filename" escape='false' /> </h4>
					   		 <div class="abstract"><p class="list-group-item-text"><s:property value="contents" escape='false'/> </p></div>
					 		 </a> 
						</div>  
					</s:if>
					<s:if test="#status.getIndex()==2">
						<div><p>搜索到 :<label id="totalHitsNum"><s:property value="publicTotalHits" escape='false'/></label> 条结果</p><a id="more" href="" onclick="return searchAgain(true);">更多搜索结果</a></div>
					</s:if>
			    </s:iterator> 
		    </s:if>
		    <s:else>
       			<h3> 个人搜索可以同时搜索到个人私有文件和他人上传文件</h3> 
    		</s:else>
    		
		</div>
	</div>
</div>
</body>
</html>