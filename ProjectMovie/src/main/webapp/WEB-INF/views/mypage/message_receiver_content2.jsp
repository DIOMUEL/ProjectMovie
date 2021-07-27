<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	$("#btn_main").click(function() {
		location.href = "/mypage/message";
	})
})
</script>
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
								style="background-color:black;">
								
								<h2 style="color: white;">쪽지 관리</h2>

							</div>
						</div>

						<form class="form" method="post" id="frmMyPage">
				
							<div class="row"  id="modifyForm">
								
								<div class="col-12">
									<div class="form-group">
										<label for="user_id">아이디:<span></span></label> <input
											name="user_id" id="user_id" type="text"
											value="${messageVo.msg_sender}" class="form-control" readonly>
									</div>
								</div>
							
								
								
								<div class="col-12">
									<div class="form-group">
										<label for="user_email">내용:<span></span></label> 
										<textarea class="form-control" readonly>${messageVo.msg_content}</textarea>
											
									</div>
								</div>

								


								<div class="col-12" style="margin-top: 20px;">
									<div class="form-group button">
										<input type="button" class="btn btn-primary" id="btn_main"  value="목록">				
										<a class="btn btn-danger" href="/mypage/deleteMessage?msg_no=${messageVo.msg_no}">삭제</a>
									
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