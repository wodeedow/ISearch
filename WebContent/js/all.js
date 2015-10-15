String.prototype.Trim   =   function()      
{       
    return this.replace(/(^\s*)|(\s*$)/g, "");  
}  
Array.prototype.unique = function() 
{
	var n = {},r=[]; //n为hash表，r为临时数组
	for(var i = 0; i < this.length; i++) //遍历当前数组
	{
		if (!n[this[i]]) //如果hash表中没有当前项
		{
			n[this[i]] = true; //存入hash表
			r.push(this[i]); //把当前数组的当前项push到临时数组里面
		}
	}
	return r; 
}
provinceName = new Array();//用来存储省份的数组
/**
 * 计算最近一周的日期
 */
function getWeekDay()
{
	var myDate = new Date();
	var allWeekDay = new Array(7);
	for (var i = 0; i < 7; i++) {
		allWeekDay[i] = getAnotherDay(myDate, 7 - parseInt(i));
	}
	return allWeekDay;
}
function getAnotherDay(date, offset) {
	var yesterday_milliseconds = date.getTime() - 1000 * 60 * 60 * 24 * parseInt(offset);
	var yesterday = new Date();
				yesterday.setTime(yesterday_milliseconds);
	var strYear = yesterday.getFullYear();
	var strDay = yesterday.getDate();
	var strMonth = yesterday.getMonth() + 1;
	if (strMonth < 10) {
		strMonth = "0" + strMonth;
	}
	datastr = strMonth + "-" + strDay; 
	return datastr;
}
/**
 * 控制div的显示与隐藏
 */
