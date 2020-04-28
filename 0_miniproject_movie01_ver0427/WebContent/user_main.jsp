<%@include file="test02_star.jsp"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<%@include file="header_searchBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//
	function gg() {
		document.getElementById("com").submit();
		alert("코멘트가 등록되었습니다.");
		//평점했을때처럼 코멘트가 들어있으면 11111111111111111111111111111111111111111111
		//화면 보여주고 아니면 화면 안보여주고 를 이미 짜놓은 ajax에 추가해주기
		//복잡해보인다싶으면 그냥 한번더 ajax복붙해주기
	}
	function comm() {
// 		if(bool!=null){
			$("#replyForm").toggle();
// 		}
// 		window.open("MReplyController.do?command=a&id","","width=300px,height=300px");
// 		새로운 폼 페이지로 이동시킨 후 그 페이지에서 실행시키기  
	}
	
	function movieListR() {
		var movieNm = document.getElementsByName("movieNm")[0].value;
		location.href="NaverMController.do?command=movieListR&movieNm="+movieNm;
	}
	


		//상세보기 (목록에서 제목누르면 상세페이지로) 구현
		//rate는 밖에서 선언해놓기(rate유무에 따른 코멘트를 온로드로해야해서)
		var rate;
		var replyform;
		//누를때 chkRate를 해줘야한다.
		//목록화면에서 찾는걸 써주자. 뭘? id, title director
		$("body").on("click",".mtitle",function() {//body부터 다시 찾아서 검색결과 내에서도 mtitle을 찾을 수 있게 해준다.
		var mtitle=$(this).text();
		var mdirector=$(this).parent().next().find("span").text();
		var mid=$("#idVal").text();
// 		alert(mtitle);
// 		alert(mdirector);
// 		alert(mid);
		var keyword = $(this).find("b").text();
		var row = $(this).parent().prev().prev().text();
		//평점유무를 알아오는 ajax 를 사용해 boolean값을 얻어온 후  if 와 else로 두가지 ajax를 통해 상세보기 제공
			$.ajax({
					url:"MReplyController.do",
					method:"post",
					dataType:"json",
					data:{"command":"getReply","mtitle":mtitle,"mdirector":mdirector,"mid":mid},
					success:function(data){
							rate=data;
// 							var keyword = $(this).find("b").text();
// 							var row = $(this).parent().prev().prev().text();
								$.ajax({
									url:"NaverMController.do",
									method:"post",
									dataType:"json",
									async:false,
									data:{"command":"movieDetail","keyword":keyword,"mtitle":mtitle,"mdirector":mdirector,"mid":mid},
									success:function(data){
										$("#result").text("");
										$("#starResult").text("");
					// 						영화제목 클릭시 해당영화의 정보를 ajax로 내보냄
					// 						일단은 새로운 db에 출력하는게 아닌 그냥 아무 jsp form에 값을 전달. 
											var image = $("<image src='"+data.items[row-1].image+"'/></div>");
											var title = $("<div id='titleVal'>"+data.items[row-1].title+"</div>");
											var subtitle = $("<div id='m_title'>"+data.items[row-1].subtitle+"</div>");
											var pubDate = $("<div>제작연도 : "+data.items[row-1].pubDate+"</div>");
											var director = $("<div>감독 : <span id='directorVal'>"+data.items[row-1].director.replace('|','')+"</span></div>");
											var actor = $("<div>출연진 : "+data.items[row-1].actor.substr(0, data.items[row-1].actor.length -1)+"</div>");
											var userRating = $("<div>네이버평점 : "+data.items[row-1].userRating+"</div>");
											var link = $("<a href='"+data.items[row-1].link+"'>네이버영화정보 바로가기</a><br>");
											var back = $("<button class='back'>뒤로가기</button>");
											var main = $("<a href='user_main.jsp'> 메인</a>");
											
											//1.콘트롤러에서 ajax로 dto안의 평점의 유무를 확인하고 온다.
											//2.if dto안에 평점이 없다면 원래대로 보여주고
											//  else 있다면 checked를 시켜서 보여준다.
											// if(rate!=null){
											// 		//밑에 변수 star를 append 한 후 거기에 있는 input 속성 안에 rate를 대입시키자
											// }
											
											
											//콘트롤러에서 dao를 바로 실행시키면된다 그러고 나서 
											
											//원본a
											var star ='<span class="star-input"><span class="input"><input type="radio" name="star-input" value="1" id="p1"><label for="p1">1</label><input type="radio" name="star-input" value="2" id="p2"><label for="p2">2</label><input type="radio" name="star-input" value="3" id="p3"><label for="p3">3</label><input type="radio" name="star-input" value="4" id="p4"><label for="p4">4</label><input type="radio" name="star-input" value="5" id="p5"><label for="p5">5</label></span></span>';
											//star-input만없앤버전
					// 						var star ='<span class="input"><input type="radio" name="star-input" value="1" id="p1"><label for="p1">1</label><input type="radio" name="star-input" value="2" id="p2"><label for="p2">2</label><input type="radio" name="star-input" value="3" id="p3"><label for="p3">3</label><input type="radio" name="star-input" value="4" id="p4"><label for="p4">4</label><input type="radio" name="star-input" value="5" id="p5"><label for="p5">5</label></span>';
											//input만없앤버전
					// 						var star ='<span class="star-input"><input type="radio" name="star-input" value="1" id="p1"><label for="p1">1</label><input type="radio" name="star-input" value="2" id="p2"><label for="p2">2</label><input type="radio" name="star-input" value="3" id="p3"><label for="p3">3</label><input type="radio" name="star-input" value="4" id="p4"><label for="p4">4</label><input type="radio" name="star-input" value="5" id="p5"><label for="p5">5</label></span>';
											
											
					// 						극원본
					// 						var star ='<span class="star-input"><span class="input"><input type="radio" name="star-input" value="1" id="p1"><label for="p1">1</label><input type="radio" name="star-input" value="2" id="p2"><label for="p2">2</label><input type="radio" name="star-input" value="3" id="p3"><label for="p3">3</label><input type="radio" name="star-input" value="4" id="p4"><label for="p4">4</label><input type="radio" name="star-input" value="5" id="p5"><label for="p5">5</label></span><output for="star-input"><b>0</b>점</output></span>';
					
											//원본a
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
					// 						</span>
					
											//극원본
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
					
					
	 										replyform = '<form id="com" action="MReplyController.do" method="post"><input type="hidden" name="command" value="addComment"><input type="hidden" name="id" value="'+$("#idVal").text()+'"><input type="hidden" name="director" value="'+data.items[row-1].director.replace("|","")+'"><input type="hidden" name="title" value="'+data.items[row-1].title.replace("<b>","").replace("</b>","")+'"><table class="table table-striped"><tr><td><b>'+$("#idVal").text()+'</b>님의 코멘트 : </td><td><textarea rows="3" cols="60" name="content" placeholder="자유롭게 코멘트를 남겨주세요!." required="required" /></td></tr><tr><td colspan="2"><input type="button" class="btn btn-success" value="글등록" onclick="gg()"></td></tr></table></form>';
					// 						'<form action="MReplyController.do" method="post">
					// 						<input type="hidden" name="command" value="addComment">
					// 						<input type="hidden" name="id" value="'+$("#idVal").text()+'">
					// 						<input type="hidden" name="director" value="'+data.items[row-1].director.replace('|','')+'">
					// 						<input type="hidden" name="title" value="'+data.items[row-1].title.replace("<b>","").replace("</b>","")+'">
					// 							<table class="table table-striped">
					// 								<tr>
					// 									<th>'+$("#idVal").text()+'님의 한줄평</th>
					// 									<td><textarea rows="10" cols="30" name="content" required="required"></textarea></td>
					// 								</tr>
					// 								<tr>
					// 									<td colspan="2"><input type="submit" class="btn btn-success" value="글등록"></td>
					// 								</tr>
					// 							</table>
					// 						</form>'
					
// 											var replyform = '<form action="MUserController.do" method="post"><input type="hidden" name="command" value="addBoard"><input type="hidden" name="m_title" value="'+$("#m_title").text()+'"><table class="table table-striped"><tr><th>아이디</th><td>'+$("#idVal").text()+'</td></tr><tr><th>한줄평</th><td><textarea rows="3" cols="60" name="content" required="required"></textarea></td></tr><tr><td colspan="2"><input type="submit" class="btn btn-success" value="글등록"></td></tr></table></form>';
					//						원본
					// 						'<form action="MReplyController.do" method="post">
					// 						<input type="hidden" name="command" value="addBoard">
					// 						<input type="hidden" name="title" value="'+$("#m_title").text()+'">
					// 							<table class="table table-striped">
					// 								<tr>
					// 									<th>아이디</th>
					// 									<td>'+$("#idVal").text()+'</td>
					// 								</tr>
					// 								<tr>
					// 									<th>내용</th>
					// 									<td><textarea rows="10" cols="30" name="content" required="required"></textarea></td>
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
											.append(back)
											.append("<div>"+star+"</div>");
// 											.append("<button id='comm' onclick='comm()'>코멘트쓰기</button>");
// 											.append("<div id='starResult'></div>");
										 	
										 	
											if(rate!=false){//rate안에 값이 있으면 그값과 같은 순서의 radio를 체크후 #starResult의 text값을 바꾼다
												for (var i = 1; i < 6; i++) {
													if(i==rate){//만약 rate가 2일 때 i가 2가 되면 밑에가 실행됨 - 밑에는 0,1,2번째 즉 3번째의 값이 나오므로 -1해줌
// 														alert($(".input").find($("input[type=radio]")[i-1]).prop("value"));
														var rateVal = $(".input").find($("input[type=radio]")[i-1]);
														rateVal.prop("checked","checked");
														$("#starResult").text("내가 준 평가 : "+rateVal.prop("value")+"점");
													}
												}
												$("#commbutton").text("");
											 	$("#commbutton").append("<button id='comm' onclick='comm()'>코멘트쓰기</button>");
// 												$("#commbutton").show();
// 												$("#comm").attr("display","block");
// 												$("#replyForm").text("");//rate안에 값이 있으면 코멘트폼을 보여준다
// 												$("#replyForm").append(replyform);
												
// 												<span class="star-input">
												// 							<span class="input">
												// 						    	<input type="radio" name="star-input" value="1" id="p1">
											// 		//밑에 변수 star를 append 한 후 거기에 있는 input 속성 안에 rate를 대입시키자
											}else{
												$("#commbutton").text("");
// 												$("#replyForm").text("");//rate안에 값이 없으면 코멘트란을 비운다.
											}
					
											$($("#starResult").text).change(function (){//#starResult안의 텍스트값이 바뀌면 코멘트폼을 보여준다
												$("#commbutton").text("");
											 	$("#commbutton").append("<button id='comm' onclick='comm()'>코멘트쓰기</button>");
// 												$("#replyForm").text("");
// 												$("#replyForm").append(replyform);
											});
										 		
												$("#replyForm").text("");
												$("#replyForm").append(replyform);
					 
					
									},
									error: function(request,error){
										alert("서버통신실패!!"+request.status+","+error);
									}
								});//ajax끝
						
					},
					error: function(request,error){
						alert("서버통신실패!!"+request.status+","+error);
					}
				});//ajax끝
		//원리 :
			//영화제목(타이틀)을 누르면 해당 검색어로 검색한 결과중 몇번째에 있는지를 row에 담고
			//ajax로 해당 영화를 검색할 때 사용한 검색어로 다시 재검색 후 row번째의 item(영화)의 정보들을 출력(items[row])
		
		});
		
