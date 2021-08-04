<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<title>로그인 페이지</title>
<script>
$(document).ready(function(){
	var msg = "${msgdelete}";
	if (msg == "success") {
		alert("회원탈퇴가 완료되었습니다.");
	}
	
	var msgInsertMember = "${msgInsertMember}";
	if(msgInsertMember == "success"){
		alert("회원가입 성공");
		session.removeAttribute("${msgInsertMember}");
	}
	var msgLoginMember = "${msgLoginMember}";
	if(msgLoginMember == "fail"){
		alert("로그인 실패하였습니다.");
		session.removeAttribute("${msgLoginMember}");
	}
});
</script>
<div class="container" style="background-image: url('.././resources/images/cinemaFront.jpg'); background-repeat : no-repeat; background-size : cover;">
<br>
<br>
<br>
<br>
<br>
<br>
	<div class="row align-items-center">
	<br>
		<div class="col-lg-3"></div>
		<div class="col-lg-6 my-3 my-lg-0" style="background-color:rgba(0, 255, 255, 0.5)">
		<br>
			<div class="jumbotron" style="background-color:rgba(0, 255, 255, 0.8)" >
				<h2>로그인 페이지입니다</h2>
				<p>아이디가 있으시면 입력을, <br>없으시면 회원가입을 눌러주세요</p>
			</div>
			<form role="form" action="/board/loginRun" method="post">
				<div class="form-group">
					<label for="user_id"> 아이디 </label> 
					<input type="text" class="form-control" id="user_id" name="user_id"/>
				</div>
				<div class="form-group">
					<label for="user_pw"> 패스워드 </label> 
					<input type="password" class="form-control" id="user_pw" name="user_pw"/>
				</div>
				<button type="submit" class="btn btn-primary">로그인</button>
				<a class="btn btn-primary btn-large" href="/board/registForm">회원가입</a>
			</form>
			<br>
		</div>	
		<div class="col-lg-3"></div>
	</div>
<br>
<br>
<br>
<br>
<br>
<br>
</div>
<%@ include file="../include/footer.jsp"%>