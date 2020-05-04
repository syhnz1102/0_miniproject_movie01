<%@include file="header.jsp" %>
<%@include file="header_searchBar.jsp" %>
<%@include file="test02_star.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function gg() {
// 		$("#com").submit();
		
 		var comdata=$("#com").serialize();//form안의 값을 시리얼라이즈
// 		var $("com").
 		$.ajax({
			url:"MReplyController.do",
			method:"post",
			datatype:"text",
			async:false,
			data:comdata,
			success:function(data) {
// 				alert("댓글등록성공");
				$("#replyForm").css("display","none");
				$("#commbutton").css("display","none");
				$("#mycomment").css("display","block");
				
				//컨트롤러에서 id, comm도 가져오기? ㄴㄴ 방금쓴걸 넣어주기
				
				$("#myid").text($("#idVal").text());
				$("#mycomm").text($("textarea").val());
				for (var i = 1; i < 6; i++) {
// 					var mr = $(".input").find($("input[type=radio]")[i-1]);
				}
				//commbutton코멘트버튼 숨기고
				//replyForm숨기고
				//mycomment보이고
				
				//그리고 깜박한게 몇번째까지 보여줄지를 정하는거 그거 없애고 table반복생성구간 바꿔서 아예 테이블 자체에 적용
				
			},error:function(request,error){
				alert("서버통신실패!!"+request.status+","+error);
			}
			
		}); 
		
	}

	function comm() {
			$("#replyForm").toggle();
	}

	$(function () {//page가오픈되면실행
		if($("#login").text()=="로그인"){
			$(".star-input").css("display","none");
			$("#starResult").css("display","none");
		}
		
		//정보가 뿌려진 상세페이지 내에서 정보들을 다시 추출해오기
		var mid= $("#idVal").text();
		var mtitle= $("#mtitle").text();
		var mdirector= $("#mdirector").text();
		var mpubdate= $("#mpubdate").text();
		var mnaverrate= $("#mnaverrate").text();
		var msubtitle= $("#msubtitle").text();
		var mactor= $("#mactor").text();
		var mlink= $("#mlink").attr("href");
		var mimg= $("#mimg").attr("src");
// 		alert(mid);
// 		alert(mtitle);
// 		alert(mdirector);
// 		alert(mpubdate);
// 		alert(mnaverrate);
// 		alert(msubtitle);
// 		alert(mactor);
// 		alert(mlink);
// 		alert(mimg);
		
		//★★★기존에 평점을 매겼으면 별점과 코멘트버튼 표시
		//(##################추가할것:코멘트도 이미 있으면 표시안함(얘는 rate받아올때 comment도 같이 받아오면 되고)
		
		//코멘트 추가시 동시에
		//바로 밑에 코멘트 추가되고
		//-코멘트쓰기 버튼 사라짐
		//-코멘트폼까지 사라짐
		//(후자는 디스패치로하면 쉽다.)
		
		//하지만 위에거 다 ajax로 쿼리도 손안대고 했다. 애초에 쿼리를 잘짜면 이런거하면서 시간낭비할 일 없으니 계획세울때 꼼꼼히 생각하자.
		
		//시도 1 : 수정버튼이 있으면 코멘트버튼은 안보이게하기 완료
		//코멘트 추가 후 바로 밑에 추가되기
		$.ajax({
			url:"MReplyController.do",
			method:"post",
			dataType:"json",
			async:false,
			data:{"command":"getReply","mtitle":mtitle,"mdirector":mdirector,"mid":mid},
			success:function(data){
				rate=data;
				if(rate!=false){//rate안에 값이 있으면 그값과 같은 순서의 radio를 체크후 #starResult의 text값을 바꾼다
					for (var i = 1; i < 6; i++) {
						if(i==rate){//만약 rate가 2일 때 i가 2가 되면 밑에가 실행됨 - 밑에는 0,1,2번째 즉 3번째의 값이 나오므로 -1해줌
//								alert($(".input").find($("input[type=radio]")[i-1]).prop("value"));
							var rateValue = $(".input").find($("input[type=radio]")[i-1]);
							rateValue.prop("checked","checked");
							$("#starResult").text("내가 준 평가 : "+rateValue.prop("value")+"점");
//		 					alert("rateValue:"+rateValue);
						}
 						//평점은 등록되어있고 수정버튼도 있으면 숨긴다
						if($("#commUpdate").text()=="수정"){
							$("#commbutton").css("display","none");
						}
						//평점이 등록되어있고 코멘트는 없으면 수정버튼을 숨기지않는다
					}
				
					//이건그냥 온로드
					$("#starResult").text("내가 준 평점 : "+rate+"점");
					$("#commbutton").text("");
// 					alert($("#commUpdate").text());
					
					if($("#commUpdate").text()!="수정"){
					 	$("#commbutton").append("<button id='comm' onclick='comm()'>코멘트쓰기</button>");
					}

//						$("#commbutton").show();
//						$("#comm").attr("display","block");
//						$("#replyForm").text("");//rate안에 값이 있으면 코멘트폼을 보여준다
//						$("#replyForm").append(replyform);
					
//						<span class="star-input">
					// 							<span class="input">
					// 						    	<input type="radio" name="star-input" value="1" id="p1">
				// 		//밑에 변수 star를 append 한 후 거기에 있는 input 속성 안에 rate를 대입시키자
				}else{
					$("#starResult").text("평점을 등록해주세요!");
					$("#commbutton").text("");
//						$("#replyForm").text("");//rate안에 값이 없으면 코멘트란을 비운다.
				}
			},
			error: function(request,error){
				alert("서버통신실패!!"+request.status+","+error);
			}
		});//ajax끝
		
		//★★★별점클릭시 별점등록
		$("body").on("click",".star-input input",function() {
			var rateVal=$("input:radio[name=star-input]:checked").val();//체크받은 별점값
// 			var idVal=$("#idVal").text();//id값
// 			var titleVal=$("#titleVal").text();//영화제목 값
// 			var directorVal=$("#directorVal").text();//영화감독 값
// 			alert(rateVal);
				
			$.ajax({
				url:"MReplyController.do",
				method:"post",
				datatype:"text",
				async:false,
				data:{"command":"addRate","rate":rateVal,"mid":mid,"mtitle":mtitle,
					"mdirector":mdirector,"mpubdate":mpubdate,"mnaverrate":mnaverrate,
					"msubtitle":msubtitle,"mactor":mactor,"mlink":mlink,
					"mimg":mimg},
// 					var mpubdate= $("#mpubdate").text();
// 					var mnaverrate= $("#mnaverrate").text();
// 					var msubtitle= $("#msubtitle").text();
// 					var mactor= $("#mactor").text();
// 					var mlink= $("#mlink").attr("href");
// 					var mimg= $("#mimg").attr("src");
				success:function(data){
					$("#starResult").text("평점을 "+rateVal+"점 으로 등록했어요!");
					$("#commbutton").text("");
				 	$("#commbutton").append("<button id='comm' onclick='comm()'>코멘트쓰기</button>");
// 					alert("서버통신성공?");
// 					$("#result").append("<div id='div1'>"+replyform+"</div>");
				},
				error: function(request,error){
					alert("서버통신실패!!"+request.status+","+error);
				}
				
			});//ajax끝
// 			$("body").find($("#rate")).text(rateVal);
		});//별점등록끝
		
		//코멘트 글자수 제한
		$("textarea").keyup(function () {
			var content=$(this).val();
			$('#counter').html("("+content.length+" / 최대 500자)"); 
			
			if(content.length>500){
				alert("500자 까지만 입력해 주세요.");
				$(this).val(content.substring(0,500));
				$("#counter").html("(500/ 최대 500자)");
			}
		});
		
		//코멘트가 두줄보다 많으면 (43px보다 높이가 커지면) 더보기버튼 보이게 
		$(".comms").each(function(){
			if($(this).find($(".realComms")).outerHeight() > 43){
				$(this).next().show();
			}

		});
		
		//더보기버튼 누르면 보이고 한번 더 누르면 안보이게
		$(".morebtn").click(function(){
			if($(this).prev().outerHeight() < 64){
				$(this).prev().addClass("showmore");
			}else{
				$(this).prev().removeClass("showmore");
			}
		});
	});
		 
