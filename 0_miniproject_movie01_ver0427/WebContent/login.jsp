<%@include file="iflogin.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>로그인폼</h1>
<form action="MUserController.do">
<input type="hidden" name="command" value="login">
<table border="1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" required="required">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="password" required="required">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='regist.jsp'">
			<input type="button" value="메인" onclick="location.href='index.jsp'">
		</td>
	</tr>
</table>
</form>
</body>
</html>