<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function(){
	
// 	$("#frmMyPage").submit(function() {
// 		var user_id = $("#user_id");
// 		console.log(user_id);
// 		return false; // 폼전송막기
// 	});
	
});
</script>
<%-- ${memberVo} --%>
<!-- 모달창 -->
<div class="row">
	<div class="col-md-12">
		 
		
		 <div class="modal fade" id="modal-container-284734" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							비밀번호 변경
						</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<h5>새비밀번호</h5>
						<input type="text" class="form-control c_content"/>
						<br>
						<h5>비밀번호 확인</h5>
						<input type="text" class="form-control c_content"/>
					</div>
					<div class="modal-footer">
						 
						<button type="button" class="btn btn-primary"
							id="btnModalOk">
							변경완료
						</button> 
						<button type="button" class="btn btn-secondary" data-dismiss="modal"
							id="btnModalClose">
							닫기
						</button>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
</div>

<!-- // 모달창 -->
<br>
<br>
<br>
<section class="page-section bg-light">
	<input type='hidden' name='memberVo' value="" />

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

						<form class="form" method="post" id="frmMyPage">
							<div class="row">
								<div class="form-group">

									<label for="exampleInputFile"> 사진 </label>* <input type="file"
										class="form-control-file" id="file" name="file" />
								</div>

								<div class="col-12">
									<div class="form-group">
										<label for="user_id">아이디:<span>*</span></label> <input
											name="user_id" id="user_id" type="text"
											value="${memberVo.user_id }" readonly>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group">
										<label for="user_pw">패스워드:<span>*</span></label> <a
											id="user_pw" href="#modal-container-284734" role="button"
											class="btn btn-primary" data-toggle="modal">변경 하기</a>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group">
										<label for="user_name">이름:<span>*</span></label> <input
											name="user_name" id="user_name" type="text"
											value="${memberVo.user_name }" readonly>
									</div>
								</div>

								<div class="col-12">
									<div class="form-group">
										<label for="user_email">이메일:<span>*</span></label> <input
											name="user_email" id="user_email" type="email"
											value="${memberVo.user_email }" readonly>
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
										<a href="#" class="btn btn-primary" style="color: blue;">회원
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
