
function deleteBath(basePath,column1,column2,column3,currentPage){
    $("#mainForm").attr("action",basePath+"deleteBath");
    $("#column1").val(column1);
    $("#column2").val(column2);
    $("#column3").val(column3);
    $("#currentPage").val(currentPage);
    $("#mainForm").submit();
}


function deleteOne(basePath,id,column1,column2,column3,currentPage){
     $("#mainForm").attr("action",basePath+"deleteOne");
     $("#column1").val(column1);
     $("#column2").val(column2);
     $("#column3").val(column3);
     $("#id").val(id);
     $("#currentPage").val(currentPage);
    $("#mainForm").submit();
}

function update(basePath,id,column1,column2,column3,currentPage) {
	 $("#mainForm").attr("action",basePath+"queryBeforeUpdateOrInsert");
	 $("#column1").val(column1);
     $("#column2").val(column2);
     $("#column3").val(column3);
     $("#id").val(id);
     $("#currentPage").val(currentPage);
    $("#mainForm").submit();
   
}

function findPage(basePath,column1,column2,column3,currentPage){
	$("#column1").val(column1);
    $("#column2").val(column2);
    $("#column3").val(column3);
    $("#currentPage").val(currentPage);
   $("#mainForm").submit();
}

function checkAll() {  
	var all=document.getElementById('all');//获取到点击全选的那个复选框的id  
	var one=document.getElementsByName('checkId');//获取到复选框的名称  
	//因为获得的是数组，所以要循环 为每一个checked赋值  
	for(var i=0;i<one.length;i++){  
		one[i].checked=all.checked; //直接赋值不就行了嘛  
	}  
} 
function goPage(basePath,column1,column2,column3,pages){
	$("#column1").val(column1);
    $("#column2").val(column2);
    $("#column3").val(column3);
    var currentPage = $("#pageGo").val();
    if(currentPage>pages || typeof(currentPage) == "string"){
    	currentPage = pages;
    }
    $("#currentPage").val(currentPage);
   $("#mainForm").submit();
}



