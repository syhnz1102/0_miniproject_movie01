<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchNAVER_XML</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
////////검색어 기능 xml
$(function(){
	
	$("#keySearchXml").click(function() {
	var queryString = $("form[name=searchxml]").serialize();
//		alert(queryString);
		$.ajax({
			url:"NaverMController.do",
			method:"post",//get이면 위 url에 파라미터값이 들어가야한다?
			dataType:"xml",
			data:queryString,
			success:function(data){
//					alert(data);
//					$("#result").text(data);
				$("#result").text("");
				$("#result").find("h1").text("검색결과(xml)");
				var searchInfo = $("<div>업데이트 날짜 : "+$(data).find("lastBuildDate").text()+"</div><div>검색결과 : "+$(data).find("total").text()+" 개 </div><br>");
				$("#result").append(searchInfo);
				var items=$(data).find("item");
				for (var i = 0; i < items.length; i++) {
					var title=items.eq(i).find("title").text();
					var image=items.eq(i).find("image").text();
//						$("#result").append("<div>"+test+"</div>");
//						var title = $("<div>영화명 : "+data.items[i].title+"</div>");
//						var pubDate = $("<div>제작연도 : "+data.items[i].pubDate+"</div>");
					$("#result").append("<div>"+title+"</div>");
					$("#result").append("<image src='"+image+"'/></div>");
//						$("#result").append(pubDate);
//						$("#result").append("<hr>");
				}
				
			},
			error: function(request,error){
//					alert("서버통신실패!!"+request.status+","+error);
			}
		});
	});
});
</script>
</head>
<body>
<form name="searchxml" method="post">
	<input type="hidden" name="command" value="searchMovieXml">
	<input type="text" name="movieNm"/>
	<input type="button" value="네이버검색XML" id="keySearchXml"/>
</form>
<div id ="result">
	<h1>찾을 영화입력 (xml)</h1>
</div>
</body>
</html>