</script>
<style type="text/css">
 	#replyForm{display:none}
 	#mycomment{display:none}
 	.comms{width:585px; height:63px; overflow:hidden; margin: 10px 10px;}
 	.morebtn{display:none; float:right}
 	.showmore{overflow:visible;height:auto;}
/*  	#mycomm{width:400px;} */
/*  	#mycomment td:nth-child(1){width:400px;} */
/* 	.liner{overflow:hidden;} */
</style>
</head>
<body>
<%-- ${arr[0]} : 제목--%>
<%-- ${arr[1]} : 아이디 --%>
<%-- ${arr[2]} : 감독--%>
<%-- ${arr[3]} : 제작연도--%>
<%-- ${arr[4]} : 네이버평점 --%>
<%-- ${arr[5]} : 영문제목--%>
<%-- ${arr[6]} : 출연진--%>
<%-- ${arr[7]} : 링크--%>
<%-- ${arr[8]} : 이미지--%>
<div>
	<a href="NaverMController.do?command=movieListR&movieNm=${mkeyword}">목록으로</a>
	<a href="user_main.jsp">메인</a>
	<div><img id="mimg" src="${arr[8]}"></div>
	<div><span id="mtitle">${arr[0]}</span>(<span id="mpubdate">${arr[3]}</span>)</div>
	<div id="msubtitle">${arr[5]}</div>
	<br>
	<span class="star-input">
		<span class="input">
			<input type="radio" name="star-input" value="1" id="p1">
			<label for="p1">1</label>
			<input type="radio" name="star-input" value="2" id="p2">
			<label for="p2">2</label>
			<input type="radio" name="star-input" value="3" id="p3">
			<label for="p3">3</label>
			<input type="radio" name="star-input" value="4" id="p4">
			<label for="p4">4</label>
			<input type="radio" name="star-input" value="5" id="p5">
			<label for="p5">5</label>
		</span>
	</span>
	<div id='starResult'></div>
	<div id='commbutton'></div>
	

	
	<br>
