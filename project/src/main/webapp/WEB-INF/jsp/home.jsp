<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<title>Project Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<body>

	<!-- Navbar -->
	<div class="w3-top">
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
	</div>

	<!-- Sidebar -->
	<nav
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
	</nav>



</body>
</html>