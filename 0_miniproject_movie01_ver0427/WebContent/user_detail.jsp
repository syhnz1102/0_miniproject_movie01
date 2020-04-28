<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>나의 정보</h1>
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
		<td>
			${dto.m_address}
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>
			${dto.m_phone}
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			${dto.m_email}
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
			<button type="button" value="메인" onclick="location.href='user_main.jsp'" >메인</button>
			<button type="button" value="정보수정" onclick="updateUserForm('${dto.m_id}')" >정보수정</button>
			<button type="button" value="탈퇴" onclick="delUser('${dto.m_id}')" >탈퇴</button>
		</td>
	</tr>
	
</table>
<script type="text/javascript">

	function updateUserForm(id){
		location.href="MUserController.do?command=updateform&id="+id;
	}
	function delUser(id){
		location.href="MUserController.do?command=userdelete&id="+id;
	}
</script>
</body>
</html>