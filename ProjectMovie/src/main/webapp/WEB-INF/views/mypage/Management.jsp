<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	$("#user_id").click(function(e) {
		console.log(e)
	})
})

</script>




<br>
<br>
<br>
<br>
<section class="page-section bg-light" >
<div class="container">
	<div class="contact-head">
		<div class="row">
			<%@ include file="../include/menu_side_bar_mypage.jsp"%>
			<div class="col-lg-8 col-12">

				<div class="form-main">
					<div class="title">
						<div class="jumbotron"
							style="background-color: rgba(0, 255, 255, 0.8)">
							<h4>My 정보관리</h4>
							<h3>회원 정보 관리</h3>
						</div>
					</div>
					<form class="form" method="post" action="/mypage/modify">
						<div class="row">
							<div class="form-group">

								<label for="exampleInputFile"> 사진 </label> <input type="file"
									class="form-control-file" id="file" name="file" />
							</div>

							<div class="col-12">
								<div class="form-group">
									<label for="user_id">아이디:<span></span></label> <input
										name="user_id" id="user_id" type="text"
										value="${memberVo.user_id}">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<label for="user_pw">패스워드:<span></span></label> <input
										name="user_pw" id="user_pw" type="text">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<label for="user_name">이름:<span></span></label> <input
										name="user_name" id="user_name" type="text"
										value="${memberVo.user_name}">
								</div>
							</div>

							<div class="col-12">
								<div class="form-group">
									<label for="user_email">이메일:<span>${memberVo.user_email}</span></label>
									<input name="user_email" id="user_email" type="email">
								</div>
							</div>

							<div class="col-12">
								<div class="form-group">
									<label for="user_point">포인트:<span>*</span></label> <input
										name="user_point" id="user_point" type="text" value="">
								</div>
							</div>


							<div class="col-12" style="margin-top: 20px;">
								<div class="form-group button">
									<a href="/mypage/modify" class="btn" style="color: #fff;">회원
										정보수정</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>

<br>
<br>
<br>

</section>
<%@ include file="../include/footer.jsp"%>
