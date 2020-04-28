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
	function movieListR() {
		var movieNm = document.getElementsByName("movieNm")[0].value;
		location.href="NaverMController.do?command=movieListR&movieNm="+movieNm;
	}
	////////검색어 기능 json
	$(function(){
	//		var mN="";//뒤로가기버튼에 쓰일 input값 저장
		var movieNm = $("h1 > b").text();//b에 있는 영화제목 가져와서
		$("input[name=movieNm]").text(movieNm);//검색창.text안에 넣기 = val이랑 다름 val로하면 안됨
	//검색어 안친 상태의 유저메인 에서  ajax실행하지 않기
		if($("input[name=movieNm]").text()!=""){
	
// 		alert($("input[name=movieNm]").text());
		
// 			var movieNm = $("h1 > b").text();
			$.ajax({
				url:"NaverMController.do",
				method:"post",
				dataType:"json",
				data:{"command":"searchMovie","movieNm":movieNm},
				success:function(data){
					$("#resultBox").text("");
					
					$("#result").text("");
					$("#detailInfo").text("");
					
					$("#resultBox").append("<a href='user_main.jsp'> 뒤로</a>");
					var searchInfo = $("<div>업데이트 날짜 : "+data.lastBuildDate+"</div><div>검색결과 : "+data.total+" 개 </div>");
					$("#resultBox").append(searchInfo);
					for (var i = 0; i < data.items.length; i++) {
						var image	 = $("<image class='mimg' src='"+data.items[i].image+"'/></div>");
		//						영화제목 클릭시 해당영화의 정보를 ajax로 내보냄
		//						일단은 새로운 db에 출력하는게 아닌 그냥 아무 jsp form에 값을 전달. 
						var title		 = $("<div><a class='mtitle'>"+data.items[i].title+"</a></div>");
						var director	 = $("<div class='mdirector'>감독 : <span>"+data.items[i].director.replace('|','').replace('|','')+"</span></div>");
						var pubDate		 = $("<div class='mpubdate'>제작연도 : <span>"+data.items[i].pubDate+"</span></div>");
						
						var resultInfo	 = $("<div class='result'></div>");
						var detailInfo	 = $("<div class='detailInfo'></div>");
						
						$("#resultBox").append(resultInfo);
						
						$(".result").eq(i)
// 						.append("<div class='row'>"+(i+1)+"</div>")
						.append(image)
						.append(title)
						.append(director)
						.append(pubDate)
						.append("<hr>")
						.append(detailInfo);
						
						var userRating	 = $("<div class='mrate'>네이버평점 : <span>"+data.items[i].userRating+"</span></div>");
						var subtitle 	 = $("<div class='msubtitle'>"+data.items[i].subtitle+"</div>");
						var actor 		 = $("<div class='mactor'>출연진 : <span>"+data.items[i].actor.substr(0, data.items[i].actor.length -1)+"</span></div>");
						var link 		 = $("<div class='mlink'><a href='"+data.items[i].link+"'>네이버영화정보 바로가기</a></div>");
						
						var back		 = $("<button class='back'>뒤로가기(목록으로)</button>");
						var main 		 = $("<a href='user_main.jsp'> 메인</a>");
						$(".detailInfo").eq(i)
						.append(userRating)
						.append(subtitle)
						.append(actor)
						.append(link)
						;
//							.append("<button id='comm' onclick='comm()'>코멘트쓰기</button>");
//							.append("<div id='starResult'></div>");
					}
		//				mN=$("input[name=movieNm]").val();//뒤로가기버튼에 쓰일 input값 저장
				},
				error: function(request,error){
					alert("서버통신실패!!"+request.status+","+error);
				}
			});
			
			
		}
	});
</script>
</head>
<body>

<!-- 검색어기능 -->
<h1>회원메인</h1>
<div>
	<a href='' id='idVal'>${sessionScope.ldto.m_id}</a>
	(${sessionScope.ldto.m_role eq 'USER'?'일반회원':'관리자?-오류 '})
	<a href="MUserController.do?command=userinfo&id=${sessionScope.ldto.m_id}">나의 정보</a>
	<a href="MUserController.do?command=logout">로그아웃</a>
</div>
<form name="search" method="post">
	<input type="hidden" name="command" value="searchMovie">
	<input type="text" name="movieNm"/>
	<input type="button" value="네이버검색" id="keySearch"/>
	<button type="button" onclick='movieListR()'>테스트</button>
</form>

<%
// 	LoginDto ldto=(LoginDto)session.getAttribute("ldto");
// 	if(ldto==null){   
// 		pageContext.forward("index.jsp");
// 	}
%>
</body>
</html>