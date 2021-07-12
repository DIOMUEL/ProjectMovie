<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<title>회원등록페이지</title>
<script>
	$(document).ready(function(){
		//
		$("#btnCheckDupId").click(function(){
			if($("#user_id").val().trim() == ""){
				$("#user_id").focus();
				alert("아이디를 입력해 주세요");
				return false;
			}
			var url = "/board/checkDupId";
			var user_id = $("#user_id").val();
			var sendData = {
					"user_id" : user_id
			};
			$.get(url, sendData, function(rData){
				console.log(rData);
				if(rData == "true"){
					$("#checkDupIdResult").text("이미 있는 아이디입니다.").css("color", "red");
				}else{
					$("#checkDupIdResult").text("사용가능한 아이디입니다.").css("color", "blue");
					$(".form-Read").attr("readonly", false);
					$("#btnCheckDupEmail").removeAttr("disabled");
				}
			});
		});
		$("#btnCheckDupEmail").click(function(){
			var date = $("#user_date").val();
			var dateControl = date.replace(/-/g,"");
			$("#user_rrn").val(dateControl);
			console.log(dateControl);
		});
			
		$("#frmRegist").submit(function(){
			if($("#user_id").val().trim() == ""){
				$("#user_id").focus();
				alert("아이디를 입력해 주세요");
				return false;
			}
			if($("#user_pw").val().trim() == ""){
				$("#user_pw").focus();
				alert("비밀번호를 입력해 주세요");
				return false;
			}
			if($("#user_name").val().trim() == ""){
				$("#user_name").focus();
				alert("이름을 입력해 주세요");
				return false;
			}
			if($("#user_rrn").val().trim() == ""){
				$("#user_date").focus();
				alert("생년월일을 입력해 주세요");
				return false;
			}
			if($("#user_email").val().trim() == ""){
				$("#user_email").focus();
				alert("이메일을 입력해 주세요");
				return false;
			}
			if($("#user_pw").val() != $("#user_pw2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#user_pw").focus();
				return false;
			}
		});
		$("#btnCheckDupEmail").click(function(){
			$("#checkCode").attr("style", "display:''")
			var to = $("#user_email").val();
			var uri = "/email/sendMail";
			var sendData ={
					"to" : to
			};
			$.get(uri, sendData, function(rData){
				//console.log("rData : "+rData);
				$("#collectCode").text(rData);
			});
		});
		$("#btnCheckDupCode").click(function(){
			var responseCode = $("#responseCode").val();
			var collectCode = $("#collectCode").val();
			if(responseCode == collectCode){
				alert("인증완료 되었습니다.");
				$("#btnRegistRun").removeAttr("disabled");
			}else if(responseCode != collectCode){
				alert("입력하신 코드가 다릅니다. 보안에 따라 다시 양식을 작성해 주세요.");
				location.href("/board/registForm");
			}
		});
	});
</script>
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
			<form id="frmRegist" role="form" method="post" action="/board/registRun">
				<div class="form-group">
					<label for="user_id" style="color:yellow"> 아이디 </label> 
					<button type="button" class="btn btn-primary" id="btnCheckDupId">아이디 중복 확인</button>
					<span id="checkDupIdResult"></span>
					<input type="text" class="form-control" id="user_id" name="user_id"/>
				</div>
				<div class="form-group">
					<label for="user_pw" style="color:yellow"> 비밀번호 </label> 
					<input type="password" class="form-control form-Read" id="user_pw" name="user_pw" readonly/>
				</div>
				<div class="form-group">
					<label for="user_pw2" style="color:yellow"> 비밀번호확인 </label> 
					<input type="password" class="form-control form-Read" id="user_pw2" readonly/>
				</div>
				<div class="form-group">
					<label for="user_name" style="color:yellow"> 이름 </label> 
					<input type="text" class="form-control form-Read" id="user_name" name="user_name" readonly/>
				</div>
				<div class="form-group">
					<label for="user_rrn" style="color:yellow"> 생년월일 </label> 
					<input type="date" class="form-control form-Read" id="user_date" readonly/>
					<input type="hidden" class="form-control" id="user_rrn" name="user_rrn"/>
				</div>
				<div class="form-group">
					<label for="user_email" style="color:yellow"> 이메일 </label> 
					<button type="button" class="btn btn-primary" id="btnCheckDupEmail" disabled="disabled">이메일 인증</button>
					<input type="text" class="form-control form-Read" id="user_email" name="user_email" readonly/>
				</div>
				<div class="form-group" style="display:none" id="checkCode">
					<input type="text" id="responseCode" class="form-control" placeholder="이메일 인증 코드 6자리 입력"/>
					<button type="button" class="btn btn-primary" id="btnCheckDupCode">확인</button>
					<span id="collectCode" style="hidden"></span>
				</div>
				
				<button type="submit" class="btn btn-primary" id="btnRegistRun" disabled="disabled">회원가입</button>
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