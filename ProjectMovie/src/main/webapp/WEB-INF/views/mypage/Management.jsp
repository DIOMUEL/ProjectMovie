<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
	$(document).ready(function() {

		$("#modifyForm").hide();
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("#btnModalOk").click(function() {
			// 비밀번호 입력란과 비밀번호 확인 입력란의 값이 같은지
			
			var pw_chack1 = $("#pw_chack1").val();
			var pw_chack2 = $("#pw_chack2").val();
			
			if (pw_chack1 == "" || pw_chack2 == "") {
				$("#alert-danger").hide();
				
				return false;
			} 
			else {
				// 두개의 비밀번호 값이 같지 않다면
				if (pw_chack1 != pw_chack2) {
					
					$("#alert-danger").show();	
					
					return false; // 서버(컨트롤러)로 전송하지 않고 funtion()을 중단
				} 
			}
			
			
			
			$("#btnModalClose").trigger("click");
			$("#btnManagement").trigger("click");
			
// 			return false;
			
			
			var url = "/mypage/ChangePw";
			var sendData = {
					"user_pw" : pw_chack1
			};
			console.log(sendData);
			
			$.post(url, sendData, function(receivedData){
				console.log(receivedData);
				if (receivedData == "success") {
					alert('비밀번호가 변경 되었습니다.');
				}
			});
			
// 			$.ajax({
// 				"url" : url,
// 				"headers" : {
// 					"Content-Type" : "application/json"
// 				},
// 				"method" : "post",
// 				"dataType" : "text",
// 				"data" : JSON.stringify(sendData),
// 				"success" : function(receivedData) {
// 					console.log(receivedData);
// 					if (receivedData == "success") {
// 						alert('비밀번호가 변경 되었습니다.');
// 					}
// 				}			
// 			});
			
			
		});
		
		$("#btn_pw_check").click(function() {
			var text_check = $("#text_pw_check").val();
			var user_pw = "${memberVo.user_pw}";
			if(text_check == user_pw ) {
				alert("비밀번호가 일치 합니다")
				$("#pw_check_from").hide();
				$("#modifyForm").show();
			}else if(text_check == ""){
				alert("비밀 번호을 입력해 주세요")
			}else{
				alert("비밀번호가 일치하지 안습니다.")
			}
		});

	});
</script>
<%-- ${memberVo} --%>
<!-- 모달창 -->
<a href="/mypage/Management" style="display: none" id="btnManagement"></a>
<div class="row">
	<div class="col-md-12">


		<div class="modal fade" id="modal-container-284734" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">비밀번호 변경</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">

						<h5>새비밀번호</h5>
						<input type="password" class="form-control c_content" id="pw_chack1"
							name="pw_chack1" /> <br>
						<h5>비밀번호 확인</h5>
						<input type="password" class="form-control" id="pw_chack2"
							name="pw_chack2" /> <br>
						
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
							않습니다</div>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-primary" id="btnModalOk">
							변경완료</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal" id="btnModalClose">닫기</button>
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
	<input type='hidden' name='memberVo' />

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
					<!-- 비밀 번호 확인 창 -->
						<div class="col-12" id="pw_check_from">
						
						<br>
						<br>
						<br>
							<div class="form-group">
							<p>
							비밀번호를 입력해 주세요
							</p>
								<label for="user_pw_check">비밀번호:</label>
								<input type="password" id="text_pw_check">
								<input type="button" id="btn_pw_check"value="비밀번호 확인">
							</div>
						</div>
					<!-- /비밀번호 확인 창 -->
							<div class="row"  id="modifyForm">
								<div class="form-group">

									<label for="exampleInputFile"> 사진 </label> <input type="file"
										class="form-control-file" id="file" name="file" />
								</div>

								<div class="col-12">
									<div class="form-group">
										<label for="user_id">아이디:<span></span></label> <input
											name="user_id" id="user_id" type="text"
											value="${memberVo.user_id }" readonly>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group">
										<label for="user_pw">비밀번호:<span></span></label> <a
											id="user_pw" href="#modal-container-284734" role="button"
											class="btn btn-primary" data-toggle="modal">변경 하기</a>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group">
										<label for="user_name">이름:<span></span></label> <input
											name="user_name" id="user_name" type="text"
											value="${memberVo.user_name }" readonly>
									</div>
								</div>

								<div class="col-12">
									<div class="form-group">
										<label for="user_email">이메일:<span></span></label> <input
											name="user_email" id="user_email" type="email"
											value="${memberVo.user_email }" readonly>
									</div>
								</div>

								<div class="col-12">
									<div class="form-group">
										<label for="user_point">포인트:<span></span></label> <input
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

	<br> <br> <br>

</section>
<%@ include file="../include/footer.jsp"%>
