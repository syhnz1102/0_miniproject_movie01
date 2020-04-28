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
<title>boxoffice KOBIS</title>
</head>
<%
	
	///////////////////////////////////박스오피스/////////////////////////////////페이지로딩시에 자동으로 시작
	//파라미터설정
	//조회일자
	String targetDt=request.getParameter("targetDt")==null?"20200407":request.getParameter("targetDt");
	//결과row수
	String itemPerPage=request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");
	//"Y" : 다양성 영화  "N" : 상업영화 (default: 전체)
	String multiMovieYn=request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");
	//"K" : 한국 영화  "F" : 외국 영화 (default: 전체)
	String repNationCd=request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");
	//지역코드?
	String wideAreaCd=request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");
	
	//발급키
	String key="ee27a84a2b1eba74150f10a20c97341a";
	//kobis오픈api rest client를 통해 호출
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	//일일 박스오피스 서비스 호출
	String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
	
	//json 라이브러리를 통해 Handling
	ObjectMapper mapper=new ObjectMapper();
	HashMap<String, Object> dailyResult= mapper.readValue(dailyResponse,HashMap.class);
	
	pageContext.setAttribute("dailyResult",dailyResult);

%>
<body>


<h1 id="click">오늘의 박스오피스 top10</h1>
<table id="result" border="1">
	<tr>
		<td>순위</td>
		<td>영화명</td>
		<td>개봉일</td>
		<td>매출액</td>
		<td>매출액점유율</td>
		<td>매출액증감(전일대비)</td>
		<td>누적매출액</td>
		<td>관객수</td>
		<td>관객수증감(전일대비)</td>
		<td>누적관객수</td>
		<td>스크린수</td>
		<td>상영횟수</td>
	</tr>
	<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
	<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
		<tr>
			<td><c:out value="${boxoffice.rank}"/></td>
			<td><c:out value="${boxoffice.movieNm}"/></td>
			<td><c:out value="${boxoffice.openDt}"/></td>
			<td><c:out value="${boxoffice.salesAmt}"/></td>
			<td><c:out value="${boxoffice.salesShare}"/></td>
			<td><c:out value="${boxoffice.salesInten}"/></td>
			<td><c:out value="${boxoffice.salesAcc}"/></td>
			<td><c:out value="${boxoffice.audiCnt}"/></td>
			<td><c:out value="${boxoffice.audiInten}"/></td>
			<td><c:out value="${boxoffice.audiAcc}"/></td>
			<td><c:out value="${boxoffice.scrnCnt}"/></td>
			<td><c:out value="${boxoffice.showCnt}"/></td>
		</tr>
	</c:forEach>
	</c:if>
</table>


</body>
</html>