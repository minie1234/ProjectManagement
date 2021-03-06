<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<title>게시글 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"></script>

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

	
				
<h3>파일 목록</h3>
    
    <button class="w3-bar-item w3-button w3-theme-l1" style="float : right;" onclick="location.href='/project-2/file/post'">작성</button>
    <table class="table" cellspacing="30px" bgcolor = "#ffffff" width="100%">
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성날짜</th>
            <th>첨부파일</th>
        </tr>
        
        <c:forEach var="file" items="${list}">
        <tr>
            <td>${file.fileNo}</td>
            <td><a href="/project-2/file/${file.fileNo}">${file.fileName}</a></td>
            <td>${file.fileWriter}</td>
            <td><fmt:formatDate value="${file.fileDate}" pattern="MM/ dd" /></td>
			<td><form method="POST" enctype="multipart/form-data"><a href="/project-2/file/down.do?report=${file.report}">${file.report}</a></form></td>
			
        
        <%-- path=${ff}&report=${file.report} --%>
        
        </tr>
        </c:forEach>
    </table>
    
    
    </section>
</body>
</html>