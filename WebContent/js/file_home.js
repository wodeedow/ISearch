UUIDStack=Array();//记录目录
UUIDStack.push('home');
Ext.require([
    'Ext.grid.*',
    'Ext.data.*',
    'Ext.util.*',
    'Ext.state.*' 
]);
String.prototype.Trim   =   function()      
{      
    return this.replace(/(^\s*)|(\s*$)/g, "");
}    
// Define Company entity
// Null out built in convert functions for performance *because the raw data is known to be valid*
// Specifying defaultValue as undefined will also save code. *As long as there will always be values in the data, or the app tolerates undefined field values*
Ext.define('File', {//定义对象
    extend: 'Ext.data.Model',
    fields: [
        { name: 'isDirectory', type: 'Boolean', mapping: 'isDirectory' },//是否以一个目录
        { name: 'Name', type: 'string', mapping: 'fileName' },//，目录名称
        { name: 'lastModified', type: 'string', mapping: 'lastModified' },//最后一次时间
        { name: 'fileUUID', type: 'string', mapping: 'uuid' },//唯一标识符
        { name: 'fileSize', type: 'string', mapping: 'fileSize' },//文件大学
		{ name: 'isPublic', type: 'Boolean', mapping: 'isPublic' }//是否共享
    ]  
});
Ext.onReady(function () {
    Ext.QuickTips.init();
    USER_NAME = document.getElementById("USER_NAME").value.Trim();  
    // setup the state provider, all state information will be saved to a cookie
    Ext.state.Manager.setProvider(Ext.create('Ext.state.CookieProvider'));
     fileStore = Ext.create('Ext.data.Store', {//获取数据
        model: 'File',
        proxy: {
            type: 'ajax',
            url: 'ListDirectoryFiles?fileUUID=home',
            reader: {
                type: 'xml',
                record: 'File',
                root: USER_NAME
            },
            autoLoad: true,
            filterOnload: true,
        }
    });
    fileStore.load();//加载数据
    function directoryNameFormat(value,rowindex,record)  
    {
    	if(record.get('isDirectory')==true)
    		{
    			return '<img src="ext/icons/directory.png" width="50" height="50">'+value+'</img>';
    		}
    	else
    		{ 
			if(record.get('Name').indexOf('ppt')>0)
				{return '<img src="ext/icons/ppt_small.png"  width="50" height="50">'+value+'</img>';}
			if(record.get('Name').indexOf('pdf')>0)
                 {return '<img src="ext/icons/pdf_small.png"  width="50" height="50">'+value+'</img>';}
			if(record.get('Name').indexOf('xls')>0)
                 {return '<img src="ext/icons/xls_small.png"  width="50" height="50">'+value+'</img>';}
			if(record.get('Name').indexOf('txt')>0)
                 {return '<img src="ext/icons/txt_small.png"  width="50" height="50">'+value+'</img>';}
            if(record.get('Name').indexOf('doc')>0)
    		     {return '<img src="ext/icons/file.png"  width="50" height="50">'+value+'</img>';}
            if(record.get('Name').indexOf('avi')>0||record.get('Name').indexOf('mp4')>0||record.get('Name').indexOf('wmv')>0||record.get('Name').indexOf('rmvb')>0)
                {return '<img src="ext/icons/vedio_small.png"  width="50" height="50">'+value+'</img>';}
            if(record.get('Name').indexOf('mp3')>0||record.get('Name').indexOf('aac')>0||record.get('Name').indexOf('flac')>0||record.get('Name').indexOf('wav')>0)
                {return '<img src="ext/icons/audio_small.png"  width="50" height="50">'+value+'</img>';}
             return '<img src="ext/icons/picture_small.png"  width="50" height="50">'+value+'</img>';     
    		}   	
    }
    function  fileSizeFormat(value,rowindex,record)
    {
    	if(record.get('fileSize')==0)
		{
			return '小于1KB';
		}
	else if(record.get('fileSize')=='-')
		{
			return value;
		}   
	else
		{
			return value+'KB';
		}
    }
	function   isPublicFormat(value,rowindex,record)
    {
		if(record.get('isDirectory')==false)
		{
			if(record.get('isPublic')==true||record.get('isPublic')=='true') 
			{
				return '已经共享';
			}
			else
			{
				return '未共享';
			}
		}
		else
		{
			return ' ';
		}
    	
    }
    var selModel = Ext.create('Ext.selection.CheckboxModel');//创建多选
    // create the Grid
    var grid = Ext.create('Ext.grid.Panel', {
        store: fileStore,
        selModel:selModel,
        stateful: true,
        collapsible: true,
        multiSelect: true,
        stateId: 'stateGrid',
        height: 638,				//////////////////////////////////////////////
        //width: 600,
        title: '个人文件',
        renderTo: 'fileGrid',
        selType:'cellModel',
        viewConfig: {
            stripeRows: true,
            enableTextSelection: true
        },
        tbar:[//面板上面的按钮
              {
            	  text:'返回根目录',
            	  icon: 'ext/icons/download_big.png',
            	  handler:function()
            	  {
            	      fileStore.getProxy().url = 'ListDirectoryFiles?fileUUID=home';
            	      fileStore.clearFilter(true);
           			  fileStore.load();
            	  }
              },
              {
            	  text:'返回上级目录',
            	  icon: 'ext/icons/download_big.png',
            	  handler:function()
            	  {
            		 console.log(UUIDStack.pop()+'出栈');
            		 var fatherDirectoryUUID= UUIDStack.pop();
            		 UUIDStack.push(fatherDirectoryUUID);
            		 console.log(fatherDirectoryUUID+'出栈');
            		 console.log(fatherDirectoryUUID+'入栈');
            		 if(fatherDirectoryUUID!=undefined)
            		 {
            		 	fileStore.getProxy().url ='ListDirectoryFiles?fileUUID='+fatherDirectoryUUID;
            		 	fileStore.load();
           			 }
            	  }
              },
              {
            	  text:'创建文件夹',
            	  icon: 'ext/icons/download_big.png',
            	  handler:function()
            	  {
					$('#renameModal').modal({
						keyboard: true
						})
            		 // var newFile=[{isDirectory:true,Name:'.net',lastModefied:'2015-3-15',uuid:'temp'}];
            		 // fileStore.insert(0,newFile);
            	  }
              },
              {
            	  text:'删除文件夹',
            	  icon: 'ext/icons/download_big.png',
            	  handler:function()
            	  {            	  
            	      var records=grid.getSelectionModel().getSelection();
            	      Ext.each(records,function(record){
            	          Ext.Ajax.request({
            	              method: 'POST',
            	              url: 'FileManage.action',//先通过ajax从后台删除数据，删除成功后再从页面删除数据
            	              params: { fileUUID: record.get('fileUUID').Trim(), isDirectory: record.get('isDirectory'), operationType: 'delete' },//参数       
            	              success: function (response, options) {
            	                  Ext.MessageBox.alert('成功', '从服务端获取结果: ' + response.responseText);
            	              },
            	              failure: function (response, options) {
            	                  Ext.MessageBox.alert('失败', '请求超时或网络故障,错误编号：' + response.status);
            	              }
            	          });
            	      fileStore.remove(record);})
            	  }
              },
             {                
                 text:'上传文件',
                 icon: "ext/icons/upload_file.png",
                 tooltip: "upload",
                 scope: this,
                 handler: function ()
				 {
					 $('#fileUploadModal').modal({
						keyboard: true
					})
				 }
			 },
				 {                
                 text:'刷新',
                 tooltip: "刷新文件列表",
                 scope: this,
                 handler: function ()
				 {
					refreshAll();
				 }
			 }
        ],
        columns: [//grid表格的列
             {
                 text: '文件名',
                 xtype: 'actioncolumn',
                 dataIndex: 'Name',
                 tooltip:'打开',
                 flex: 1,
                 width: 200,
                 renderer:directoryNameFormat 
             },
            {
                text: '文件大小',
                width: 100,
                sortable: true,
                renderer: fileSizeFormat,
                dataIndex: 'fileSize'
             },
           {
               text: '修改时间',
               width: 100,
               sortable: true,
               renderer: Ext.util.Format.dateRenderer('m/d/Y'),
               dataIndex: 'lastModified'
           },
			{
               text: '是否共享',
               width: 100,
               sortable: true,
               renderer: isPublicFormat,
               dataIndex: 'isPublic'
           },
            {
                text:'操作',
                menuDisabled: true,
                sortable: false,
                xtype: 'actioncolumn',
                width: 100,
                items: [{
                	width:100,
                    icon: 'ext/icons/download_small.png',  // Use a URL in the icon config
                    tooltip: '下载',
                    handler: function (grid, rowIndex, colIndex) {
                    		var rec = fileStore.getAt(rowIndex);
                    		var uuidString=rec.get('fileUUID').Trim();
                            var rec = fileStore.getAt(rowIndex);
                            var isDirectory=rec.get('isDirectory');
                            if(isDirectory==true)  
                            {
                                alert('暂时不支持下载文件夹')
                            }
                            else
                            {
                                 window.location.href="download.action?UUID="+uuidString; 
                            }
                    }
                },
                {
                	width:100,
                    icon: 'ext/icons/delete_small.png',  // Use a URL in the icon config
                    tooltip: '删除文件或文件夹',
                    handler: function (grid, rowIndex, colIndex) {
                        var rec = fileStore.getAt(rowIndex);
							$.ajax({
							type: "POST",
							url: "FileManage.action",
							data: { operationType:'delete',fileUUID:rec.get('fileUUID'),isDirectory:rec.get('isDirectory')},
							dataType:'json', 
							success: function(msg){
							alert('删除成功！');
							window.location.href="disk.jsp";
						}
					});
                    }
                },
                {
                	width:100,
                    icon: 'ext/icons/share_small.png',  // Use a URL in the icon config
                    tooltip: '分享文件或文件夹',
                    handler: function (grid, rowIndex, colIndex) {
                        document.getElementById('prepareShareFileUUID').value = fileStore.getAt(rowIndex).get('fileUUID');
                       $('#myModal').modal({
						keyboard: true
						})
                    }
                },
                ] 
            }
        ]
    })
        grid.on("itemclick", function (grid, rowIndex, colIndex, record, event) 
    		{
           // var rows = grid.getSelectionModel().getSelection();
            //var uuidString = rows[0].get('fileUUID');
            //var isDirectoryString = rows[0].get('isDirectory');
           var uuidString=  rowIndex.data.fileUUID;
           var isDirectory= rowIndex.data.isDirectory;
            if (isDirectory == true) {
            	UUIDStack.push(uuidString);//进入下级目录前先目录UUID入栈，便于实现返回上级目录
            	console.log(uuidString+'入栈');
            	fileStore.getProxy().url ='ListDirectoryFiles?fileUUID='+uuidString;  
    			fileStore.load({params:{start:0, limit:100}});
            }
    	})
});
function refreshAll()
{
	 fileStore.removeAll(true);
	fileStore.load();
}
function submitValue()
{
	USER_ID = document.getElementById("SPAN_USER_ID").innerText.Trim();
	var temp=document.getElementById('searchForm');
	var opt=document.createElement("input"); 
	opt.name="USER_ID"; 
	opt.id="USER_ID"; 
	temp.style.visibility="hidden"; 
	opt.value=USER_ID; 
	temp.appendChild(opt);  
	document.getElementById('USER_ID').value=USER_ID; 
	temp.submit();
	return false;
}
function shareFile()
{
	$.ajax({
	type: "POST",
	url: "FileManage.action",
	data: { fileUUID:document.getElementById('prepareShareFileUUID').value,operationType:'shareFile'},
	dataType:'json',
	success: function(msg){
		if(msg.cause=="primaykeyRepeat")
			{
				alert('您已经分享了这个文件，不能在分享了！')
			}
			$('#myModal').modal('toggle');
			refreshAll();			
   }
});
}
function wordFunction()
{
	fileStore.clearFilter(true);
    fileStore.filter([
    { filterFn: function (item) {return item.get("Name").lastIndexOf(".doc") > 0; } }
    ]);
    fileStore.load();
}
function excelFunction() {
	fileStore.clearFilter(true);
    fileStore.filter([
    { filterFn: function (item) { return item.get("Name").lastIndexOf(".xls") > 0; } }
    ]);
    fileStore.load();
}
function pdfFunction() {
	fileStore.clearFilter(true);
    fileStore.filter([
    { filterFn: function (item) { return item.get("Name").lastIndexOf(".pdf") > 0; } }
    ]);
    fileStore.load();
}
function pptFunction() {
	fileStore.clearFilter(true);
    fileStore.filter([
    { filterFn: function (item) { return item.get("Name").lastIndexOf(".ppt") > 0; } }
    ]);
    fileStore.load();
}
function textFunction() {
	fileStore.clearFilter(true);
    fileStore.filter([
    {
        filterFn: function (item) {  return item.get("Name").lastIndexOf(".txt") > 0; }
    }
    ]);
    fileStore.load();
}
function audioFunction() {
	fileStore.clearFilter(true);
    fileStore.filter([
    {
        filterFn: function (item) { 
		var target=item.get("Name")
		if(target.lastIndexOf(".mp3") > 0||target.lastIndexOf(".aac") > 0||target.lastIndexOf(".flac") > 0||target.lastIndexOf(".midi") > 0||target.lastIndexOf(".gif") > 0)
			return true;
		else
			return false;
		}
    }
    ]);
    fileStore.load();
}
function vedioFunction() {
	fileStore.clearFilter(true);
    fileStore.filter([
    {
        filterFn: function (item) { 
		var target=item.get("Name")
		if(target.lastIndexOf(".avi") > 0||target.lastIndexOf(".wmv") > 0||target.lastIndexOf(".rmvb") > 0||target.lastIndexOf(".mkv") > 0||target.lastIndexOf(".mp4") > 0)
			return true;
		else
			return false;
		}
    }
    ]);
    fileStore.load();
}
function pictureFunction() {
	fileStore.clearFilter(true);
    fileStore.filter([
    {
        filterFn: function (item) { 
		var target=item.get("Name")
		if(target.lastIndexOf(".png") > 0||target.lastIndexOf(".jpg") > 0||target.lastIndexOf(".bmp") > 0||target.lastIndexOf(".psd") > 0||target.lastIndexOf(".gif") > 0)
			return true;
		else
			return false;
		}
    }
    ]);
    fileStore.load();
}
function allFunction() {
    fileStore.clearFilter(true);
    fileStore.load(); 
}

