<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/fullcalendar/lib/cupertino/jquery-ui.min.css" />
<link rel="stylesheet" href="resources/fullcalendar/fullcalendar.min.css"/>
<link rel="stylesheet" media="print" href="resources/fullcalendar/fullcalendar.print.min.css"/>
<script src="resources/fullcalendar/lib/moment.min.js"></script>
<script src="resources/fullcalendar/lib/jquery.min.js"></script>
<script src="resources/fullcalendar/lib/jquery-ui.min.js"></script>
<script src="resources/fullcalendar/fullcalendar.min.js"></script>
<script src="resources/fullcalendar/locale-all.js"></script>

<style type="text/css">
html, body, .container {
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	/* margin-top: 40px; */
	text-align: center;
	font-size: 14px;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
}
	
#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}
	
#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}
	
#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
}
	
#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}
	
#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	/* float: right; */
	width: 900px;
	display: inline-block;
    vertical-align: top;
}

.fc-time{
	display : none;
}
</style>
<style type="text/css">
html.open {
  overflow: hidden;
}

.close {
  width: 50px;
  height: 50px;
  position: absolute;
  right: 0px;
  top: 0px;
  background-image: url("http://s1.daumcdn.net/cfs.tistory/custom/blog/204/2048858/skin/images/close.png");
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
  cursor: pointer;
}

#menu {
  width: 550px;
  height: 100%;
  position: fixed;
  top: 0px;
  right: -552px;
  z-index: 10;
  border: 1px solid #c9c9c9;
  background-color: white;
  text-align: center;
  transition: All 0.2s ease;
  -webkit-transition: All 0.2s ease;
  -moz-transition: All 0.2s ease;
  -o-transition: All 0.2s ease;
}

#menu.open {
  right: 0px;
}

.page_cover.open {
  display: block;
}

.page_cover {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0px;
  left: 0px;
  background-color: rgba(0, 0, 0, 0.4);
  z-index: 4;
  display: none;
}
</style>

<script type="text/javascript">
$(function(){
	// datepicker
	$( ".datepicker" ).datepicker();
	$( ".datepicker" ).datepicker("option", "dateFormat", "yy-mm-dd");
	
	// slide menu
	window.onhashchange = function() {
	    if (location.hash != "#open") {
	        $("#menu,.page_cover,html").removeClass("open");
	    }
	};
});

$(function(){
	// todo 리스트를 불러와 customEvents를 만듬
	var customEvents = new Array();
	$.ajax({
		url : "todoList",
		type : "post",
        async :false,
		success : function(data) { 
			console.log(data);
			for(idx in data){
				customEvents.push({
					no: data[idx]["no"],
					team: data[idx]["team"],
					title: data[idx]["task"],
					todowriter: data[idx]["todowriter"],
					projecttitle: data[idx]["projecttitle"],
					//start: data[idx]["startdate"],
					//end: data[idx]["enddate"],
					start: moment(data[idx]["startdate"]).format("YYYY-MM-DDT00:00:00"),	// toISOString()
					end: moment(data[idx]["enddate"]).format("YYYY-MM-DDT23:59:59"),
					state: data[idx]["state"],
					filename: data[idx]["filename"],
					writedate: data[idx]["writedate"],
					filewriter: data[idx]["filewriter"]
				});
			}
		},
		error : function(e) { 
			console.log("에러");
		}
	});
	console.log(customEvents);
	
	// project와 team 리스트를 불러와 menu의 select box에 저장
	$.ajax({
		url : "projectAndTeamList",
		type : "post",
        async :false,
		success : function(data) { 
			console.log(data);
			var projectList = data[0];
			var teamList = data[1];
			console.log(projectList);
			console.log(teamList);
			var html1 = "", html2 = "";
			for(idx in projectList){
				html1 += "<option value=\"" + projectList[idx] + "\">" + projectList[idx] + "</option>";
			}
			$("select[name=projecttitle]").html(html1);
			for(idx in teamList){
				html2 += "<option value=\"" + teamList[idx] + "\">" + teamList[idx] + "</option>";
			}
			$("select[name=team]").html(html2);
		},
		error : function(e) { 
			console.log("에러");
		}
	});
	
	// calendar
	$("#calendar").fullCalendar({
		header: {
			left: "prev,next today",
			center: "title",
			right: "month"	// month,listMonth,basicWeek,agendaWeek,listWeek,basicDay,agendaDay,listDay
		},
		timeFormat: 'hh:mm a',
		theme: true,
		locale: "en",	// "ko" 또는 "en"(삭제해도 en)
		buttonIcons: true, // show the prev/next text
		businessHours: true, // display business hours
		eventClick: function(calEvent, jsEvent, view) {
			_id = calEvent["_id"];	// 전역변수로 선언
			console.log(calEvent);
			$("input[name=no]").val(calEvent["no"]);
			$("select[name=team]").val(calEvent["team"]);
			$("input[name=title]").val(calEvent["title"]);
			$("input[name=todowriter]").val(calEvent["todowriter"]);
			$("select[name=projecttitle]").val(calEvent["projecttitle"]);
			$("input[name=startdate]").val(moment(calEvent["start"]["_i"]).format("YYYY-MM-DD"));
			$("input[name=enddate]").val(moment(calEvent["end"]["_i"]).format("YYYY-MM-DD"));
			$("input[name=state]").val(calEvent["state"]);
			$("input[name=filename]").val(calEvent["filename"]);
			$("input[name=writedate]").val(calEvent["writedate"]);
			$("input[name=filewriter]").val(calEvent["filewriter"]);
			
			$("#menu, .page_cover,html").addClass("open");
		    window.location.hash = "#open";
	    },
		/* selectable: true,
		selectHelper: true,
		select: function(start, end) {
			var title = prompt("Event Title:");
			var eventData;
			if (title) {
				eventData = {
					title: title,
					start: start,
					end: end
				};
				$("#calendar").fullCalendar("renderEvent", eventData, true); // stick? = true
			}
			$("#calendar").fullCalendar("unselect");
		}, */
		eventLimit: true, // allow "more" link when too many events
		events: customEvents
	});
	
	// 수정버튼 클릭 이벤트
	$(".modifyBtn").click(function(){
		var events = $('#calendar').fullCalendar('clientEvents');
		
		// 수정한 데이터 불러온후 events 데이터 수정
		for(idx in events){
			if(events[idx]["_id"] == _id){
				events[idx]["no"] = $("input[name=no]").val();
				events[idx]["team"] = $("select[name=team]").val();
				events[idx]["title"] = $("input[name=title]").val();
				events[idx]["todowriter"] = $("input[name=todowriter]").val();
				events[idx]["projecttitle"] = $("select[name=projecttitle]").val();
				events[idx]["start"] = moment($("input[name=startdate]").val()).format("YYYY-MM-DDT00:00:00");
				events[idx]["end"] = moment($("input[name=enddate]").val()).format("YYYY-MM-DDT23:59:59");
				events[idx]["state"] = $("input[name=state]").val();
				events[idx]["filename"] = $("input[name=filename]").val();
				events[idx]["writedate"] = $("input[name=writedate]").val();
				events[idx]["filewriter"] = $("input[name=filewriter]").val();
				
				console.log(events[idx]);
				console.log(customEvents[idx]);
				// db에 저장
				$.ajax({
					url : "saveTodoList",
					data : {
						no : $("input[name=no]").val(),
						team : $("select[name=team]").val(),
						title : $("input[name=title]").val(),
						todowriter : $("input[name=todowriter]").val(),
						projecttitle : $("select[name=projecttitle]").val(),
						start : $("input[name=startdate]").val(),
						end : $("input[name=enddate]").val(),
						state : $("input[name=state]").val(),
						filename : $("input[name=filename]").val(),
						writedate : $("input[name=writedate]").val(),
						filewriter : $("input[name=filewriter]").val()
					},
					type : "post",
			        dataType : "json",
					success : function(data){
						console.log(data);
					},
					error : function(e){
						console.log("에러");
					}
				});
			}
		}
		
		// callendar 다시 렌더링
		$('#calendar').fullCalendar('removeEventSources');
        $('#calendar').fullCalendar('addEventSource', events);
		$('#calendar').fullCalendar('refetchEvents');
		
		// menu창 닫기
		history.back();
	});
});

