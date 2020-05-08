<%@include file="iflogin.jsp"%>
<%@include file="header_searchBar.jsp"%>
<%@include file="test02_star.jsp"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
</script>
<body>
 
<h1>${msg}</h1>

<div id ="result">
	<h1></h1>
</div>
<div id="detailInfo"></div>
<div id="rate"></div>
<div id='starResult'></div>
<div id='commbutton'></div>
<div id='replyForm'></div>
<!-- <h1>홈페이지</h1> -->

<!--  <a href="NaverMController.do">네이버api테스트</a> --> 
<!-- <a href="MUserController.do?command=loginform">로그인</a> -->
<!-- <a href="MUserController.do?command=regist">회원가입</a> -->
<!-- <br> -->
<!-- <form name="search" method="post"> -->
<!-- 	<input type="hidden" name="command" value="searchMovie"> -->
<!-- 	<input type="text" name="movieNm"/> -->
<!-- 	<input type="button" value="네이버검색" id="keySearch"/> -->
<!-- </form> -->

<!-- <div id ="result"> -->
<!-- 	<h1></h1> -->
<!-- </div> -->
<!-- <div id="rate"></div> -->


</body>
</html>