function renameFormCheck()
{
	document.getElementById('create_USER_ID').value=document.getElementById("SPAN_USER_ID").innerText.Trim();
	document.getElementById('fatherDirectoryUUID').value=UUIDStack[UUIDStack.length-1];
	document.getElementById('infoSpanText').style.display='inline';
	var newName=document.getElementById('fileName').value;
	var isUsed=false;
	for(var i=0;i<fileStore.getCount();i++)
	{
		if(fileStore.getAt(i).get('Name')==newName)
		{
			isUsed=true; 
		}
	}
	if(isUsed==false)
	{
		document.getElementById('infoSpanText').innerText="检查成功，正在应用到服务器端。。。";
		$.ajax({
			type: "POST",
			url: "FileManage.action",
			data: {
            fileName:document.getElementById("fileName").value,fatherDirectoryUUID:UUIDStack[UUIDStack.length-1],
			fileUUID:null,
			operationType:'create',
			isDirectory:'true'
            },
			dataType:'json',
			success: function(msg){
			$('#renameModal').modal('toggle');
			},
			failure:function()
			{
				alert('创建文件夹失败，请稍后重试！');
			}
			}
		)
		
	}
	else
	{
		document.getElementById('infoSpanText').innerText="在当前目录下发现相同的文件名名称，请修改！"
	
	}
	return false;
}