// tree 클릭시(ztree에서 호출하는 함수)
function callbackOuter(pId, parentName, name){
	// project 이름 클릭시 : 0, team 이름 클릭시 : 0 이외의 숫자
	if(pId == null)
		pId = 0;
	if(typeof parentName == "undefined")
		parentName = "";
	
	$.ajax({
		url : "todoListByName?pId="+pId+"&parentName="+parentName+"&name="+name,
		type : "post",
        dataType : "json",
		success : function(data){
			events = [];
			for(idx in data){
				events.push({
					no: data[idx]["no"],
					team: data[idx]["team"],
					title: data[idx]["task"],
					todowriter: data[idx]["todowriter"],
					projecttitle: data[idx]["projecttitle"],
					start: moment(data[idx]["startdate"]).format("YYYY-MM-DDT00:00:00"),	// toISOString()
					end: moment(data[idx]["enddate"]).format("YYYY-MM-DDT23:59:59"),
					state: data[idx]["state"],
					filename: data[idx]["filename"],
					writedate: data[idx]["writedate"],
					filewriter: data[idx]["filewriter"]
				});
			}
			console.log(events);
			
			// callendar 다시 렌더링
			$('#calendar').fullCalendar('removeEventSources');
	        $('#calendar').fullCalendar('addEventSource', events);
			$('#calendar').fullCalendar('refetchEvents');
		},
		error : function(e){
			console.log("에러");
		}
	});
}
</script>
</head>
<body>
<div class="container">
	<iframe src="schedulerIframe" style="border:0;height:97%;"></iframe>
	<div id="calendar"></div>
	<div onclick="history.back();" class="page_cover"></div>
	<div id="menu">
		<div onclick="history.back();" class="close"></div>
		
		<input type="hidden" name="no">
		<div style="margin-top: 10%;">project : <select name="projecttitle"></select>
		</div>
		<div style="margin-top: 3%;">team : <select name="team"></select>
		</div>
		<div style="margin-top: 3%;">task : <input type="text" name="title"></div>
		<div style="margin-top: 3%;">startdate : <input type="text" name="startdate" class="datepicker"></div>
		<div style="margin-top: 3%;">enddate : <input type="text" name="enddate" class="datepicker"></div>
		<div style="margin-top: 3%;">state : <input type="text" name="state"></div>
		<div style="margin-top: 3%;">todowriter : <input type="text" name="todowriter" disabled></div>
		<div style="margin-top: 3%;">filename : <input type="text" name="filename" disabled></div>
		<div style="margin-top: 3%;">writedate : <input type="text" name="writedate" disabled></div>
		<div style="margin-top: 3%;">filewriter : <input type="text" name="filewriter" disabled></div>
		
		<div style="position: absolute;bottom: 10%;right: 50%;">
			<input type="button" class="modifyBtn" value="수정">
			<input type="button" onclick="history.back();" value="취소">
		</div>
	</div>
</div>
</body>
</html>