function perpareHTML()  
{
	var allShown=['infoSet','changePassword','sharedFileManage','searchTimesAnalysis','frequencyAnalysis'
		,'timesMapAnalysis','loginLogAnalysis','uploadLogAnalysis','downloadLogAnalysis','netSearchTimesAnalysisShow'
		,'netLoginLogAnalysisShow','netDownloadLogAnalysisShow','netUploadLogAnalysisShow','systemParam']; 
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
/**
 * 取消文件分享 参数fileUUID
 */
function cancleShared(id)
{
	$.ajax({
		type: "POST",
        url:'FileManage.action',
        data:{operationType: 'cancelSharedFile',fileUUID:id},
        dataType:'json',
		success: function(msg){
			 alert('取消成功！');
			 window.location.reload();
		 }
	})
}
/**
 * 修改参数
 */ 
function saveParam(id)
{
	$.ajax({
			type: "POST",
			url:'modifyManage.action',
			data:{field:id,value:document.getElementById(id).value},  
			dataType:'json',
			success: function(msg){
			if(msg.success==true)
			{
				alert("保存成功！");
			}
			else
			{
				alert("保存失败,请稍后重试！")
			}
		 }
	})
}
/**
 * 修改服务器的ip
 */
function modifyServer(serverName,ipInputId)
{
	$.ajax({
			type: "POST",
			url:'modifyServer.action',
			data:{serverName:serverName,value:document.getElementById(ipInputId).value},  
			dataType:'json',
			success: function(msg){
			if(msg.success==true)
			{
				alert("保存成功！");
			}
			else
			{
				alert("保存失败,请稍后重试！")
			}
		 }
	})
}
/**
 * 删除服务器
 */
function deleteServer(serverName)
{
	$.ajax({
			type: "POST",
			url:'deleteServer.action',
			data:{serverName:serverName},  
			dataType:'json',
			success: function(msg){
			if(msg.success==true)
			{
				alert("删除成功！");
			}
			else
			{
				alert("删除失败,请稍后重试！")
			}
		 }
	})
}
/**
 * 添加服务器
 */
function addServer()
{
	$.ajax({
			type: "POST",
			url:'addServer.action',
			data:{ip:document.getElementById('addServerIP').value,reMark:document.getElementById('addServerReMark').value},  
			dataType:'json',
			success: function(msg){
			if(msg.success==true)
			{
				alert("添加成功！");
			}
			else
			{
				alert("添加失败,请稍后重试！")
			}
		 }
	})
}
function openAddServerModal()
{
	$('#addServerModal').modal({
				  keyboard: true 
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

function modifyParamShowFunction()
{
	perpareHTML('systemParam')  ;
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
/**
 * 显示省份对比图表
 */
function provinceCompareShow(analysisType)
{
	if(provinceName.length==0)
	{
		alert('请至少选择一个省份');
		return false;
	}
	else
	{
		if(analysisType=='ProvinceLoginLog')
		{
			document.getElementById('compareType').innerHTML='登录日志对比';
		}
		else if(analysisType=='ProvinceUploadLog')
		{
			document.getElementById('compareType').innerHTML='上传日志对比';
		}
		else if(analysisType=='ProvinceDownloadLog')
		{
			document.getElementById('compareType').innerHTML='下载日志对比';
		}
		getConfig(analysisType);
	}
	
}
function getConfig(analysisType){  
	$.ajax
		({
			type: "POST",
			url: 'DataAnalysis',
			traditional: true,
			data: { operationType: 'provinceAnalysis' ,analysisType:analysisType,provinceName:provinceName.unique()},
			dataType: 'json',
			success: function (msg) 
			{
				  var  provinceConfig = new Object();  
     			  provinceConfig.provinceName=msg.provinceName; 
       			  provinceConfig.provinceData=msg.provinceData;
				  provinceCompareShowChart(provinceConfig);
			}
		})
};  
function provinceCompareShowChart(provinceConfig)
{    
	var provinceCompareChart= echarts.init(document.getElementById('provinceCompare'));               
    var  option = {
    tooltip : {
        trigger: 'axis'
    },
    legend: {
       		data: provinceConfig.provinceName
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : getWeekDay() 
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
      series : provinceConfig.provinceData
	};
	provinceCompareChart.setOption(option);
                        
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
function showDownloadLogChart() {
	var uploadAnalysisChart = echarts.init(document.getElementById('downloadLogAnalysisShow'));
	var myDate = new Date();
	var allWeekDay = new Array(7);
	for (var i = 0; i < 7; i++) {
		allWeekDay[i] = getAnotherDay(myDate, 7 - parseInt(i));
		}
	$.ajax
		({
			type: "POST",
			url: 'DataAnalysis',
			data: { operationType: 'downloadLogAnalysis' },
			dataType: 'json',
			success: function (msg) {
			var personData=msg.userResourceLogJSON;
			var averageData=msg.netResourceLogJSON; 
			var option = {
				    title : {
				        text: '最近一周下载文件次数',
				        subtext: '基于您的下载历史'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['个人下载情况','全网平均下载情况']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data :allWeekDay
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            axisLabel : {
				                formatter: '{value}次'
				            }
				        }
				    ],
				    series : [
				        {
				            name:'个人下载情况',
				            type:'line',
				            data:personData,
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        },
				        {
				            name:'全网平均下载情况',
				            type:'line',
				            data:averageData,
				            markLine : {
				                data : [
				                    {type : 'average', name : '平均值'}
				                ]
				            }
				        }
				    ]
				};          
				uploadAnalysisChart.setOption(option);      
			}

		})
	return false;
}
function showfrequencyAnalysisCharts()
 {
	 var frequencyAnalysisChart= echarts.init(document.getElementById('frequencyAnalysisShow')); 
	$.ajax
		({
			type: "POST",
			url: 'DataAnalysis',
			data: { operationType: 'frequencyAnalysis' },
			dataType: 'json',
			success: function (msg) 
			{
				var dataArr=$(msg)[0];
				var dataValueArr=$(msg)[1];
				option = {
					title : {
						text: '您的词频统计',
						subtext: '基于您的搜索记录',
						x:'center'
					},
					tooltip : {  
						trigger: 'item',
						formatter: "{a} <br/>{b} : {c} ({d}%)"
					},
					legend: {
						orient : 'vertical',
						x : 'left',
						data:dataArr
					},
					toolbox: {
						show : true,
						feature : {
							mark : {show: true},
							dataView : {show: true, readOnly: false},
							magicType : {
								show: true, 
								type: ['pie', 'funnel'],
								option: {
									funnel: {
										x: '25%',
										width: '50%',
										funnelAlign: 'left',
										max: 1548
									}
								}
							},
							restore : {show: true},
							saveAsImage : {show: true}
						}
					},
					calculable : true,
					series : [
						{
							name:'词语',
							type:'pie',
							radius : '55%',
							center: ['50%', '60%'],
							data:dataValueArr
						}
					]
				};
				frequencyAnalysisChart.setOption(option); 
                    
			}
		})
		return false;
}			
function showLoginLogChart() {
	var loginAnalysisChart = echarts.init(document.getElementById('loginLogAnalysisShow'));
	var myDate = new Date();
	var allWeekDay = new Array(7);
	for (var i = 0; i < 7; i++) {
		allWeekDay[i] = getAnotherDay(myDate, 7 - parseInt(i));
		}
	$.ajax
		({
			type: "POST",
			url: 'DataAnalysis',
			data: { operationType: 'loginLogAnalysis' },
			dataType: 'json',
			success: function (msg) {
			var personData=msg.userLoginLogJSON;
			var averageData=msg.netLoginLogJSON; 
			var option = {
				    title : {
				        text: '最近一周登录次数',
				        subtext: '基于您的登录历史'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['个人登录情况','全网平均情况']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data :allWeekDay
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            axisLabel : {
				                formatter: '{value} 次'
				            }
				        }
				    ],
				    series : [
				        {
				            name:'个人登录情况',
				            type:'line',
				            data:personData,
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        },
				        {
				            name:'全网平均情况',
				            type:'line',
				            data:averageData,
				            markPoint : {
				             data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name : '平均值'}
				                ]
				            }
				        }
				    ]
				};          
				loginAnalysisChart.setOption(option);      
			}

		})
	return false;
}	
function showCharts()
 {
	var myChart = echarts.init(document.getElementById('dataAnalysisShow')); 
	var myDate = new Date();
	var allWeekDay = new Array(7); 
	for (var i = 0; i < 7; i++) {
		allWeekDay[i] = getAnotherDay(myDate, 7 - parseInt(i));
	}
	$.ajax
	({
		type: "POST",
		url: 'DataAnalysis',
		data: { operationType: 'GET_SEARCH_TIMES', timeType: 'WEEK' },
		dataType: 'json',
		success: function (msg) 
		{
			personWeekInfoJSON=msg.personWeekInfoJSON;
			allNetWeekInfoJSON=msg.allNetWeekInfoJSON;
			option = {
					title: {
							text: '最近一周搜索次数与平均次数',
							subtext: '基于您的搜索记录'
						},
						tooltip: {
							trigger: 'axis'
						},
						legend: {
							data: ['您的搜索次数', '全网平均次数']
						},
						toolbox: {
							show: true,
							feature: {
								mark: { show: true },
								dataView: { show: true, readOnly: false },
								magicType: { show: true, type: ['line', 'bar'] },
								restore: { show: true },
								saveAsImage: { show: true }
							}
						},
						calculable: true,
						xAxis: [
							{
								type: 'category',
								data: allWeekDay
							}
						],
						yAxis: [
							{
								type: 'value'
							}
						],
							series: [
								{
									name: '您的搜索次数',
									type: 'bar',
									data: personWeekInfoJSON,
									markPoint: {
										data: [
											{ type: 'max', name: '最大值' },
											{ type: 'min', name: '最小值' }
										]
									},
									markLine: {
										data: [
											{ type: 'average', name: '平均值' }
										]
									}
								},
								{
									name: '全网平均次数',
									type: 'bar',
									data: allNetWeekInfoJSON,
									markPoint: {
										data: [
											{ type: 'max', name: '最大值' },
											{ type: 'min', name: '最小值' }
										]
									},												
									markLine: {
										data: [
											{ type: 'average', name: '平均值' }
										]
									}
								}
							]
						};
		myChart.setOption(option); 
		}
	})
}  
function timesMapAnalysisShow()
{
	 var timesMapAnalysisChart= echarts.init(document.getElementById('mapAnalysisShow')); 
		$.ajax
		({
			type: "POST",
			url: 'DataAnalysis',
			data: { operationType: 'timesMapAnalysis' },
			dataType: 'json',
			success: function (msg) 
			{
				var dataArr=$(msg);
				option = {
				title : {
					text: '搜索ip地区分布',
					subtext: '根据全网搜索记录生成',
					x:'center'
				},
				tooltip : {
					trigger: 'item'
				},
				legend: {
					orient: 'vertical',
					x:'left',
					data:['搜索次数分析']
				},
				dataRange: {
					min: 0,
					max: 20,
					x: 'left',
					y: 'bottom',
					text:['高','低'],           // 文本，默认为数值文本
					calculable : true
				},
				toolbox: {
					show: true,
					orient : 'vertical',
					x: 'right',
					y: 'center',
					feature : {
						mark : {show: true},
						dataView : {show: true, readOnly: false},
						restore : {show: true},
						saveAsImage : {show: true}
					}
				},
				roamController: {
					show: true,
					x: 'right',
					mapTypeControl: {
						'china': true
					}
				},
				series : [
					{
						name: '搜索次数分析',
						type: 'map',
						mapType: 'china',
						selectedMode : 'multiple',
						roam: false,
						itemStyle:{
							normal:{label:{show:true}},
							emphasis:{label:{show:true}}
						},
						data:dataArr
						}
					]
				}; 
				
				timesMapAnalysisChart.on('mapSelected', function (param){ 
				    var selected = param.selected;
					var provinceString='当前选择的省份:'
				    for (var p in selected) {
				        if (selected[p]) {
				           provinceName.push(p);
						   provinceString=provinceString+p+' ';
				        }
				    }
					document.getElementById('provinceSelected').innerHTML=provinceString;
					
					})
		      timesMapAnalysisChart.setOption(option);              
			}
			}
		);
		  
}

function showUploadLogChart() {
	var uploadAnalysisChart = echarts.init(document.getElementById('uploadLogAnalysisShow'));
	var myDate = new Date();
	var allWeekDay = new Array(7);
	for (var i = 0; i < 7; i++) {
		allWeekDay[i] = getAnotherDay(myDate, 7 - parseInt(i));
		}
	$.ajax
		({
			type: "POST",
			url: 'DataAnalysis',
			data: { operationType: 'uploadLogAnalysis' },
			dataType: 'json',
			success: function (msg) {
			var personData=msg.userResourceLogJSON;
			var averageData=msg.netResourceLogJSON; 
			var option = {
				    title : {
				        text: '最近一周上传文件次数',
				        subtext: '基于您的上传历史'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['个人上传情况','全网平均上传情况']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data :allWeekDay
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            axisLabel : {
				                formatter: '{value}次'
				            }
				        }
				    ],
				    series : [
				        {
				            name:'个人上传情况',
				            type:'line',
				            data:personData,
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        },
				        {
				            name:'全网平均情况',
				            type:'line',
				            data:averageData,
							  markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name : '平均值'}
				                ]
				            }
				        }
				    ]
				};          
				uploadAnalysisChart.setOption(option);      
			}

		})
	return false;
}
/*
* 管理员查看全网搜索次数，以及系信息
*/
function showNetSearchTimesChart()
 {
	perpareHTML('netSearchTimesAnalysisShow');
	var netSearchTimesChart = echarts.init(document.getElementById('netSearchTimesAnalysisShow')); 
	var myDate = new Date();
	var allWeekDay = new Array(7); 
	for (var i = 0; i < 7; i++) {
allWeekDay[i] = getAnotherDay(myDate, 7 - parseInt(i));
	}
	$.ajax
	({
		type: "POST",
		url: 'NetDataAnalysis',
		data: { operationType: 'netSearchTimes'},
		dataType: 'json',
		success: function (msg) 
		{
			allNetWeekInfoJSON=msg.allNetWeekInfoJSON;
			option = {
					title: {
							text: '最近一周搜索次数与平均次数',
							subtext: '基于您的搜索记录'
						},
						tooltip: {
							trigger: 'axis'
						},
						legend: {
							data: ['全网平均次数']
						},
						toolbox: {
							show: true,
							feature: {
								mark: { show: true },
								dataView: { show: true, readOnly: false },
								magicType: { show: true, type: ['line', 'bar'] },
								restore: { show: true },
								saveAsImage: { show: true }
							}
						},
						calculable: true,
						xAxis: [
							{
								type: 'category',
								data: allWeekDay
							}
						],
						yAxis: [
							{
								type: 'value'
							}
						],
							series: [
								{
									name: '全网平均次数',
									type: 'bar',
									data: allNetWeekInfoJSON,
									markPoint: {
										data: [
											{ type: 'max', name: '最大值' },
											{ type: 'min', name: '最小值' }
										]
									},												
									markLine: {
										data: [
											{ type: 'average', name: '平均值' }
										]
									}
								}
							]
						};
		netSearchTimesChart.setOption(option); 
		}
	})
} 
/**
 * 全网登录信息
 */
