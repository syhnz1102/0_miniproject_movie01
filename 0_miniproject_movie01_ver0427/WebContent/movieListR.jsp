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
		
// 		alert($(".mimg").eq(0).attr("src"));
// 		alert($(".mimg").length);
		
		var movieNm = $("h1 > b").text();
		$("input[name=movieNm]").val(movieNm);
		
		var mimg=$(this).find(".mimg").attr("src");

// 		$("body").find($(".mimg")).forEach(function() {
// 			alert($(".mimg").eq(i).attr("src"));
// 		});
		
		
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
		
		
		//이미지눌렀을때 용 (연습)
		$("body").on("click",".mimg",function toDetail() {
			var mimg=		$(this).attr("src");
			var mtitle=		$(this).parent().find(".mtitle").text();
			
			var mid=		$("#idVal").text();
			var mdirector=	$(this).parent().find(".mdirector span").text();
			var mpubdate=	$(this).parent().find(".mpubdate span").text();
			var mrate=		$(this).parent().find(".mrate span").text();
			var msubtitle=	$(this).parent().find(".msubtitle").text();
			var mactor=		$(this).parent().find(".mactor span").text();
// 			var mlink=		$(this).parent().find(".link >a").attr("href");
			var mlink=		$(this).parent().find(".mlink >a").attr("href");
			
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
		
		//div눌렀을 때 용 (연습)
		$("body").on("click",".result",function toDetail() {
			var mimg=		$(this).find(".mimg").attr("src");
			if(mimg==""){
				alert("dd");
			}
			var mtitle=		$(this).find(".mtitle").text();
			
			var mid=		$("#idVal").text();
			var mdirector=	$(this).find(".mdirector span").text();
			var mpubdate=	$(this).find(".mpubdate span").text();
			var mrate=		$(this).find(".mrate span").text();
			var msubtitle=	$(this).find(".msubtitle").text();
			var mactor=		$(this).find(".mactor span").text();
// 			var mlink=		$(this).find(".link >a").attr("href");
			var mlink=		$(this).find(".mlink >a").attr("href");
			
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
/* div{border:1px solid grey}  */
/* #resultBox{border:1px solid red;} */
#resultBox{margin:0 auto;width:94%; overflow: auto;}
#searchInfo{overflow:visible;height:50px;line-height: 50px;}
#searchInfo > div:first-child{width:330px;float:right}

.detailInfo{display:none}
/* .result{text-align:center;width:280px;height:250px;float:left;margin-bottom: 50px;position: relative;} */
/* .result{text-align:center;width:160px;height:250px;float:left;margin-bottom: 50px;position: relative;} */
/* .mtitleBox{ width:250px;left:15px;bottom:20px;position: absolute;display: inline-block;} */
/* .mpubdate{width:140px;left:68px;bottom:0px;position: absolute;display: inline-block;} */

/* .mtitle:hover{cursor:pointer;} */

.result{padding:10px;text-align:center;width:154.2px;height:300px;float:left; position:relative;margin-bottom: 50px;}
		.mtitleBox{width:160px;height:auto;position: absolute; text-align: center; bottom:27px;left:6px;}
		.result:hover{cursor: pointer;background-color: grey;color: white;}
			.mtitle{font-size:20px ;display:inline-block; width:160px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
 			.result:hover > .mtitleBox >.mtitle{cursor: pointer;white-space:normal;width:160px;} 
			.mpubdate{position:absolute;bottom:0px;left:6px; font-size:20px ;display:inline-block; width:160px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
</style>
</head>
<body>
<c:choose>
	<c:when test="${movieNm==''}">
		<h2><b>검색어를 입력하세요-!</b></h2>
	</c:when>
	<c:otherwise>
		<h1>"<b>${movieNm}</b>" 검색결과</h1>
	</c:otherwise>
</c:choose>
<div>
	<div id ="resultBox">
	</div>
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