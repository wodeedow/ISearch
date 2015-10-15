provinceName = new Array();
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
				    for (var p in selected) {
				        if (selected[p]) {
				           provinceName.push(p);
				        }
				    }
					})
		      timesMapAnalysisChart.setOption(option);              
			}
			}
		);
		  
}
function provinceCompareShow()
{
	if(provinceName.length==0)
	{
		alert('请至少选择一个省份');
		return false;
	}
	else
	{
		getConfig();
	}
	
}
function getConfig(){  
	$.ajax
		({
			type: "POST",
			url: 'DataAnalysis',
			traditional: true,
			data: { operationType: 'provinceAnalysis' ,analysisType:'ProvinceLoginLog',provinceName:provinceName.unique()},
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
