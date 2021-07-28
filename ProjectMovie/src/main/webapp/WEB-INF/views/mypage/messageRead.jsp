<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	$("#btnReplyOk").click(function() {
		// 쪽지 내용
		var msg_content = $("#msg_content").val();
		// 받는 사람
		var msg_receiver = "${noticeMessageVo.msg_sender}";
		var sendData = {
				"msg_content"  : msg_content,
				"msg_receiver" : msg_receiver
		};
		console.log(sendData);
		var url = "/noticeMessage/sendMessage";
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
					alert("답장완료.");
					location.href = "/noticeMessage/messageList";
				}
				
			}
		});
	}); 
});
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
<!-- 쪽지 답장 모달 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="modal-container-552199" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">답장하기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" name="msg_content" id="msg_content"
							class="form-control"/>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-primary"
							id="btnReplyOk">
						답장완료
						</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal"
							id="btnClose">닫기</button>
					</div>
				</div>

			</div>

		</div>

	</div>
</div>
<!-- // 쪽지 답장 모달 -->						
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<table class="table table-striped">
										
										<tbody>
											<tr>
												<th>NO.</th>
												<td>${noticeMessageVo.msg_no}</td>
											</tr>
											<tr>
												<th>쪽지내용</th>
												<td>${noticeMessageVo.msg_content}</td>
											</tr>
											<tr>
												<th>
												<c:choose>
												<c:when test="${noticeMessageVo.msg_receiver == user_id && noticeMessageVo.msg_sender != user_id}">보낸사람</c:when>
												<c:when test="${noticeMessageVo.msg_sender == user_id && noticeMessageVo.msg_receiver != user_id}">받는사람</c:when>
												<c:otherwise>나에게</c:otherwise>
												</c:choose>
												</th>
												
												<td>
												<c:choose>
												<c:when test="${noticeMessageVo.msg_receiver == user_id && noticeMessageVo.msg_sender != user_id}">${noticeMessageVo.msg_sender}</c:when>
												<c:when test="${noticeMessageVo.msg_sender == user_id && noticeMessageVo.msg_receiver != user_id}">${noticeMessageVo.msg_receiver}</c:when>
												<c:otherwise>${noticeMessageVo.msg_receiver}</c:otherwise>
												</c:choose>
												</td>
												
											</tr>
											<tr>
												<th>보낸날짜</th>
												<td>${noticeMessageVo.msg_senddate}</td>
											</tr>
											<tr>
												<th>읽은날짜</th>
												<td>${noticeMessageVo.msg_opendate}</td>
											</tr>
											
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<a class="btn btn-success"
										href="/noticeMessage/messageList">받은쪽지함</a>
									<a href="#modal-container-552199"
										class="btn btn-primary"
										data-toggle="modal">답장</a>
									<a class="btn btn-danger"
										href="/noticeMessage/deleteMessage?msg_no=${noticeMessageVo.msg_no}">삭제</a>
									
								</div>
							</div>
						</div>
						
					</div>
				</div>

			</div>
		</div>
	</div>

	<br> <br> <br>

</section>
<%@ include file="../include/footer.jsp"%>