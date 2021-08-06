<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	$("#btn_main").click(function() {
		location.href = "/mypage/message";
	});
	$("#btn_send").click(function() {
		var that = $(this);

		var msg_content = $("#msg_content").val();
		var msg_sender = $("#msg_sender").val();
		var sendData = {
				"msg_sender" : msg_sender,
				"msg_content" : msg_content
		};
		console.log(sendData);
		if(msg_sender == ""){
			alert("아이디을 입력해주세요");
		};
		var url = "/mypage/sendMessage";
		$.ajax({
			"url" : url,
			"method" : "post",
			"dataType" : "text",
			"headers" : {
				"Content-Type" : "application/json"
			},
			"data" : JSON.stringify(sendData),
			"success" : function(receivedData) {
				console.log(receivedData);
				if (receivedData == "success") {
					$("#btn_main").click();
				}else{
					alert("아이디가 존재하지 안습니다.")
				}
			}
			
		});
		
	});
});
</script>

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
								style="background-color:black; font:lighter;">
								<h2 style="color: white;">쪽지 관리</h2>
								

							</div>
						</div>

						<form class="form" method="post" id="frmMyPage">
				
							<div class="row"  id="modifyForm">
								
								<div class="col-12">
									<div class="form-group">
										<label for="msg_sender">아이디:<span></span></label> <input
											name="msg_sender" id="msg_sender" type="text"
											value="" class="form-control" >
									</div>
								</div>
							
								
								
								<div class="col-12">
									<div class="form-group">
										<label for="msg_content">내용:<span></span></label> 
										<textarea class="form-control" id="msg_content" name="msg_content" ></textarea>
											
									</div>
								</div>

								


								<div class="col-12" style="margin-top: 20px;">
						
								<div class="form-group button" >
										<input type="button" class="btn btn-primary" id="btn_send"  value="보내기">
															
										<input type="button" class="btn btn-primary" id="btn_main"  value="목록">									
									
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