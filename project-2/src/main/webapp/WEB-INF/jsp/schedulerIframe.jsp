<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- ztree -->
<!-- <link type="text/css" rel="stylesheet" href="resources/zTree/css/demo.css" /> -->
<link type="text/css" rel="stylesheet" href="resources/zTree/css/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript" src="resources/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="resources/zTree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="resources/zTree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="resources/zTree/js/jquery.ztree.exedit.js"></script>

<style type="text/css">
body {
	margin:0 auto;
}
</style>

<script type="text/javascript">
$(function(){
	var zNodes =[];
	var setting = {
		edit: {
			enable: true,
			//showRemoveBtn: false,
			//showRenameBtn: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeDrag: beforeDrag,
			beforeDrop: beforeDrop,
			onClick: onClick
		}
	};

	function beforeDrag(treeId, treeNodes) {
		for (var i=0,l=treeNodes.length; i<l; i++) {
			if (treeNodes[i].drag === false) {
				return false;
			}
		}
		return true;
	}

	function beforeDrop(treeId, treeNodes, targetNode, moveType) {
		return targetNode ? targetNode.drop !== false : true;
	}

	function onClick(event, treeId, treeNode, clickFlag) {
		//console.log(event);
		//console.log(treeId);
		//console.log(treeNode);
		//single은 1, multi는 2
		//console.log(clickFlag);
		//console.log(window.top); 
		window.top.callbackOuter(treeNode.pId, treeNode.parentName, treeNode.name);
	}
	
	$.ajax({
		url : "schedulerIframeAjax",
		type : "post",
        dataType : "json",
		success : function(data){
			//console.log(data);
			var projectAndTeam = data;
			
			var countProjects = 1;
			for(var j = 1; j < projectAndTeam.length; j++){
				if(projectAndTeam[j]["title"] != projectAndTeam[j-1]["title"])
					countProjects++;
			}
			
			zNodes.push({ id:1, pId:0, name:"전체", isParent:true, open:true});
			var i = 2;
			for(idx in projectAndTeam){
				if(idx == 0){
					zNodes.push({ id:i, pId:1, name:projectAndTeam[idx]["title"], isParent:true, open:true});
				}else{
					if(projectAndTeam[idx]["title"] != projectAndTeam[idx-1]["title"]){
						i++;
						zNodes.push({ id:i, pId:1, name:projectAndTeam[idx]["title"], isParent:true, open:true});
					}
				}
				if(typeof projectAndTeam[idx]["team"] != "undefined"){
					zNodes.push({ id:countProjects, pId:i, parentName:projectAndTeam[idx]["title"], name:projectAndTeam[idx]["team"], open:true});
					countProjects++
				}
			}
			//console.log(zNodes);
			
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.setting.edit.drag.isCopy = true;
			zTree.setting.edit.drag.isMove = true;
			zTree.setting.edit.drag.prev = true;
			zTree.setting.edit.drag.inner = true;
			zTree.setting.edit.drag.next = true;
		},
		error : function(e){
			console.log("에러");
		}
	});
});
</script>

</head>
<body>
<div class="zTreeDemoBackground left">
	<ul id="treeDemo" class="ztree"></ul>
</div>
</body>
</html>