<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<title>게시글 수정</title>
</head>
<body>
    <h3>게시글 수정</h3>
    <div style="padding : 30px;">
        <form:form commandName="ProjectVO" action="/project-2/file/post/${file.fileNo}" method="PATCH">
          <div class="form-group">
            <label>제목</label>
            <input type="text" name="fileName" value="${file.fileName}" class="form-control">
          </div>
          <div class="form-group">
            <label>작성자</label>
            <input type="text" name="fileWriter" value="${file.fileWriter}" class="form-control">
          </div>
          <button type="submit" class="btn btn-default">수정</button>
        </form:form>
    </div>
</body>
</html>