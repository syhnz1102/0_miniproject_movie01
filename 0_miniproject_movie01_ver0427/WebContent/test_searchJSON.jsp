<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchNAVER_JSON</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	////////테스트버튼
	$(function(){
		$(".search").click(function() {
			$.ajax({
				url:"NaverMController.do",
				method:"post",
				dataType:"json",
				data:{"command":"searchMovie"},
				success:function(data){
					$("#result").text("");
					var searchInfo = $("<div>업데이트 날짜 : "+data.lastBuildDate+"</div><div>검색결과 : "+data.total+" 개 </div>");
					$("#result").append(searchInfo);
					var lastbuildDate = $("<div>업데이트 날짜 : "+data.lastBuildDate+"</div>");
					for (var i = 0; i < data.items.length; i++) {
						var image = $("<image src='"+data.items[i].image+"'/></div>");
						var title = $("<div>영화명 : "+data.items[i].title+"</div>");
						var pubDate = $("<div>제작연도 : "+data.items[i].pubDate+"</div>");
						$("#result").append(image);
						$("#result").append(title);
						$("#result").append(pubDate);
						$("#result").append("<hr>");
					}
					
				},
				error: function(request,error){
	//					alert("서버통신실패!!"+request.status+","+error);
				}
			});
		});
	});
	
	////////검색어 기능 json
	$(function(){
		
		$("#keySearch").click(function() {
		var queryString = $("form[name=search]").serialize();
	//		alert(queryString);
			$.ajax({
				url:"NaverMController.do",
				method:"post",//get이면 위 url에 파라미터값이 들어가야한다?
				dataType:"json",
				data:queryString,
				success:function(data){
					$("#result").text("");
	//					$("#result").text(data);
					var searchInfo = $("<div>업데이트 날짜 : "+data.lastBuildDate+"</div><div>검색결과 : "+data.total+" 개 </div>");
	//					var lastbuildDate = $("<div>검색결과 : "+data.total+" 개 </div>");
					$("#result").append(searchInfo);
					for (var i = 0; i < data.items.length; i++) {
						var image = $("<image src='"+data.items[i].image+"'/></div>");
						var title = $("<div>영화명 : "+data.items[i].title+"</div>");
						var pubDate = $("<div>제작연도 : "+data.items[i].pubDate+"</div>");
						$("#result").append(image);
						$("#result").append(title);
						$("#result").append(pubDate);
						$("#result").append("<hr>");
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
<input type="button" value="네이버api테스트" class="search"/>
<form name="search" method="post">
	<input type="hidden" name="command" value="searchMovie">
	<input type="text" name="movieNm"/>
	<input type="button" value="네이버검색" id="keySearch"/>
</form>
<div id ="result">
	<h1>찾을 영화입력 (json)</h1>
</div>
</body>
</html>