<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보상태조회</h1>
<table border="1">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>사용여부</th>
		<th>등급</th>
		
<!-- 		실수로 빼먹음 - 나중에가입일추가 -->
<!-- 		<th>가입일</th>  -->
	</tr>
<!-- 	없으면 --회원정보가없습니다--/ 있으면 회원정보 뿌려주게 -->
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="8">--회원정보가 없습니다--</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="i" begin="0" end="${list.size()-1}" step="1">
				<tr>
					<td>${i+1}</td>
					<td>${list[i].m_id}</td>
					<td>${list[i].m_name}</td>
					<td>${list[i].m_address}</td>
					<td>${list[i].m_phone}</td>
					<td>${list[i].m_email}</td>
					<td>${list[i].m_enabled}</td>
					<td>${list[i].m_role}
						<button onclick="roleChange('${list[i].m_id}')">등급변경</button>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
	<script type="text/javascript">
	function roleChange(id) {
		location.href="MUserController.do?command=roleForm&id="+id;
	}
	</script>
</body>
</html>