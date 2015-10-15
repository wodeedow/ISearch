/**
 * 
 */
window.onload=showOntoVsiaulization;
 

function showOntoVsiaulization()
{
	var width = 5000,
	height = 10000;
	
	var tree = d3.layout.tree()
		.size([10000, 5000])
		.separation(function(a, b) { return (a.parent == b.parent ? 1 : 2) / a.depth; });
	
	var svg = d3.select("body").select("#ontoEditer").append("svg")
		.attr("width", 5000)
		.attr("height", 10000)
		.append("g")
		.attr("transform", "translate(30,0)");//距离页面
			
		d3.json("OntoVisualization", function(error, root) {
	
		var nodes = tree.nodes(root);
		var links = tree.links(nodes);
		
		
		//创建一个对角线生成器
		var diagonal = d3.svg.diagonal()
			.projection(function(d) { return [d.y, d.x]; });
			
		//绘制连接线使用的方法
		var link = svg.selectAll(".link")
		  .data(links)
		  .enter()
		  .append("path")
		  .attr("class", "link")
		  .attr("d", diagonal);
		
		var node = svg.selectAll(".node")
		  .data(nodes)
		  .enter()
		  .append("g")
		  .attr("class", "node")
		  .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });
		
		node.append("circle")
		  	.attr("r", 6);//设置各个节点的半径
		
		node.append("text")
		  .attr("dx", function(d) { return d.children ? -8 : 8; })
		  .attr("dy", 3)
		  .style("text-anchor", function(d) { return d.children ? "end" : "start"; })
		  .text(function(d) { return d.name; });
		node.on("click",function(d){
			d3.select("#classname").text(d.name);
			document.getElementById("currentSelectedNode").innerHTML=d.name;
			$('#ontoMenuModal').modal({
				  keyboard: true
			})
			

		});
		});
}
	

function deleteOntoNode() {
	var currentNodeName=document.getElementById('currentSelectedNode').innerHTML;
	document.getElementById('confirmDeleteClass').innerHTML=currentNodeName;
	$('#ontoMenuModal').modal('toggle');
	$('#deleteOntoNodeModal').modal({
		 keyboard: true
	 })
	
	return false;
}
function addOntoNode() {
	var currentNodeName=document.getElementById('currentSelectedNode');
	$('#ontoMenuModal').modal('toggle');
	$('#addOntoNodeModal').modal({
				  keyboard: true
	 })
	return false;
}
function renameOntoNode() {
	var currentNodeName=document.getElementById('currentSelectedNode');
	$('#ontoMenuModal').modal('toggle');
	$('#renameOntoNodeModal').modal({
				  keyboard: true
	 })
	return false;
	
}
function deleteClass() {
		$.ajax({
		type: 'POST',
        url:'ontoManager.action', 
        data:{operationType:'renameClass',className:document.getElementById("currentSelectedNode").innerHTML},
        dataType:'json',
        success: function(msg){
        	if(msg.success==true)
        	{
        		alert('删除类成功！');
        		window.location.reload();
        	}
        	else
        	{
        		alert('操作失败请重试！');
        	}
        	
        	}     
		});
		return false;
}
function saveSubclass(){
	var subclassName = document.getElementById("subClassName").value;
	if(subclassName==null){
		return false;
	}
	$.ajax({
		type: 'POST',
        url:'ontoManager.action', 
        data:{operationType:'addSubClass',className:document.getElementById("currentSelectedNode").innerHTML,value:document.getElementById("subClassName").value},
        dataType:'json',
        success: function(msg){
        	if(msg.success==true)
        	{
        		alert('添加子类成功！');
        		window.location.reload(); 
        	}
        	else
        	{
        		alert('操作失败请重试！');
        	}
        	
        }     
	});
}
		