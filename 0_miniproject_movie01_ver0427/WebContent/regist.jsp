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
// 	아작스아이디체크:
// 	클릭하면 입력창 안의 쓴 값을 컨트롤러로 가져가서 db안의 아이디 중에 해당 값이 있는지 확인 후
// 	불린값을 반환해서 아작스로 가져옴
	$(function(){
		$("#idChk").click(function idChk(){
			var id=$(this).prev().val();
			if(id!=""){
				$.ajax({
					url:"MUserController.do",
					data:{"command":"idchk","id":id},
					dataType:"text",
					method:"post",
					success:function(obj){
						$("#chked").text(obj);
						if($("#chked").text()=="중복된 아이디 입니다."){
							$("#ids").val("");
							$("#ids").focus();
							$("#chked").css({'color':'red'});
						}else{
							$("#ids").parent().parent().next().find("input").focus();
							$("#chked").css('color','#04B431');
						}
					}
				});
			}
		});
		//밑의 상태일 때 중복된 아이디값을 넣으면 중복된아이디입니다가 들어가는데 그게 들어가면 val이 ""로 바뀌고 ids에 포커스가 초기화되면서 ""값으로 ajax처리를 한다 -> 사용가능하다고 나옴
		//자동으로 ""값을 한번더 ajax 처리하는거만 없애보자
		$("#ids").blur(function(){
			var id=$(this).val();
			if($("#chked").text()=="사용가능한 아이디입니다."){
				if(id!=""){
					$.ajax({
						url:"MUserController.do",
						data:{"command":"idchk","id":id},
						dataType:"text",
						method:"post",
						success:function(obj){
							$("#chked").text(obj);
							if($("#chked").text()=="중복된 아이디 입니다."){
								$("#ids").val("");
	// 							$("#ids").focus();
								$("#chked").css({'color':'red'});
							}else{
								$("#ids").parent().parent().next().find("input").focus();
								$("#chked").css('color','#04B431');
							}
						}
					});
				}
			}
		});
	});
	//필수입력 사항입니다 뜰때 글자써넣으면 -중복체크해주세요 뜨게
	//사용가능한 아이디입니다 뜰때 아이디글자 바꾼 후 blur하면 다시한번 ajax처리되게ㅇㅋ
	
	//비밀번호 체크+유효값처리
	window.onload=function() {
		var pwInputs=document.querySelectorAll("input[type=password]");
		var pws=document.getElementsByClassName("pws");
		pwInputs[1].onblur=function(){
			if(pwInputs[0].value!=pwInputs[1].value){
				for (var i = 0; i < pwInputs.length; i++) {
					pws[i].innerHTML = '비밀번호가 일치하지 않습니다.';
					pws[i].style.color = 'red';
					pwInputs[i].value="";
// 					pwInputs[0].value="";
// 					pwInputs[1].value="";
				}
			}else{
				for (var i = 0; i < pwInputs.length; i++) {
					pws[i].innerHTML = '✓';
					pws[i].style.color = '#04B431';
				}
			}
		}
		pwInputs[0].onblur=function(){
			if(pwInputs[1].value!==""){
				for (var i = 0; i < pwInputs.length; i++) {
					pws[i].innerHTML = '비밀번호가 일치하지 않습니다.';
					pws[i].style.color = 'red';
					pwInputs[i].value="";
				}
			}
		}
		//아이디 중복체크 유효값처리
		var idInput=document.querySelectorAll("input[name=id]")[0];
		var chked=document.getElementById("chked");
		idInput.onblur=function(){
			
			if(idInput.value==""){
				chked.innerHTML = '필수입력 사항입니다.';
				chked.style.color = 'red';
			}

			if(chked.innerHTML==""){
				chked.innerHTML = '중복체크를 해주세요';
				chked.style.color = 'red';
			}
		}
		//클릭떼기전 중복체크라는 문구가 나옴
		//사용가능하다는 메세지가 나온 후 값을 바뀐후에도 중복여부 체크해줘야한다.
		var form=document.getElementsByTagName("form")[0];
		form.onsubmit=function(){
			if(chked.innerHTML=="중복된 아이디 입니다."){
				chked.innerHTML = '중복체크를 해주세요';
				chked.style.color = 'red';
				idInput.value = "";
				idInput.focus();
				return false;
			}
			
				
		}
	}
</script>
<style type="text/css">
	div{height:25px};
</style>
</head>
<body>
<h1>회원가입</h1>
<form action="MUserController.do">
	<input type="hidden" name="command" value="insertuser">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" id="ids" required="required"/>
			<button type="button" id="idChk">id중복체크</button> <!-- 얘는아작스로 -->
			<div id="chked"></div>
			</td>
			
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="password" required="required"/>
			<div class="pws"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="password" name="password2" required="required"/>
			<div class="pws"></div>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" required="required"/></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" required="required"/></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="phone" required="required"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="email" required="required"/></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="가입완료">
			<input type="button" value="메인" onclick="location.href='index.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>