function showNetLoginLogChart() {
	perpareHTML('netLoginLogAnalysisShow');
	var netLoginAnalysisChart = echarts.init(document.getElementById('netLoginLogAnalysisShow'));
	var myDate = new Date();
	var allWeekDay = new Array(7);
	for (var i = 0; i < 7; i++) {
		allWeekDay[i] = getAnotherDay(myDate, 7 - parseInt(i));
		}
	$.ajax
		({
			type: "POST",
			url: 'NetDataAnalysis',
			data: { operationType: 'netLoginLogAnalysis' },
			dataType: 'json',
			success: function (msg) {
			var personData=msg.userLoginLogJSON;
			var averageData=msg.netLoginLogJSON; 
			var option = {
				    title : {
				        text: '最近一周登录次数',
				        subtext: '基于您的登录历史'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['全网登录情况']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data :allWeekDay
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            axisLabel : {
				                formatter: '{value} 次'
				            }
				        }
				    ],
				    series : [
				        {
				            name:'全网平均情况',
				            type:'line',
				            data:averageData,
				            markPoint : {
				             data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name : '平均值'}
				                ]
				            }
				        }
				    ]
				};          
				netLoginAnalysisChart.setOption(option);      
			}

		})
	return false;
}	
/**
 * 全网下载信息
 */