// 		$.ajax({
// 			url:"MReplyController.do",
// 			method:"post",
// 			dataType:"json",
// 			data:{"command":"getReply","mtitle":mtitle,"mdirector":mdirector,"mid":mid},
// 			success:function(data){
// 					var rate2=data;
// 					if(rate2!=false){
// 		 				for (var i = 1; i < 6; i++) {
// 		 					if(i==rate2){//만약 rate가 2일 때 i가 2가 되면 밑에가 실행됨 - 밑에는 0,1,2번째 즉 3번째의 값이 나오므로 -1해줌
// 		 	//						alert($(".input").find($("input[type=radio]")[i-1]).prop("value"));
// 		 						var rateVal = $(".input").find($("input[type=radio]")[i-1]);
// 		 						rateVal.prop("checked","checked");
// 		 						$("#starResult").text("내가 준 평가 : "+rateVal.prop("value")+"점");
// 		 					}
// 		 				}
// 		 				alert("비었다아");
// 		 				$("#replyForm").text("");
// 		 				$("#replyForm").append(replyform);
// 		 			}else{
// 		 				$("#replyForm").text("");
// 		 			}	
// 			},
// 			error: function(request,error){
// 				alert("서버통신실패!!"+request.status+","+error);
// 			}
			
// 		});
					
		
		//만약에 평점이 이미등록되어있다면 ~updaterate
		//등록되어있지않다면 addrate
