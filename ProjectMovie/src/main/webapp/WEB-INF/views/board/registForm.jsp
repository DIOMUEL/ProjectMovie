<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>회원등록페이지</title>
<div class="container-fluid" style="background-image: url('.././resources/images/sittingPlace.jpg'); background-repeat : no-repeat; background-size : cover;">
<br>
<br>
<br>
<br>
<br>
<br>
	<div class="row align-items-center">
		<div class="col-md-3"></div>
		<div class="col-md-6" style="background-color:rgba(255,255,0,0.1)">
		<br>
			<div class="jumbotron" style="background-color:#B0FB6E">
				<h2>회원 가입 페이지입니다.</h2>
				<p>회원가입 페이지입니다. 요구하는 사항에 맞게 작성 후 <br> 회원가입버튼을 눌러주세요.</p>
			</div>
			<form role="form" method="post" action="/board/registRun">
				<div class="form-group">
					<label for="user_id" style="color:yellow"> 아이디 </label> 
					<button type="button" class="btn btn-primary">아이디 중복 확인</button>
					<input type="text" class="form-control" id="user_id" name="user_id"/>
				</div>
				<div class="form-group">
					<label for="user_pw" style="color:yellow"> 비밀번호 </label> 
					<input type="password" class="form-control" id="user_pw" name="user_pw"/>
				</div>
				<div class="form-group">
					<label for="user_name" style="color:yellow"> 이름 </label> 
					<input type="text" class="form-control" id="user_name" name="user_name"/>
				</div>
				<div class="form-group">
					<label for="user_rrn" style="color:yellow"> 주민번호 앞자리 </label> 
					<input type="number" class="form-control" id="user_rrn" name="user_rrn"/>
				</div>
				<div class="form-group">
					<label for="user_email" style="color:yellow"> 이메일 </label> 
					<input type="text" class="form-control" id="user_email" name="user_email"/>
				</div>
				
				<button type="submit" class="btn btn-primary">회원가입</button>
			</form>
			<br>
		</div>
		<div class="col-md-3"></div>
	</div>
<br>
<br>
<br>
</div>


<%@ include file="../include/footer.jsp" %>