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
	////////검색어 기능 json
	$(function(){
		var mN="";//뒤로가기버튼에 쓰일 input값 저장
		$("#keySearch").click(function search() {
		var queryString = $("form[name=search]").serialize();
// 		alert(queryString);
			$.ajax({
				url:"NaverMController.do",
				method:"post",//get이면 위 url에 파라미터값이 들어가야한다?
				dataType:"json",
				data:queryString,
				success:function(data){
					$("#result").text("");
					$("#result").append("<a href='index.jsp'> 뒤로</a>");
// 					$("#result").text(data);
					var searchInfo = $("<div>업데이트 날짜 : "+data.lastBuildDate+"</div><div>검색결과 : "+data.total+" 개 </div>");
// 					var lastbuildDate = $("<div>검색결과 : "+data.total+" 개 </div>");
					$("#result").append(searchInfo);
					for (var i = 0; i < data.items.length; i++) {
						var image = $("<image src='"+data.items[i].image+"'/></div>");
// 						영화제목 클릭시 해당영화의 정보를 ajax로 내보냄
// 						일단은 새로운 db에 출력하는게 아닌 그냥 아무 jsp form에 값을 전달. 
						var title = $("<div><a class='mtitle'>"+data.items[i].title+"</a></div>");
// 						var title = $("<div><a href='NaverMController.do?command=movieDetail&keyword="+($("input[name=movieNm]").val())+"&row="+i+"' id='Mtitle'>"
// 								+data.items[i].title+
// 								"</a></div>");
						var pubDate = $("<div>제작연도 : "+data.items[i].pubDate+"</div>");
						$("#result").append("<div class='row'>"+(i+1)+"</div>");
						$("#result").append(image);
						$("#result").append(title);
						$("#result").append(pubDate);
						$("#result").append("<hr>");
					}
					mN=$("input[name=movieNm]").val();//뒤로가기버튼에 쓰일 input값 저장
// 					alert(mN);
				},
				error: function(request,error){
					alert("서버통신실패!!"+request.status+","+error);
				}
			});
		});
		
		//뒤로가기 (상세보기에서 그전 결과목록으로 돌아가는 버튼) 구현
		$("body").on("click",".back",function() {
			var keyword = $(this).find("b").text();
// 			alert(mN);
			$("input[name=movieNm]").val(mN);
			var queryString = $("form[name=search]").serialize();
//	 		alert(queryString);
				$.ajax({
					url:"NaverMController.do",
					method:"post",//get이면 위 url에 파라미터값이 들어가야한다?
					dataType:"json",
					data:queryString,
					success:function(data){
						$("#result").text("");
//	 					$("#result").text(data);
						var searchInfo = $("<div>업데이트 날짜 : "+data.lastBuildDate+"</div><div>검색결과 : "+data.total+" 개 </div>");
//	 					var lastbuildDate = $("<div>검색결과 : "+data.total+" 개 </div>");
						$("#result").append(searchInfo);
						for (var i = 0; i < data.items.length; i++) {
							var image = $("<image src='"+data.items[i].image+"'/></div>");
//	 						영화제목 클릭시 해당영화의 정보를 ajax로 내보냄
//	 						일단은 새로운 db에 출력하는게 아닌 그냥 아무 jsp form에 값을 전달. 
							var title = $("<div><a class='mtitle'>"+data.items[i].title+"</a></div>");
//	 						var title = $("<div><a href='NaverMController.do?command=movieDetail&keyword="+($("input[name=movieNm]").val())+"&row="+i+"' id='Mtitle'>"
//	 								+data.items[i].title+
//	 								"</a></div>");
							var pubDate = $("<div>제작연도 : "+data.items[i].pubDate+"</div>");
							$("#result").append("<div class='row'>"+(i+1)+"</div>");
							$("#result").append(image);
							$("#result").append(title);
							$("#result").append(pubDate);
							$("#result").append("<hr>");
							
						}
						
					},
					error: function(request,error){
						alert("서버통신실패!!"+request.status+","+error);
					}
				});
		});

		//상세보기 (목록에서 제목누르면 상세페이지로) 구현
		$("body").on("click",".mtitle",function() {//body부터 다시 찾아서 검색결과 내에서도 mtitle을 찾을 수 있게 해준다.
// 		alert("ㅎㅇ");
		var keyword = $(this).find("b").text();
		var row = $(this).parent().prev().prev().text();
// 		alert(keyword);
// 		alert(row);
			$.ajax({
				url:"NaverMController.do",
				method:"post",
				dataType:"json",
				data:{"command":"movieDetail","keyword":keyword},
				success:function(data){
					$("#result").text("");
// 						영화제목 클릭시 해당영화의 정보를 ajax로 내보냄
// 						일단은 새로운 db에 출력하는게 아닌 그냥 아무 jsp form에 값을 전달. 
						var image = $("<image src='"+data.items[row-1].image+"'/></div>");
						var title = $("<div>"+data.items[row-1].title+"</div>");
						var subtitle = $("<div id='m_title'>"+data.items[row-1].subtitle+"</div>");
						var pubDate = $("<div>제작연도 : "+data.items[row-1].pubDate+"</div>");
						var director = $("<div>감독 : <span id='directorVal'>"+data.items[row-1].director.replace('|','')+"</span></div>");
						var actor = $("<div>출연진 : "+data.items[row-1].actor.substr(0, data.items[row-1].actor.length -1)+"</div>");
						var userRating = $("<div>네이버평점 : "+data.items[row-1].userRating+"</div>");
						var link = $("<a href='"+data.items[row-1].link+"'>네이버영화정보 바로가기</a><br>");
						var back = $("<button class='back'>뒤로가기</button>");
						var main = $("<a href='index.jsp'> 메인</a>");
						
						
						var star ='<span class="star-input"><span class="input"><input type="radio" name="star-input" value="1" id="p1"><label for="p1">1</label><input type="radio" name="star-input" value="2" id="p2"><label for="p2">2</label><input type="radio" name="star-input" value="3" id="p3"><label for="p3">3</label><input type="radio" name="star-input" value="4" id="p4"><label for="p4">4</label><input type="radio" name="star-input" value="5" id="p5"><label for="p5">5</label></span></span>';
						
// 						원본
// 						var star ='<span class="star-input"><span class="input"><input type="radio" name="star-input" value="1" id="p1"><label for="p1">1</label><input type="radio" name="star-input" value="2" id="p2"><label for="p2">2</label><input type="radio" name="star-input" value="3" id="p3"><label for="p3">3</label><input type="radio" name="star-input" value="4" id="p4"><label for="p4">4</label><input type="radio" name="star-input" value="5" id="p5"><label for="p5">5</label></span><output for="star-input"><b>0</b>점</output></span>';

// 						<span class="star-input">
// 							<span class="input">
// 						    	<input type="radio" name="star-input" value="1" id="p1">
// 						    	<label for="p1">1</label>
// 						    	<input type="radio" name="star-input" value="2" id="p2">
// 						    	<label for="p2">2</label>
// 						    	<input type="radio" name="star-input" value="3" id="p3">
// 						    	<label for="p3">3</label>
// 						    	<input type="radio" name="star-input" value="4" id="p4">
// 						    	<label for="p4">4</label>
// 						    	<input type="radio" name="star-input" value="5" id="p5">
// 						    	<label for="p5">5</label>
// 						  	</span>
// 					  	<output for="star-input"><b>0</b>점</output>						
// 						</span>


						var replyform = '<form action="MUserController.do" method="post"><input type="hidden" name="command" value="addBoard"><input type="hidden" name="m_title" value="'+$("#m_title").text()+'"><table class="table table-striped"><tr><th>아이디</th><td>'+'여기는아이디값'+'</td></tr><tr><th>한줄평</th><td><textarea rows="10" cols="60" name="content" required="required"></textarea></td></tr><tr><td colspan="2"><input type="submit" class="btn btn-success" value="글등록"></td></tr></table></form>';
// 						'<form action="MReplyController.do" method="post">
// 						<input type="hidden" name="command" value="addBoard">
// 						<input type="hidden" name="m_title" value="'+$("#m_title").text()+'">
// 							<table class="table table-striped">
// 								<tr>
// 									<th>아이디</th>
// 									<td>'+'여기는아이디값'+'</td>
// 								</tr>
// 								<tr>
// 									<th>내용</th>
// 									<td><textarea rows="10" cols="60" name="content" required="required"></textarea></td>
// 								</tr>
// 								<tr>
// 									<td colspan="2"><input type="submit" class="btn btn-success" value="글등록"></td>
// 								</tr>
// 							</table>
// 						</form>'

						
						

						$("#result")
						.append(image)
						.append(userRating)
						.append(title)
						.append(subtitle)
						.append(pubDate)
						.append(director)
						.append(actor)
						.append(link)
						.append(main)
						.append(back);
						
// 							만약 홈페이지 오른쪽위에 구현할 아이디 쓰여있는 칸에 아이디가 쓰여 있다면 실행(로그인했을때만 실행되는 그것)
// 							(아이디를 누르면 마이페이지로가게되어있다)
// 						if(){
// 							$("#result").append("<div>"+star+"</div>")
// 							.append("<div id='div1'>"+replyform+"</div>");
							
// 						}
						
						
						alert($("#m_title").text());
						
// 					}
					
				},
				error: function(request,error){
					alert("서버통신실패!!"+request.status+","+error);
				}
			});//ajax끝
		});
		
		$("body").on("click",".star-input",function() {
			var a=$("input:radio[name=star-input]:checked").val();//체크받은 별점값
// 			alert(a);
// 			alert($("input:radio[name=star-input]:checked").val());
// 			alert($(".input").text());
			$("body").find($("#rate")).text(a);
		});
	});
	
	
</script>

<style type="text/css">

</style>
</head>
<%

%>
<body>
<h1>${msg}</h1>


<h1>홈페이지</h1>
<h1>깃허브용 수정중</h1>

<!-- <a href="NaverMController.do">네이버api테스트</a> -->
<a href="MUserController.do?command=loginform">로그인</a>
<a href="MUserController.do?command=regist">회원가입</a>
<br>
<form name="search" method="post">
	<input type="hidden" name="command" value="searchMovie">
	<input type="text" name="movieNm"/>
	<input type="button" value="네이버검색" id="keySearch"/>
</form>

<div id ="result">
	<h1></h1>
</div>
<div id="rate"></div>


</body>
</html>