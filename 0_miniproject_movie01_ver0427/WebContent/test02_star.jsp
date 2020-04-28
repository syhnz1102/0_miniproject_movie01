<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//star rating
//원본
// 	var starRating = function(){
// 	  var $star = $(".star-input"),
// 	      $result = $star.find("output>b");
// 	  $(document)
// 	    .on("focusin", ".star-input>.input", function(){
// 	    $(this).addClass("focus");
// 	  })
// 	    .on("focusout", ".star-input>.input", function(){
// 	    var $this = $(this);
// 	    setTimeout(function(){
// 	      if($this.find(":focus").length === 0){
// 	        $this.removeClass("focus");
// 	      }
// 	    }, 100);
// 	  })
// 	    .on("change", ".star-input :radio", function(){
// 	    $result.text($(this).next().text());
// 	  })
// 	    .on("mouseover", ".star-input label", function(){
// 	    $result.text($(this).text());
// 	  })
// 	    .on("mouseleave", ".star-input>.input", function(){
// 	    var $checked = $star.find(":checked");
// 	    if($checked.length === 0){
// 	      $result.text("0");
// 	    } else {
// 	      $result.text($checked.next().text());
// 	    }
// 	  });
// 	};
// 	$(function() {
// 		starRating();
// 	})
</script>
<style>
	/* star input없앤버전 */
	/* 
	.input,
	.input>label:hover,
	.input>input:focus+label,
	.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
	.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
	.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
	.input>input{position:absolute;width:1px;height:1px;opacity:0;}
	.input.focus{outline:1px dotted #ddd;}
	.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
	.input>label:hover,
	.input>input:focus+label,
	.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
	.input>label:hover~label{background-image: none;}
	.input>label[for="p1"]{width:30px;z-index:5;}
	.input>label[for="p2"]{width:60px;z-index:4;}
	.input>label[for="p3"]{width:90px;z-index:3;}
	.input>label[for="p4"]{width:120px;z-index:2;}
	.input>label[for="p5"]{width:150px;z-index:1;}
	output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
	   */
	   
	/* .input없앤버전  -- 얘만 다시 제대로 없애보고나서 안되면 선새임찬스!*/
	/* 
	.star-input,
	.star-input>label:hover,
	.star-input>input:focus+label,
	.star-input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
 	이거 숨김 -> .star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;} 
	.star-input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
	.star-input>input{position:absolute;width:1px;height:1px;opacity:0;}
 	.star-input.focus{outline:1px dotted #ddd;} 
	.star-input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
	.star-input>label:hover,
	.star-input>input:focus+label,
	.star-input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
	.star-input>label:hover~label{background-image: none;}
	.star-input>label[for="p1"]{width:30px;z-index:5;}
	.star-input>label[for="p2"]{width:60px;z-index:4;}
	.star-input>label[for="p3"]{width:90px;z-index:3;}
	.star-input>label[for="p4"]{width:120px;z-index:2;}
	.star-input>label[for="p5"]{width:150px;z-index:1;}
	.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
	    */
/* 	 원본 */

	.star-input>.input,
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
	.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;line-height:30px;}
/* 	.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;} */
	.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
	.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
	.star-input>.input.focus{outline:1px dotted #ddd;}
	.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
	.star-input>.input>label:hover~label{background-image: none;}
	.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
	.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
	.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
	.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
	.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
	.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
	   
/* 	 코멘트란 리드온리 설정 */
</style>
</head>
<body>
<!-- <span class="star-input"> -->
<!-- 	<span class="input"> -->
<!--     	<input type="radio" name="star-input" value="1" id="p1"> -->
<!--     	<label for="p1">1</label> -->
<!--     	<input type="radio" name="star-input" value="2" id="p2"> -->
<!--     	<label for="p2">2</label> -->
<!--     	<input type="radio" name="star-input" value="3" id="p3"> -->
<!--     	<label for="p3">3</label> -->
<!--     	<input type="radio" name="star-input" value="4" id="p4"> -->
<!--     	<label for="p4">4</label> -->
<!--     	<input type="radio" name="star-input" value="5" id="p5"> -->
<!--     	<label for="p5">5</label> -->
<!--   	</span> -->
<!--   	<output for="star-input"><b>0</b>점</output>						 -->
<!-- </span> -->
</body>
</html>