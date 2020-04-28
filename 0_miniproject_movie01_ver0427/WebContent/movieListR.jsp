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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		var movieNm = $("h1 > b").text();
		$("input[name=movieNm]").val(movieNm);
		
		$("body").on("click",".mtitle",function toDetail() {
			var mimg=$(this).parent().prev().attr("src");
			var mtitle=$(this).text();
// 			var mdirector=$(this).parent().next().find("span").text();
			var mid=$("#idVal").text();
			var mdirector=$(this).parent().siblings("div").eq(0).find("span").text();//딱 이름만
// 			var mdirector=$(this).parent().siblings("div").eq(0).text();//감독: 이텍스트까지
			var mpubdate=$(this).parent().siblings("div").eq(1).find("span").text();
			
			var mrate=$(this).parent().siblings("div").eq(2).find("div").eq(0).find("span").text();
			var msubtitle=$(this).parent().siblings("div").eq(2).find("div").eq(1).text();
			var mactor=$(this).parent().siblings("div").eq(2).find("div").eq(2).find("span").text();
			var mlink=$(this).parent().siblings("div").eq(2).find("div").eq(3).find("a").attr("href");
			
			var detailInput= $("#det").find("input");
// 			$("#det").find("input[name=mtitle]").val(mtitle);
			detailInput.eq(1).val(mtitle);
			detailInput.eq(2).val(mid);
			detailInput.eq(3).val(mdirector);
			detailInput.eq(4).val(mpubdate);
			detailInput.eq(5).val(mrate);
			detailInput.eq(6).val(msubtitle);
			detailInput.eq(7).val(mactor);
			detailInput.eq(8).val(mlink);
			detailInput.eq(9).val(mimg);
			detailInput.eq(10).val(movieNm);
			
			$("#det").submit();
		});
	});
	
	
</script>
<style type="text/css">
.detailInfo{display:none}
</style>
</head>
<body>
<h1>"<b>${movieNm}</b>" 검색결과</b></h1>
<div id ="resultBox">
</div>
<div>
<form id="det" action="NaverMController.do" method="post">
	<input type="hidden" name="command" value="movieDetailR">
	<input type="hidden" name="mtitle">
	<input type="hidden" name="mid">
	<input type="hidden" name="mdirector">
	<input type="hidden" name="mpubdate">
	<input type="hidden" name="mrate">
	<input type="hidden" name="msubtitle">
	<input type="hidden" name="mactor">
	<input type="hidden" name="mlink">
	<input type="hidden" name="mimg">
	<input type="hidden" name="mkeyword">
</form>
</div>
</body>
</html>