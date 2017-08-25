<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function setChildText() {
	document.getElementById("task_content").value = opener.document.getElementById("");
	
}


</script>
<body>
	<center>
		<table>
			<tr>
				<td><input type="text" style="height: 100px; width: 300px;"
					placeholder="업무를 작성하세요." id="task_content" /></td>
			</tr>
			<tr>
				<td><input type="button" value="완료" onclick="setChildText()" /> 
				<input type="button" onclick="window.close()" value="취소" /></td>
			</tr>

		</table>
	</center>

</body>
</html>