<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	$("#submit").on("click", function(){
		if($("#user_pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#user_pw").focus();
			return false;
		}	
	});
})
</script>
<br>
<br>
<br>
<br>
<br>
<div class="container">
		<div class="contact-head">
			<div class="row">
				<%@ include file="../include/menu_side_bar_mypage.jsp"%>
				<div class="col-lg-8 col-12">

					<div class="form-main">
						<div class="title">
							<div class="jumbotron" style="background-color: black;">
								<h4 style="color: white;">My 정보관리</h4>
								<h3 style="color: white;">회원 탈퇴</h3>

							</div>
						</div>

						<form class="form" method="post" id="frmMyPage" action="/mypage/memberDelete">														
								<div class="col-12">
									<div class="form-group">
										<label for="user_id">아이디:<span></span></label> <input
											name="user_id" id="user_id" type="text"
											value="${loginVo.user_id}" class="form-control" readonly>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group">
										<label for="user_pw">비밀번호:<span></span></label> 
										<input name="user_pw" id="user_pw" type="password" class="form-control">
									</div>
								</div>
								<div>
									<c:if test="${msg==false }">
									비밀번호가 일치 하지 안습니다.
									</c:if>
								</div>
								
								<div class="col-12" style="margin-top: 20px;">
									<div class="form-group button">
										<input type="submit" class="btn btn-primary" id="submit"
											 value="회원 탈퇴">
										
											<input type="button" class="btn btn-primary"
												id="btn_modifyOk"  value="취소">
										


									</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp"%>