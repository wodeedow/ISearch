<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="shu.mike.bean.User"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lte IE 8]>
					<html class="ie8 no-js" lang="en">
					<![endif]-->
<!--[if (gte IE 9)|!(IE)]>
						<!-->
<html class="not-ie no-js" lang="en">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<meta name="description" content="搜索引擎">
	<meta name="author" content="Woohao,Zhangminghu">
		<!-- 新 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet"
			href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css">
			<!-- 可选的Bootstrap主题文件（一般不用引入） -->
			<link rel="stylesheet"
				href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
				<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
				<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
				<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
				<script
					src="http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
				<script src="js/visualization/ontovisualization.js"></script>
				<script src="js/lib/d3.v3.min.js"></script>
				<link rel="stylesheet" href="css/manage.css" />
</head>
<body>
	<div class="modal fade" id="ontoMenuModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">节点编辑菜单</h4>
				</div>
				<div class="modal-body">
					<p>当前选中节点名字：</p>
					<p id="currentSelectedNode">One fine body&hellip;</p>
					<div class="btn-group btn-group-vertical btn-group-justified"
						role="group" aria-label="...">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-primary" onclick="return deleteOntoNode();">
								删除该节点及其子节点</button>
						</div>
					</div>
					<p></p>
					<div class="btn-group btn-group-vertical btn-group-justified"
						role="group" aria-label="...">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-primary" onclick="return addOntoNode();">添加子节点</button> 
						</div>
					</div>
					<p></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭对话框（ESC）</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<!-- add onto node modal -->
	<div class="modal fade" id="addOntoNodeModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">添加子类</h4>
	      </div>
	      <div class="modal-body">
	       <input type="text" class="form-control" id="subClassName" placeholder="请输入添加子类的名称">  
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" onclick="return saveSubclass();" class="btn btn-primary">添加节点</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div id="container">
		<div id="ontoEditer"></div>
	</div>
	
			<!-- confrim delete class modal -->
		<div class="modal fade" id="deleteOntoNodeModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">确认删除:<p id="confirmDeleteClass"></p></h4>
		      </div> 
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary" onclick="return deleteClass();" >确认删除</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	<div id="container">
		<div id="ontoEditer"></div>
	</div>
</body>

</html>