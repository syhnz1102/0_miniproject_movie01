<%@include file="header2.jsp" %>
<%@include file="header_searchBar.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {
		
		$('.carousel').each(function(i, element) {
			var car = "#carousel"+(i+1);
			
			$(car).find(".right").click(function () {
//	 			alert($('#carousel1').find(".movieBox").length);
					$(car).carousel('next');	
			});
			$(car).find(".left").click(function () {
				$(car).carousel('prev');	
			});
			
// 			if($(car).find(".movieBox").length<6){
// 				$(car).find(".right").removeAttr("data-slide");
// 				$(car).find(".left").removeAttr("data-slide");
// 			}
			
			//캐러셀 첫번째 슬라이드만 있을 때
			if($(car).find(".movieBox").length<9){
				$(car).find(".item").eq(0).siblings(".item").remove();
			}
			//캐러셀 두번째 슬라이드까지 있을 때
			if($(car).find(".movieBox").length<18){
				$(car).find(".item").eq(0).siblings(".item:last-child").remove();
			}
			
		})
		/* 
		//1
		$('#carousel1').find(".right").click(function () {
				$('#carousel1').carousel('next');	
		});
		$('#carousel1').find(".left").click(function () {
			$('#carousel1').carousel('prev');	
		});
		//2
		$('#carousel2').find(".right").click(function () {
			$('#carousel2').carousel('next');	
		});
		$('#carousel2').find(".left").click(function () {
			$('#carousel2').carousel('prev');	
		});
		.
		.
		
		*/
	});
</script>
<style type="text/css">

/* div{border:1px solid grey} */

.movieListBox{border: 1px solid green;}
.movieBox{border: 1px solid green;}
/* .titlebox{border: 1px solid blue;} */
/* .posterbox{border: 1px solid red;} */

.rateHeader{height:74px;width:100%;position: relative;}
/* .rateHeader{height:74px;width:1400px;position: relative;} */
	.movieRate{position:relative; width:200px;}
	.moremovie{position:absolute; top:25px; right: 0px}

 .carousel{width:100%; text-align: center;} /* 이렇게하면 반응형이 되어서 처리를 할게 많아짐 */