<%-- 	<div>네이버평점 : <span id="mnaverrate">${arr[4]}</span></div> --%>
	<div>감독 : <span id="mdirector">${arr[2]}</span></div>
	<div>출연진 : <span id="mactor">${arr[6]}</span></div>
	<div><a id="mlink" href="${arr[7]}">네이버링크 바로가기@</a></div>
<%-- 	<div>${arr[8]}</div> --%>
	
	<div id='replyForm'>
		<form id="com" action="MReplyController.do" method="post">
		<input type="hidden" name="command" value="addComment">
		<input type="hidden" name="id" value="${sessionScope.ldto.m_id}">
		<input type="hidden" name="director" value="${arr[2]}">
		<input type="hidden" name="title" value="${arr[0]}">
			<table class="table table-striped">
			<tr>
				<td>
					<b>${sessionScope.ldto.m_id}</b>님의 코멘트 :
				</td>
				<td>
					<textarea rows="3" cols="60" name="content" placeholder="자유롭게 코멘트를 입력하세요!" required="required"></textarea>
					<span id="counter">(0 / 최대 500자)</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" class="btn btn-success" value="글등록" onclick="gg()">
				</td>
			</tr>
			</table>
		</form>
	</div>
</div>

<%-- <c:forEach var="i" begin="0" end="${list.size()-1}" step="1"> --%>
<div id="mycomment">
<%-- 	<c:forEach var="i" begin="0" end="${list.size()}" step="1"> --%>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${list[i].m_id eq sessionScope.ldto.m_id}"> --%>
				<table table table-striped">
					<col width="100px">
					<col width="450px">
					<col width="50px">
					<col width="50px">
					<tr>
						<td>
							<b id="myid"></b>	
						</td>
						<td>
<!-- 							<span id="myrate"> -->
<%-- 								<c:forEach begin="1" end="1" step="1">★</c:forEach><c:forEach begin="1" end="1" step="1">☆</c:forEach> --%>
<!-- 							&emsp;&emsp; -->
<!-- 							</span> -->
							<span id="mycomm"></span>
						</td>
						<c:choose>
							<c:when test="${list[i].m_id eq sessionScope.ldto.m_id}">
								<td>
									<button id="commUpdate">수정</button>
								</td>
								<td>
									<button>삭제</button>
								</td>
							</c:when>
						</c:choose>
					</tr>
				</table>
<%-- 			</c:when> --%>
<%-- 		</c:choose> --%>
<%-- 	</c:forEach> --%>
</div> 

<div id="comments">	
	<c:forEach var="i" begin="0" end="${list.size()}" step="1">
		<c:choose>
			<c:when test="${not empty list[i].m_comment}">
				<table class="table table-striped liner">
					<col width="100px">
					<col width="600px">
					<col width="50px">
					<col width="50px">
<!-- 					<col width="150px"> -->
					<tr>
						<td>
							<b>${list[i].m_id}</b>	
						</td>

						<td>
							<div class="comms">
								<div>
									<c:forEach begin="1" end="${list[i].m_rate}" step="1">★</c:forEach><c:forEach begin="1" end="${5-list[i].m_rate}" step="1">☆</c:forEach>
								&emsp;&emsp;
								</div>
								<div class="realComms">${list[i].m_comment}</div>
							</div>
							<button class="morebtn" type="button">더보기</button>
						</td>
					
						<c:choose>
							<c:when test="${list[i].m_id eq sessionScope.ldto.m_id}">
								<td>
								<button id="commUpdate">수정</button>
								</td>
								<td>
								<button>삭제</button>
								</td>
							</c:when>
							<c:otherwise>
							<td></td>
							<td></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
			</c:when>
		</c:choose>
	</c:forEach>
</div>
<br>
<br>
<br>
<br>
<br>

</body>
</html>