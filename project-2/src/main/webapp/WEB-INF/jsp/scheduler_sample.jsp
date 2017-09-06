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
body {
	margin-top: 40px;
	text-align: center;
	font-size: 14px;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
}
	
#wrap {
	width: 1100px;
	margin: 0 auto;
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
	float: right;
	width: 900px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	/* initialize the external events
	-----------------------------------------------------------------*/
	$("#external-events .fc-event").each(function() {
		// store data so the calendar knows to render an event upon drop
		$(this).data("event", {
			title: $.trim($(this).text()), // use the element"s text as the event title
			stick: true // maintain when user navigates (see docs on the renderEvent method)
		});

		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});
	});


	/* initialize the calendar
	-----------------------------------------------------------------*/
	$("#calendar").fullCalendar({
		header: {
			left: "prev,next today",
			center: "title",
			right: "month,listMonth,basicWeek,agendaWeek,listWeek,basicDay,agendaDay,listDay"
		},
		theme: true,
		locale: "en",	// "ko" 또는 "en"(삭제해도 en)
		//defaultDate: "2017-05-12",
		buttonIcons: true, // show the prev/next text
		navLinks: true, // can click day/week names to navigate views
		businessHours: true, // display business hours
		weekNumbers: true,
		editable: true,
		selectable: true,
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
		},
		droppable: true, // this allows things to be dropped onto the calendar
		drop: function() {
			// is the "remove after drop" checkbox checked?
			if ($("#drop-remove").is(":checked")) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			}
		},
		eventLimit: true, // allow "more" link when too many events
		events: [
			{
				title: "Business Lunch",
				start: "2017-09-03T13:00:00",
				constraint: "businessHours"
			},
			{
				id: 999,
				title: "Repeating Event",
				start: "2017-09-09T16:00:00"
			},
			{
				id: 999,
				title: "Repeating Event",
				start: "2017-09-16T16:00:00"
			},
			{
				title: "Conference",
				start: "2017-09-18",
				end: "2017-09-20"
			},
			{
				title: "test1",
				start: "2017-09-18T13:00:00"
			},
			{
				title: "test2",
				start: "2017-09-18T14:00:00"
			},
			{
				title: "test3",
				start: "2017-09-18T15:00:00"
			},
			{
				title: "test4",
				start: "2017-09-18T16:00:00"
			},
			{
				title: "Party",
				start: "2017-09-29T20:00:00"
			},
			{
				title: "Click for Google",
				url: "http://google.com/",
				start: "2017-09-28"
			},
			{
				title: "Meeting",
				start: "2017-09-13T11:00:00",
				constraint: "availableForMeeting", // defined below
				color: "#257e4a"
			},
			// areas where "Meeting" must be dropped
			{
				id: "availableForMeeting",
				start: "2017-09-11T10:00:00",
				end: "2017-09-11T16:00:00",
				rendering: "background"
			},
			{
				id: "availableForMeeting",
				start: "2017-09-13T10:00:00",
				end: "2017-09-13T16:00:00",
				rendering: "background"
			},
			// red areas where no events can be dropped
			{
				start: "2017-09-24",
				end: "2017-09-28",
				overlap: false,	// drag 불가
				rendering: "background",	// 표시를 전체에 함
				color: "#ff9f89"
			},
			{
				start: "2017-09-06",
				end: "2017-09-09",
				overlap: false,
				rendering: "background",
				color: "#ff9f89"
			}
		]
	});
	var dt = new Date("30 July 2010 15:05 UTC").toISOString();
	console.log(dt);	//  2010-07-30T15:05:00.000Z
});
</script>
</head>
<body>
<div id="wrap">
	<div id="external-events">
		<h4>Draggable Events</h4>
		<div class="fc-event">My Event 1</div>
		<div class="fc-event">My Event 2</div>
		<div class="fc-event">My Event 3</div>
		<div class="fc-event">My Event 4</div>
		<div class="fc-event">My Event 5</div>
		<p>
			<input type="checkbox" id="drop-remove" />
			<label for="drop-remove">remove after drop</label>
		</p>
	</div>
	<div id="calendar"></div>
	<div style="clear:both"></div>
</div>
</body>
</html>