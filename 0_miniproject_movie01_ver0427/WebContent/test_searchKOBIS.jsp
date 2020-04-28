<%@page import="java.util.HashMap"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>search KOBIS</title>
</head>
<%

//////////////////////////현재페이지에서 영화검색 리스트 호출//////////////////////////////////
//만약 엽문 을 치면 그 값이 전달되어서 해당하는걸 찾는다.


	String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");
	String itemPerPage=request.getParameter("itemPerPage")==null?"20":request.getParameter("itemPerPage");
	String movieNm = request.getParameter("movieNm")==null?"해리포터":request.getParameter("movieNm");
	String directorNm = request.getParameter("directorNm")==null?"":request.getParameter("directorNm");
	String openStartDt = request.getParameter("openStartDt")==null?"":request.getParameter("openStartDt");
	String openEndDt = request.getParameter("openEndDt")==null?"":request.getParameter("openEndDt");
	String prdtStartYear = request.getParameter("prdtStartYear")==null?"":request.getParameter("prdtStartYear");
	String prdtEndYear = request.getParameter("prdtEndYear")==null?"":request.getParameter("prdtEndYear");
	String repNationCd=request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");
	String [] movieTypeCdArr = null;
	
	//발급키
	String key="ee27a84a2b1eba74150f10a20c97341a";
	//kobis오픈api rest client를 통해 호출
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
	String ListResponse = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
	System.out.println(ListResponse);
	//json 라이브러리를 통해 Handling
	ObjectMapper mapper=new ObjectMapper();
	HashMap<String, Object> listResult= mapper.readValue(ListResponse,HashMap.class);
	System.out.println(listResult.get("movieListResult"));
	pageContext.setAttribute("listResult",listResult);
 
%>
<body>
<form action="KobisController.do" method="post">
	<input type="hidden" name="command" value="searchMovie">
	<input type="text" name="movieNm"/>
	<input type="submit" value="kobis검색(외부페이지)"/>
</form>

<input type="button" value="kobis api 테스트" onclick="location.href='KobisController.do?command=searchMovie'"></input>
<br><br>

<!-- <form action="KobisController.do" method="post"> -->
<!-- 	<input type="hidden" name="command" value="searchMovie"> -->
<!-- 	<input type="text" name="movieNm"/> -->
<!-- 	<input type="submit" value="kobis검색(현재페이지)"/> -->
<!-- </form> -->

	<h1>현재페이지결과 (kobis) (검색어:해리포터)	</h1>


<!-- /////////////////////// 현재페이지에서 영화검색 리스트 호출 //////////////////// -->
	<h1></h1>
	<table id="result2" border="1">
		<tr>
			<th>영화코드</th>
			<th>영화명(한글)</th>
			<th>영화명(영문)</th>
			<th>제작연도</th>
			<th>개봉연도</th>
			
			<th>영화유형</th>
			<th>제작상태</th>
			<th>제작국가(전체)</th>
			<th>영화장르(전체)</th>
			<th>대표 제작국가명</th>
			
			<th>대표 장르명</th>
			<th>영화감독</th>
			<th>제작사 코드</th>
			<th>제작사명</th>
		</tr>
		<c:if test="${not empty listResult.movieListResult.movieList}">
			<c:forEach items="${listResult.movieListResult.movieList}" var="movielist">
				<tr>
					<td><c:out value="${movielist.movieCd}"/> </td>
					<td><c:out value="${movielist.movieNm}"/> </td>
					<td><c:out value="${movielist.movieNmEn}"/> </td>
					<td><c:out value="${movielist.prdtYear}"/> </td>
					<td><c:out value="${movielist.openDt}"/> </td>
					
					<td><c:out value="${movielist.typeNm}"/> </td>
					<td><c:out value="${movielist.prdtStatNm}"/> </td>
					<td><c:out value="${movielist.nationAlt}"/> </td>
					<td><c:out value="${movielist.genreAlt}"/> </td>
					<td><c:out value="${movielist.repNationNm}"/> </td>
					
					<td><c:out value="${movielist.repGenreNm}"/> </td>
					<td><c:out value="${movielist.directors[0].peopleNm}"/> </td>
					<td><c:out value="${movielist.companys[0].companyCd}"/> </td>
					<td><c:out value="${movielist.companys[0].companyNm}"/> </td>
					
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>