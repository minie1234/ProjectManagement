<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<title>Project Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
	  	todoListCompleated = Number("${fn:length(todoListCompleted)}");
    	todoListNotCompleted = Number("${fn:length(todoListNotCompleted)}");
    	todoListExpired = Number("${fn:length(todoListExpired)}");
        var data = google.visualization.arrayToDataTable([
          ['Task', 'count'],
          ['완료됨', todoListCompleated],
          ['마감일 지남', todoListNotCompleted],
          ['계획됨', todoListExpired],
        ]);

        var options = {
          pieHole: 0.8,
          colors:['rgb(39, 182, 186)', 'rgb(233, 94, 81)', 'rgb(255, 176, 36)'],
          label: 'none',
          legend: 'none',
          pieSliceText: 'none',
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
</script>

<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif
}

.w3-theme-l5 {
	color: #000 !important;
	background-color: #f0f0f0 !important
}

.w3-theme-l4 {
	color: #000 !important;
	background-color: #cccccc !important
}

.w3-theme-l3 {
	color: #fff !important;
	background-color: #999999 !important
}

.w3-theme-l2 {
	color: #fff !important;
	background-color: #666666 !important
}

.w3-theme-l1 {
	color: #fff !important;
	background-color: #333333 !important
}

.w3-theme-d1 {
	color: #fff !important;
	background-color: #000000 !important
}

.w3-theme-d2 {
	color: #fff !important;
	background-color: #000000 !important
}

.w3-theme-d3 {
	color: #fff !important;
	background-color: #000000 !important
}

.w3-theme-d4 {
	color: #fff !important;
	background-color: #000000 !important
}

.w3-theme-d5 {
	color: #fff !important;
	background-color: #000000 !important
}

.w3-theme-light {
	color: #000 !important;
	background-color: #f0f0f0 !important
}

.w3-theme-dark {
	color: #fff !important;
	background-color: #000000 !important
}

.w3-theme-action {
	color: #fff !important;
	background-color: #000000 !important
}

.w3-theme {
	color: #fff !important;
	background-color: #000000 !important
}

.w3-text-theme {
	color: #000000 !important
}

.w3-border-theme {
	border-color: #000000 !important
}

.w3-hover-theme:hover {
	color: #000 !important;
	background-color: #ffc107 !important
}

.w3-hover-text-theme:hover {
	color: #000000 !important
}

