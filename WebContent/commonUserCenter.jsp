<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="shu.mike.bean.User"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%  
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html> 
<html lang="zh-CN"> 
<head>
<meta charset="UTF-8">
<title>个人中心</title>
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/style_center.css">
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript"  charset="utf-8" src="js/lib/echarts-all.js" ></script>
    <script type="text/javascript"  charset="utf-8" src="js/all.js" ></script> 
<style type="text/css">
    /* Custom Styles */
    ul.nav-tabs{
        width: 250px;
        margin-top: 20px;
        border-radius: 4px;
        border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
    }
    ul.nav-tabs li{
        margin: 0;
        border-top: 1px solid #ddd;
    }
    ul.nav-tabs li:first-child{
        border-top: none;
    }
    ul.nav-tabs li a{
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }
    /*ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
        color: #fff;
        background: #0088cc;
        border: 1px solid #0088cc;
    }*/
    ul.nav-tabs li:first-child a{
        border-radius: 4px 4px 0 0;
    }
    ul.nav-tabs li:last-child a{
        border-radius: 0 0 4px 4px;
    }
    ul.nav-tabs.affix{
        top: 30px; /* Set the top position of pinned element */
    }
    .nav-header.collapsed > span.glyphicon-chevron-toggle:before {
        content: "\e114";
    }
    .nav-header > span.glyphicon-chevron-toggle:before {
        content: "\e113";
    }
   .secondmenu{
        padding-left: 20px;
        padding-right: 20px;
    }
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
    <div class="container">
        <header id="header" class="row">
            <div class="header-in col-xs-12">
                <h1 id="logo"><a href="index.html">ISearch</a></h1>
                <a href="index.html">
                    <img id="logo_img" src="images/ISearch_Logo_min2.png" width="40" height="40" />
                </a>
                <nav id="navigation" class="navigation">
                    <ul id="nav">
                        <li><a href="index.html">主页</a></li>
                        <li><a href="disk.jsp">网盘</a></li>            
                        <input type="text" style="display:none"  id="UER_UUID" name="userUUID" value="<%=session.getAttribute("USER_UUID") %>"> 
                        <input type="text" style="display:none"  id="USER_NAME" name="userUUID" value="<%=session.getAttribute("USER_NAME") %>">
                        <li><a id ="SPAN_USER_ID" href="#"><%=session.getAttribute("USER_NAME") %></a>
                            <ul>
                                <li class="current-menu-item"><a href="viewCenter.action">个人中心</a></li>
                                <li><a href="logout.action">注 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
    </div>
	<!-- add server node modal -->
	<div class="modal fade" id="addServerModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">添加服务器</h4>
	      </div>
	      <div class="modal-body">
	       <input type="text" class="form-control" id="addServerIP" placeholder="请输入服务器ip地址"> <br/>
	       <input type="text" class="form-control" id="addServerReMark" placeholder="请输入服务器描述信息"> <br/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" onclick="return addServer();" class="btn btn-primary">添加服务器</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->





    <div class="container">
        <div class="row">
            <div class="col-xs-3" id="myScrollspy">

                <ul id="main-nav" class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                    
                    <li>
                        <a href="#Information" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-user"></i>
                            个人信息
                            <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="Information" class="nav nav-list secondmenu collapse">
                            <li><a href="#" onclick="getPersonInfoFunction();" ><i class="glyphicon glyphicon-minus" onclick="return "></i>&nbsp;个人信息 查看修改</a></li>
                            <li><a href="#" onclick="changePasswordFunction();" ><i class="glyphicon glyphicon-minus"></i>&nbsp;修改密码</a></li>
                            <li><a href="#" onclick="sharedFileManageFunction();" ><i class="glyphicon glyphicon-minus"></i>&nbsp;共享文件统一管理</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#dataAnalysis" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-stats"></i>
                            个人数据分析    
                            <span class="pull-right glyphicon  glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="dataAnalysis" class="nav nav-list secondmenu collapse">
                            <li><a href="#" onclick="return searchTimeFunction();" ><i class="glyphicon glyphicon-minus"></i>&nbsp;搜索次数分析</a></li>
                            <li><a href="#" onclick="return frequencyAnalysisFunction();"><i class="glyphicon glyphicon-minus"></i>&nbsp;搜索词频分析</a></li>
                            <li><a href="#" onclick="return timesMapAnalysisFunction();"><i class="glyphicon glyphicon-minus"></i>&nbsp;地理分布分析</a></li>
                        </ul>
                    </li>
 
                    <li>
                        <a href="#logAnalysis" class="nav-header collapsed" data-toggle="collapse"> 
                            <i class="glyphicon glyphicon-list-alt"></i>
                            日志分析
                            <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="logAnalysis" class="nav nav-list secondmenu collapse">
                            <li><a href="#"  onclick="return loginLogTableShowFunction();" ><i class="glyphicon glyphicon-minus"></i>&nbsp;登录日志</a></li>
                            <li><a href="#"  onclick="return uploadLogTableShowFunction();" ><i class="glyphicon glyphicon-minus"></i>&nbsp;上传日志</a></li>
                            <li><a href="#"  onclick="return downloadLogTableShowFunction();"><i class="glyphicon glyphicon-minus"></i>&nbsp;下载日志分析</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#Setting" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-cog"></i>
                            全网信息查看
                            <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                        </a>
                        <ul id="Setting" class="nav nav-list secondmenu collapse">
                            <li><a href="#" onclick="showNetLoginLogChart();"><i class="glyphicon glyphicon-minus"></i>&nbsp;全网登录日志统计</a></li>
                            <li><a href="#" onclick="showNetUploadLogChart();"><i class="glyphicon glyphicon-minus"></i>&nbsp;全网上传日志统计</a></li>
                            <li><a href="#" onclick="showNetDownloadLogChart();"><i class="glyphicon glyphicon-minus"></i>&nbsp;全网下载日志统计</a></li>         
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="col-xs-9">
                <!---------------------------------------------- infoSet 个人信息查看与设置---------------------------------------------------------------------  -->
                <div class="row">
                    <div class="col-xs-10 col-xs-offset-1">
                        <div id="infoSet" style="display:none">
                    		<div class="isearch-head">
                    			<h1>iSearch</h1>
                    		</div>
                    		<form action="AccountcService" method="post">
                    		<table class="table table-hover">
                    			<tr>
                    				<td class="active">用户名</td>
                    				<td class="success"><input id="center_USER_ID" name="userName" class="form-control" type="text" value="<%=session.getAttribute("USER_NAME") %>" readonly></td>
                    			</tr>
                    			<tr>
                    				<td class="active">邮箱</td>
                    				<td class="success"> <input id="center_ContactInfo" name="email"  type="email" class="form-control" id="ContactInfo"  placeholder="输入常用邮箱地址"></td>
                    			</tr>
                    			<tr>
                    				<td class="active">性别</td>
                    				<td class="success"> 
                    				<label class="radio-inline">
                    					<input id="center_Sex_Man" type="radio" name="sex" value="true"> 男性
                    				</label>
                    				<label class="radio-inline">
                    					<input id="center_Sex_Woman"type="radio" name="sex" id="Sex" value="false"> 女性
                    				</label>
                    				</td>
                    			</tr>
                    			<tr>
                    				<td class="active">是否记录搜索信息</td> 
                    				<td class="success"> 
                    				<label class="radio-inline">
                    					<input id="center_TrackInfo" type="radio" name="notTrack" value="true"> 记录
                    				</label>
                    				<label class="radio-inline">
                    					<input id="center_notTrackInfo"type="radio" name="notTrack" id="notTrack" value="false"> 不记录
                    				</label>
                    				</td>
                    			</tr>
                    			<tr>
                    				<td class="active">公司/学校</td>
                    				<td class="success"><input id="center_School" name="organizations" type="text" class="form-control" placeholder="Text input"></td>
                    			</tr>
                    			<tr>
                    				<input type="text" style="display:none" name="operationType" value="setInfo">
                    			</tr>
                    		</table>
                    		<div class="submit">
                    			<button type="submit" class="btn btn-primary" onclick="return updateInfo();">更改</button>
                    		</div>
                    		</form>
                    	</div>
                <!---------------------------------------------------  changePassword 更换密码 ----------------------------------------------------------------------- -->
                    	<div id="changePassword" style="display:none">
                    		<div class="isearch-head">
                    			<h1>iSearch</h1>
                    		</div>
                    		<form action="AccountcService" method="post">
                    		<table class="table table-hover">
                    			<tr>
                    				<td class="active">用户名</td>
                    				<td class="success"><input type="text" name="USER_NAME" value="<%=session.getAttribute("USER_NAME") %>" readonly></td>
                    			</tr>
                    			<tr>
                    				<td class="active">旧密码</td>
                    				<td class="success"> <input id="change_oldPassword" name="oldPassword"  type="text" class="form-control" placeholder="输入旧密码"></td>
                    			</tr>
                    			<tr>
                    				<td class="active">新密码</td>
                    				<td class="success"> <input id="change_newPassword" name="newPassword"  type="text" class="form-control" placeholder="输入新密码"></td>
                    			</tr>
                    			<tr>
                    				<td class="active">重复新密码</td>
                    				<td class="success"> <input id="change_repeat_newPassword" name="repeat_newPassword"  type="text" class="form-control" placeholder="重复新密码"></td>
                    			</tr>
                    			<tr>
                    			 <input type="text" style="display:none" name="operationType" value="setPassword">
                    			</tr>
                    		</table>
                    		<div class="submit">
                    			<button type="submit" class="btn btn-default">更改</button>
                    		</div>
                    		</form>
                    	</div>
                          <!-- ----------------------------------------------------------------  sharedFileManage 分享文件管理-------------------------------------------------------------- -->
                      	<div id="sharedFileManage" style="display:none">
                    		<script id="sharedFileTableTemplate" type="text/html"> 
    							<table class="table table-hover">
    								<tr class="success">
    									<th class="success">序号</th>
    									<th class="success">文件名</th>
    									<th class="success">文件ID</th>
    									<th class="success">管理</th>
    								</tr>
    								{{each sharedFileList as value i}}
    									<tr class="info">
    										<td class="success">{{i+1}}</td>
    										<td class="success">{{value.fileUUID}}</td>
    										<td class="success">{{value.fileName}}</td>
    										<td class="success"><button class="btn btn-primary" id={{value.fileUUID}} onclick="return cancleShared(this.id)">取消分享</button></td> 
    									</tr>
    									{{/each}}
    							</table>
    								<nav>
    								  <ul class="pagination">
    									{{each pageCount as value i}}
    									<li><a href="#" onclick="return refreshSharedFileTableContent(this.id);" id='{{value}}'>{{value}}</a></li>
    									 {{/each}}
    								  </ul>
    								</nav>
                    		</script>
                    		<div id="sharedFileTableContent"></div>
                    			<script type="text/javascript"  charset="utf-8" src="js/lib/template.js" ></script> 
                    		<script>
                    			refreshSharedFileTableContent(1);
                    			function refreshSharedFileTableContent(pageIndex) 
                    			{
                    				$.ajax({
                    			       type: "POST",
                    			       url: 'SharedFileManage',
                    			       data: { operationType: 'getSharedFileTable', pageIndex: pageIndex },
                    			       dataType: 'json',
                    			       success: function (msg) {
                    					var html = template('sharedFileTableTemplate', msg);
                    						document.getElementById('sharedFileTableContent').innerHTML = html;
                    				  	 }
                    		   		}); 
                    				return false;
                    			}	
                    		</script>
                    	</div>
                    </div>
                </div>
                   <!--------- ------------------------------------------------- searchTimesAnalysis  搜索次数分析------------------------------------------------------------------------------- -->
                    <div id="searchTimesAnalysis" style="display:none">
                		<div id="dataAnalysisShow"> 
                		</div>
                	</div>
                    <!-- ----------------------------------------------------  frequencyAnalysis  搜索词频分析-----------------------------------------------------------------------------------  -->
                	<div id="frequencyAnalysis" style="display:none" >
                		<div id="frequencyAnalysisShow">       
                		</div>
                	</div>
                    <!-- ------------------------------------------------   timesMapAnalysis  省份搜索次数分析---------------------------------------------------------------------------------- -->
                      <div id="timesMapAnalysis" style="display:none" >
                            <div id="mapAnalysisShow"></div>
                            <br/>
                            <div class="row">
                                <div class="col-xs-4">
                                    <div id='provinceSelected' style="margin-top:7px">当前选择的省份</div>
                                </div>
                                <div class="col-xs-1 col-xs-offset-2">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">日志比较<span class="caret"></span></button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#" onclick="return provinceCompareShow('ProvinceLoginLog')">登录日志</a></li>
                                            <li><a href="#" onclick="return provinceCompareShow('ProvinceUploadLog')" >上传日志</a></li>
                                            <li><a href="#" onclick="return provinceCompareShow('ProvinceDownloadLog')" >下载日志</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xs-2">
                                    <div id='compareType' style="margin-top:7px">类型：</div>
                                </div>
                            </div>
                                <div id="provinceCompare" style="display:none" ></div>
                         </div>
                    <!-- ------------------------------------------------  loginLogAnalysis 登录次数分析--------------------------------------------------------------------------------------- -->
                	<div id="loginLogAnalysis" style="display:none" >
                		<div id="loginLogAnalysisShow"> 
                		</div>
                		<script id="loginTableTemplate" type="text/html">
							<table class="table table-hover">
								<tr class="success">
									<th class="success">序号</th>
									<th class="success">时间</th>
									<th class="success">地点</th>
									<th class="success">ip</th>
								</tr>
								{{each loginList as value i}}
									<tr class="info">
										<td class="success">{{i+1}}</td>
										<td class="success">{{value.loginDate}}</td>
										<td class="success">{{value.address}}</td>
										<td class="success">{{value.ip}}</td>
									</tr>
									{{/each}}
							</table>
								<nav>
								  <ul class="pagination">
									{{each pageCount as value i}}
									<li><a href="#" onclick="return refreshTableContent(this.id);" id='{{value}}'>{{value}}</a></li>
									 {{/each}}
								  </ul>
								</nav>
                		</script>
                		<div id="tableContent"></div>
                			<script type="text/javascript"  charset="utf-8" src="js/lib/template.js" ></script>
                		<script>
                			refreshTableContent(1);
                			function refreshTableContent(pageIndex)
                			{
                				$.ajax({
                			       type: "POST",
                			       url: 'LogAnalysis',
                			       data: { operationType: 'getLoginLogTable', pageIndex: pageIndex },
                			       dataType: 'json',
                			       success: function (msg) {
                					var html = template('loginTableTemplate', msg);
                						document.getElementById('tableContent').innerHTML = html;
                				  	 }
                		   		}); 
                				return false;
                			}	
                		</script>
                	</div>
                    <!-- --------------------------------------------------------------  uploadLogAnalysis   上传日志分析-------------------------------------------------------------------- -->
            		<div id="uploadLogAnalysis" style="display:none" >
						<div id="uploadLogAnalysisShow"> 
						</div>
            		<script id="uploadTableTemplate" type="text/html">
						<table class="table table-hover">
							<tr class="success">
								<th class="success">序号</th>
								<th class="success">时间</th>
								<th class="success">文件ID</th>
								<th class="success">文件名</th>
							</tr>
							{{each uploadResourceList as value i}}
								<tr class="info">
									<td class="success">{{i+1}}</td>
									<td class="success">{{value.loadDate}}</td>
									<td class="success">{{value.fileUUID}}</td>
									<td class="success">{{value.fileName}}</td>
								</tr>
								{{/each}}
						</table>
							<nav>
							  <ul class="pagination">
								{{each pageCount as value i}}
								<li><a href="#" onclick="return refreshUploadTableContent(this.id);" id='{{value}}'>{{value}}</a></li>
								 {{/each}}
							  </ul>
							</nav>
            		</script>
            		<div id="uploadTableContent"></div>
            			<script type="text/javascript"  charset="utf-8" src="js/lib/template.js" ></script>
            		<script>
            			refreshUploadTableContent(1);
            			function refreshUploadTableContent(pageIndex)
            			{
            				$.ajax({
            			       type: "POST",
            			       url: 'LogAnalysis',
            			       data: { operationType: 'getUploadLogTable', pageIndex: pageIndex },
            			       dataType: 'json',
            			       success: function (msg) {
            					var html = template('uploadTableTemplate', msg); 
            						document.getElementById('uploadTableContent').innerHTML = html;
            				  	 }
            		   		}); 
            				return false;
            			}	 
            		</script>
            	</div>
	       <!--  ------------------------------------------------------   downloadLogAnalysis  下载日志分析------------------------------------------------------------------------>
			<div id="downloadLogAnalysis" style="display:none">
        		<div id="downloadLogAnalysisShow"> 
        		</div>
        		<script id="downloadTableTemplate" type="text/html">
					<table class="table table-hover">
						<tr class="success">
							<th class="success">序号</th>
							<th class="success">时间</th>
							<th class="success">文件ID</th>
							<th class="success">文件名</th>
						</tr>
						{{each downloadResourceList as value i}}
							<tr class="info">
								<td class="success">{{i+1}}</td>
								<td class="success">{{value.loadDate}}</td>
								<td class="success">{{value.fileUUID}}</td>
								<td class="success">{{value.fileName}}</td>
							</tr>
							{{/each}}
					</table>
						<nav>
						  <ul class="pagination">
							{{each pageCount as value i}}
							<li><a href="#" onclick="return refreshDownloadTableContent(this.id);" id='{{value}}'>{{value}}</a></li>
							 {{/each}}
						  </ul>
						</nav>
        		</script>
        		<div id="dwonloadTableContent"></div>
        			<script type="text/javascript"  charset="utf-8" src="js/lib/template.js" ></script>
        		<script>
        			refreshDownloadTableContent(1);
        			function refreshDownloadTableContent(pageIndex)
        			{
        				$.ajax({
        			       type: "POST",
        			       url: 'LogAnalysis',
        			       data: { operationType: 'getDownloadLogTable', pageIndex: pageIndex },
        			       dataType: 'json',
        			       success: function (msg) {
        					var html = template('downloadTableTemplate', msg);
        						document.getElementById('dwonloadTableContent').innerHTML = html;
        				  	 }
        		   		}); 
        				return false;
        			}	 
        		</script>
        	</div>
            <!-------------------------------netSearchTimesAnalysisShow 全网搜索信息展示------------------------------- -->
              <div id="netSearchTimesAnalysisShow" style="display:none" >
              </div>
             <!--- ----------------------------netLoginLogAnalysisShow 全网登录信息展示------------------------------- -->
             <div id="netLoginLogAnalysisShow" style="display:none" >
             </div>
                 
             <!--- ----------------------------netDownloadLogAnalysisShow 全网下载信息展示------------------------------- -->
              <div id="netDownloadLogAnalysisShow" style="display:none" >
             </div>
              <!--- ----------------------------netUploadLogAnalysisShow 全网上传信息展示------------------------------- -->
              <div id="netUploadLogAnalysisShow" style="display:none" >
             </div>
             <div id="systemParam" style="display:none" >
             </div>
                
            </div>
        </div>
    </div>
</body>
</html>
