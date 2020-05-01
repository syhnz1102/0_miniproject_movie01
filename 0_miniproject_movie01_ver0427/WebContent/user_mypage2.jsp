<%@include file="header.jsp" %>
<%@include file="header_searchBar.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.moviebox{height:170px;width:120px;}
.num{height:30px;}
</style>
</head>
<body>
<h2>내가 평가한 영화</h2>
<table>
	<c:forEach begin="1" end="5" step="1" var="i" varStatus="status"> 	<%-- 5개 점수별로 나누는 for문 --%>
		<tr>
			<td class="num">
<%-- 				<div>${i}점 준 영화</div> --%>
				<div>${(status.end+1)-i}점 준 영화</div>
			</td>
		</tr>
		<tr>
		<c:choose>
			<%--만약 list안에 값이 없다면 --%>
			<c:when test="${empty list}">	
				<td>
					<h2> ..!! 아직 ${i}점 준 영화가 없네요..</h2>
				</td>
			</c:when>
			
			<%--만약 i점 대의 list안에 값이 있다면 (뮤슨값이?)--%>
			<c:otherwise>	
				<!-- 1번돌때 해당되는 n점의 n과 영화평이 같으면 뿌리라! -->
				<c:forEach items="${list}" var="dto" varStatus="">
					<c:choose>
						<c:when test="${dto.m_rate eq (status.end+1)-i}"> <%--만약 해당 리스트 의 rate값이 1이면 표시하라 --%>
							
								<td class="moviebox">
									<div class="movie">
										<div class="imgbox">
											<img class="img" src="${dto.m_img}">
										</div>
										<span id="title">${dto.m_title}</span> 
	<%-- 									${dto.m_rate}점 --%>
									</div>
								</td>
							
						</c:when>
					</c:choose>
				</c:forEach> <!-- n점 대의 값들을 뿌리라! 끝 -->
			</c:otherwise>
		</c:choose><%--만약 list안에 값이 없다면 끝--%>
		</tr>
	</c:forEach><%-- 5개 점수별for문 끝 --%>


<%-- 	<c:choose> --%>
<%-- 		<c:when test="${not empty list}"> --%>
<%-- 			<c:forEach items="${list}" var="dto" varStatus=""> --%>
<!-- 				<tr> -->
<!-- 					<td> -->
<%-- 						<div>${dto.m_rate}점 준 영화</div> --%>
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 						<img src="${dto.m_img}"> --%>
<%-- 						${dto.m_title}  --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<%-- 		</c:when> --%>
<%-- 	</c:choose> --%>
</table>
</body>
</html>