function showNetDownloadLogChart() {
	perpareHTML('netDownloadLogAnalysisShow');
	var uploadAnalysisChart = echarts.init(document.getElementById('netDownloadLogAnalysisShow'));
	var myDate = new Date();
	var allWeekDay = new Array(7);
	for (var i = 0; i < 7; i++) {
		allWeekDay[i] = getAnotherDay(myDate, 7 - parseInt(i));
		}
	$.ajax
		({
			type: "POST",
			url: 'NetDataAnalysis',
			data: { operationType: 'netDownloadLogAnalysis' },
			dataType: 'json',
			success: function (msg) {
			var averageData=msg.netResourceLogJSON; 
			var option = {
				    title : {
				        text: '最近一周下载文件次数',
				        subtext: '基于您的下载历史'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['全网下载情况']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data :allWeekDay
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            axisLabel : {
				                formatter: '{value}次'
				            }
				        }
				    ],
				    series : [
				        {
				            name:'全网平均下载情况',
				            type:'line',
				            data:averageData,
				             markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name : '平均值'}
				                ]
				            }
				        }
				    ]
				};          
				uploadAnalysisChart.setOption(option);      
			}

		})
	return false;
}
/**
 * 全网上传信息
 */
function showNetUploadLogChart() {
	perpareHTML('netUploadLogAnalysisShow');
	var netUploadAnalysisChart = echarts.init(document.getElementById('netUploadLogAnalysisShow'));
	var myDate = new Date();
	var allWeekDay = new Array(7);
	for (var i = 0; i < 7; i++) {
		allWeekDay[i] = getAnotherDay(myDate, 7 - parseInt(i));
		}
	$.ajax
		({
			type: "POST",
			url: 'DataAnalysis',
			data: { operationType: 'uploadLogAnalysis' },
			dataType: 'json',
			success: function (msg) {
			var personData=msg.userResourceLogJSON;
			var averageData=msg.netResourceLogJSON; 
			var option = {
				    title : {
				        text: '最近一周上传文件次数',
				        subtext: '基于全网的上传历史'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['全网上传情况']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data :allWeekDay
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            axisLabel : {
				                formatter: '{value}次'
				            }
				        }
				    ],
				    series : [
				        {
				            name:'全网平均情况',
				            type:'line',
				            data:averageData,
							  markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name : '平均值'}
				                ]
				            }
				        }
				    ]
				};          
				netUploadAnalysisChart.setOption(option);      
			}

		})
	return false;
}