/* .carousel{width:1900px; text-align: center;} */
	.movieListBox{width:100%; height:300px; display: inline-block;overflow: hidden;}
		.movieBox{width:210px;height:300px;float:left; position:relative;}
		.movieBox:hover{cursor: pointer;}
			.posterbox{width:110px;height:auto;position: absolute; top:40px;}
				.img{margin: 0px 50px;}
			.titlebox{width:120px;height:auto;position: absolute; top: 220px;}
				.title{font-size:20px ;display:inline-block; width:180px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
	 			.title:hover{cursor: pointer;white-space:normal;} 
/* 	 			.title:hover{cursor: pointer;width:140px; display: inline; white-space:normal;}  */

.carousel-control {background-color: grey; width:50px;}

/* .a{width:1290px;display: inline-block;overflow: hidden;} */

</style>
</head>
<body>
<h2><span style="color:blue">${sessionScope.ldto.m_name} </span>님의 관람 영화 리스트</h2>
<a href="user_main.jsp">메인으로</a>

<c:choose>
		<%--만약 list안에 값이 없다면 --%>
		<c:when test="${empty list}">	
			<div>
				<h2>아직 평점을 등록한 영화가 없어요!</h2>
			</div>
		</c:when>
		<%--만약 list안에 값이 없다면 끝--%>
		
		
		<%--만약 i점 대의 list안에 값이 있다면 (뮤슨값이?)--%>
		<c:otherwise>	
			<c:forEach begin="1" end="5" step="1" var="i" varStatus="status"> 	<%-- 5개 점수별로 나누는 for문 --%>
				<div class="rateHeader">
	<%-- 				<div>${i}점 준 영화</div> --%>
					<div class="movieRate"><h2>${(status.end+1)-i}점 준 영화</h2></div>
					<div class="moremovie"><a href="">더보기</a></div>
				</div>
				
				
				<div id="carousel${i}" class="carousel slide" data-ride="carousel" data-interval="false">
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
				    <div class="item active">
				
						<!-- 1번돌때 해당되는 n점의 n과 영화평이 같으면 뿌려라!1 -->
						<div class="movieListBox">
							<c:forEach items="${list}" var="dto" varStatus="loopstatus" >
								<c:choose>
									<c:when test="${dto.m_rate eq (status.end+1)-i}"> <%--만약 해당 리스트 의 rate값이 1이면 표시하라 --%>
											
											<c:set var="count" value="${count + 1}" />
											<c:if test="${count<10}">
												<div class="movieBox">
													<div class="posterbox">
														<img class="img" src="${dto.m_img}">
														<c:if test='${dto.m_img eq null}'>
															<img class="img" src="img/noimg.png" style="width:110px">
														</c:if>
													</div>
													<div class="titlebox">
														<div class="title">${dto.m_title}</div> 
						<%-- 											${dto.m_rate}점 --%>	
													</div>
												</div>
											</c:if>
											
									</c:when>
								</c:choose>
							</c:forEach> <!-- n점 대의 값들을 뿌리라! 끝 -->
											<c:set var="count" value="0" />
						</div>
				      
				    </div>
				    
				    <div class="item">
				
						<!-- 1번돌때 해당되는 n점의 n과 영화평이 같으면 뿌려라! 2-->
						<div class="movieListBox">
							<c:forEach items="${list}" var="dto" varStatus="loopstatus">
								<c:choose>
									<c:when test="${dto.m_rate eq (status.end+1)-i}"> <%--만약 해당 리스트 의 rate값이 1이면 표시하라 --%>
										
										<c:set var="count" value="${count + 1}" />
										<c:if test="${count>9 && count<19}">
											<div class="movieBox">
												<div class="posterbox">
													<img class="img" src="${dto.m_img}">
													<c:if test='${dto.m_img eq null}'>
														<img class="img" src="img/noimg.png" style="width:110px">
													</c:if>
												</div>
												<div class="titlebox">
													<div class="title">${dto.m_title}</div> 
					<%-- 											${dto.m_rate}점 --%>	
												</div>
											</div>
										</c:if>
										
									</c:when>
								</c:choose>
							</c:forEach> <!-- n점 대의 값들을 뿌리라! 끝 -->
												<c:set var="count" value="0" />
						</div>
				      
				    </div>
				    
				    <div class="item">
				
						<!-- 1번돌때 해당되는 n점의 n과 영화평이 같으면 뿌려라! 3-->
						<div class="movieListBox">
							<c:forEach items="${list}" var="dto" varStatus="loopstatus">
								<c:choose>
									<c:when test="${dto.m_rate eq (status.end+1)-i}"> <%--만약 해당 리스트 의 rate값이 1이면 표시하라 --%>
										
										<c:set var="count" value="${count + 1}" />
										<c:if test="${count>18 && count<28}">
											<div class="movieBox">
												<div class="posterbox">
													<img class="img" src="${dto.m_img}">
													<c:if test='${dto.m_img eq null}'>
														<img class="img" src="img/noimg.png" style="width:110px">
													</c:if>
												</div>
												<div class="titlebox">
													<div class="title">${dto.m_title}</div> 
					<%-- 											${dto.m_rate}점 --%>	
												</div>
											</div>
										</c:if>
										
									</c:when>
								</c:choose>
							</c:forEach> <!-- n점 대의 값들을 뿌리라! 끝 -->
												<c:set var="count" value="0" />
						</div>
				      
				    </div>
				  </div>
				
				  <!-- Controls -->
				  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				
				
			</c:forEach><%-- 5개 점수별for문 끝 --%>
		</c:otherwise><%--만약 list안에 값이 없다면 끝--%>
	</c:choose>
	<br><br><br><br><br>
</body>
</html>