.w3-hover-border-theme:hover {
	border-color: #000000 !important
}
</style>
<body style="background-color: #e6e8ec">

	<!-- Navbar -->
	<section class="w3-top">
		<div class="w3-bar w3-theme w3-top w3-left-align w3-large">
			<a
				class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1"
				href="javascript:void(0)" onclick="w3_open()"><i
				class="fa fa-bars"></i></a> <a href="#"
				class="w3-bar-item w3-button w3-theme-l1">Logo</a> <a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">새업무</a> <a
				href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">새프로젝트</a>
			<a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">멤버초대</a>
		</div>
	</section>

	<!-- Sidebar -->
	<section
		class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left"
		style="z-index: 3; width: 180px; margin-top: 43px;" id="mySidebar">
		<a href="javascript:void(0)" onclick="w3_close()"
			class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large"
			title="Close Menu"> <i class="fa fa-remove"></i>
		</a>
		<h4 class="w3-bar-item">
			<b>Menu</b>
		</h4>
		<a class="w3-bar-item w3-button w3-hover-black" href="analysis">프로젝트</a>
		<a class="w3-bar-item w3-button w3-hover-black" href="#">멤버</a>
	</section>

	<section style="margin-left:220px; margin-right: 20px; width:80%; height: 100%;">
		<section style="width:100%; height: 80px;"></section>
		
		<!-- 프로젝트 개요 -->
		<section style="width:100%; height: 200px; background-color: #ffffff">
			<section style="padding: 20px; width: 100%; height: 100%">
				<section style="padding-top:30px; width:100%; height: 45%; display: flex;">
					<div><strong>프로젝트 개요</strong></div>
					<div style="width:120px;"></div>
					<div><i class="fa fa-circle-o" style="color: rgb(39, 182, 186); margin-right: 5px"></i>
					완료됨 ${fn:length(todoListCompleted)/todoListTotalSize * 100}% (${fn:length(todoListCompleted)}개 업무)</div>
					<div style="width:80px;"></div>
					<div><i class="fa fa-circle-o" style="color: rgb(233, 94, 81); margin-right: 5px"></i>
					마감일 지남  ${fn:length(todoListNotCompleted)/todoListTotalSize * 100}% (${fn:length(todoListNotCompleted)}개 업무)</div>
					<div style="width:80px;"></div>
					<div><i class="fa fa-circle-o" style="color: rgb(255, 176, 36); margin-right: 5px"></i>
					계획됨  ${fn:length(todoListExpired)/todoListTotalSize * 100}% (${fn:length(todoListExpired)}개 업무)</div>
				</section>
				<section style="width:100%; height: 10%"></section>
				<section style="width:100%; height: 45%">
					<div class="w3-cell-row">
						<c:choose>
							<c:when test="${todoListTotalSize == 0}">
								<div class="w3-container w3-cell" style="width:100%; background-color: #d4d6db"><p style="height:100%;"></p></div>
							</c:when>
							<c:otherwise>
								<c:if test="${fn:length(todoListCompleted) != 0}">
									<div class="w3-container w3-cell" style="width:${fn:length(todoListCompleted)/todoListTotalSize * 100}%; background-color: rgb(39, 182, 186)"><p style="height:100%;"></p></div>
								</c:if>
								<c:if test="${fn:length(todoListNotCompleted) != 0}">
									<div class="w3-container w3-cell" style="width:${fn:length(todoListNotCompleted)/todoListTotalSize * 100}%; background-color: rgb(233, 94, 81)"><p style="height:100%;"></p></div>
								</c:if>
								<c:if test="${fn:length(todoListExpired) != 0}">
									<div class="w3-container w3-cell" style="width:${fn:length(todoListExpired)/todoListTotalSize * 100}%; background-color: rgb(255, 176, 36)"><p style="height:100%;"></p></div>
								</c:if>							
							</c:otherwise>
						</c:choose>
					</div>
				</section>
			</section>
		</section>
		
		<section style="width:100%; height: 15px;"></section>
		
		<!-- 파이차트 자리 -->
		<section style="width:100%; height: 250px;">
			<section style="width:100%; height: 100%; background-color: #ffffff">
				<section style="width: 100%; height: 100%; display: flex;">
					<div style="padding: 20px;">
						<strong>나에게 배정된 업무</strong>
					</div>
					<div>
    					<div id="donutchart" style="width: 500px; height: 250px;"></div>
					</div>
					<div>
						<div style="height: 75px"></div>
    					<div><i class="fa fa-circle-o" style="color: rgb(39, 182, 186); margin-right: 5px"></i>
						완료됨  ${fn:length(todoListCompleted)/todoListTotalSize * 100}% (${fn:length(todoListCompleted)}개 업무)</div>
						<div style="height: 15px"></div>
						<div><i class="fa fa-circle-o" style="color: rgb(233, 94, 81); margin-right: 5px"></i>
						마감일 지남  ${fn:length(todoListNotCompleted)/todoListTotalSize * 100}% (${fn:length(todoListNotCompleted)}개 업무)</div>
						<div style="height: 15px"></div>
						<div><i class="fa fa-circle-o" style="color: rgb(255, 176, 36); margin-right: 5px"></i>
						계획됨  ${fn:length(todoListExpired)/todoListTotalSize * 100}% (${fn:length(todoListExpired)}개 업무)</div>
    				</div>
				</section>
			</section>
		</section>
		<section style="width:100%; height: 50px;"></section>
		
	</section>
	


</body>
</html>