<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function openChild() {
	window.name = "parentForm";
	window.open("Child.jsp","childForm","width=300,height=100, resizable=no, scrollbars=no");
}

</script>
<body>
<br />
	<br />
	<input type="button" value="팀 추가" id="addTeam" />
	<br />
	<br />
	<hr />
	<br />
	<br />

	<table border="1">
		<tr>
			<td>팀 이름을 입력하세요</td>
			<td><input type="button" value="업무 추가" onclick="openChild()" /></td>
		</tr>
		<tr>
			<td><input type="checkbox" value="finished" /><input type="text" id="Input_content"/></td>
		</tr>

	</table>

</body>
</html>