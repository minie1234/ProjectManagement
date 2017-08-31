<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>게시글 목록</title>
</head>
<body>
    <h3>파일 목록</h3>
    <button class="btn btn-primary" style="float : right;" onclick="location.href='/project-2/file/post'">작성</button>
    <table class="table">
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
			<td>${file.report}</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>