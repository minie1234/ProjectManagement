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
<title>게시글 작성</title>
</head>
<body>
    <h3>파일 작성</h3>
    <div style="padding : 30px;">
        <form method="POST" action="/project-2/file/post" enctype="multipart/form-data">
         <div class="form-group">
            <label>제목</label>
            <input type="text" name="fileName" class="form-control">
          </div>
          <div class="form-group">
            <label>작성자</label>
            <input type="text" name="fileWriter" class="form-control">
          </div>
          <div class="form-group">
          <label>파일 첨부</label>
         	 	파일 : <input type="file" name="uploadFile" class="form-control">
        	 <br/><br/>
          </div>
          <button type="submit" class="btn btn-default">작성</button>
        </form>
    </div>
</body>
</html>