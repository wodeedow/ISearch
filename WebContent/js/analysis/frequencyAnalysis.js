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
			
	