// 		if()
// 		 $(document).on("click","div #btn-comment",function(){})
// 		$("#keySearch").click(function search() {
// 		$("body").on("click",".star-input",function() {
		$("body").on("click",".star-input input",function() {
			var rateVal=$("input:radio[name=star-input]:checked").val();//체크받은 별점값
			var idVal=$("#idVal").text();//id값
			var titleVal=$("#titleVal").text();//영화제목 값
			var directorVal=$("#directorVal").text();//영화감독 값
// 			alert(rateVal);
			
			if(rateVal==null){
// 				alert("오류: 다시클릭합니다");
			}
			
// 			alert(titleVal);
// 			alert(rateVal);
// 			alert($("input:radio[name=star-input]:checked").val());
// 			alert($(".input").text());
// 			$("#starResult").text("평점등록완료 : "+rateVal+"점");
// 			alert("왜 두번 실행되나");
			$.ajax({
				url:"MReplyController.do",
				method:"post",
				datatype:"text",
				async:false,
				data:{"command":"addRate","rate":rateVal,"id":idVal,"title":titleVal,"director":directorVal},
				success:function(data){
					$("#starResult").text("평점등록완료 : "+rateVal+"점");
// 					alert("서버통신성공?");
// 					$("#result").append("<div id='div1'>"+replyform+"</div>");
				},
				error: function(request,error){
					alert("서버통신실패!!"+request.status+","+error);
				}
				
			});
// 			$("body").find($("#rate")).text(rateVal);
		});

		
	
	
</script>

<style type="text/css">
 #replyForm{display:none};
/*  #detailInfo{display:none}; */
</style>
</head>
<%

%>
<body>

<%-- 
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
 --%>
 
<!-- <form action="MReplyController.do" method="post">
<input type="hidden" name="command" value="addComment">
<input type="hidden" name="director" value="a">
<input type="hidden" name="title" value="b")>
	<table class="table table-striped">
		<tr>
			<th>test님의 코멘트</th>
			<td><textarea rows="3" cols="60" name="content" required="required"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" class="btn btn-success" value="글등록"></td>
		</tr>
	</table>
</form> -->

<br>


<div id ="result">
	<h1></h1>
</div>
<div id="detailInfo"></div>
<div id="rate"></div>
<div id='starResult'></div>
<div id='commbutton'></div>
<div id='replyForm'>
<!--
	조건
	1.현재 페이지가 상세페이지 일 때()
	2.해당 영화에 평점이 있을 때(where : id, title, director 에 해당하는 db가 있을 때)
	
 -->
	
</div>

</body>
</html>
