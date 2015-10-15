
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