// 路径配置
	
function showCharts() {
				var myChart = echarts.init(document.getElementById('dataAnalysisShow')); 
				var myDate = new Date();
				var allWeekDay = new Array(7); 
				for (var i = 0; i < 7; i++) {
		allWeekDay[i] = getAnotherDay(myDate, 7 - parseInt(i));
				}
				var monthDay = ['1月', '2月', '3月', '4月', '5月', '6月', '7月'];
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
										text: '最近一直搜索次数与平均次数',
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