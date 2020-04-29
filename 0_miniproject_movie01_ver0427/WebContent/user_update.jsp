<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header2.jsp" %>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>정보수정</h1>
<form action="MUserController.do" method="post">
<input type="hidden" name="command" value="userupdate"/>
<input type="hidden" name="id" value="${dto.m_id}"/>
	<table border="1">
		<col width="100px">
		<col width="200px">
		<tr>
			<th>아이디</th>
			<td>
				${dto.m_id}
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				${dto.m_name}
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" value="${dto.m_address}">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" value="${dto.m_phone}">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="${dto.m_email}">
			</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>
				${dto.m_role eq 'USER'?'일반회원':''}
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정완료" />
				<input type="button" value="메인" onclick="location.href='index.jsp'" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>