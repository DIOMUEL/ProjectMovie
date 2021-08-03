<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function(){
	
// 	// 쪽지보내기 링크
// 	$(".sendMessage").click(function(e) {
// 		e.preventDefault();
// 		if("${sessionScope.loginVo}" == ""){
// 			alert("로그인을 확인해주세요");
// 			location.href = "/board/loginPage";
// 		}else{
// 			var user_id = $(this).attr("data-user_id");
// 			$("#btnSendMessage").attr("data-msg_receiver", user_id);
// 		}
		
// 	});
	// 쪽지 모달 보내기 버튼
// 	$("#btnRport").click(function() {
// 		var that = $(this);
// 		var msg_content = $("#frmReport > input[name=flexRadioDefault]").val();
// 		var msg_receiver = ${user_id};
// 		var sendData = {
// 				"msg_receiver" : msg_receiver,
// 				"msg_content" : msg_content
// 		};
// 		console.log(sendData);
// 		var url = "/report/sendReport";

// 		$.ajax({
// 			"url" : url,
// 			"method" : "post",
// 			"dataType" : "text",
// 			"headers" : {
// 				"Content-Type" : "application/json"
// 			},
// 			"data" : JSON.stringify(sendData),
// 			"success" : function(receivedData) {
//				console.log(receivedData);
// 				if (receivedData == "success") {
// 					that.next().trigger("click");
					
// 				}
				
// 			}
// 		});
// 	});
	
// 	$("#btnRport").click(function(){
// 		var rpt_receiver = ${user_id};
// 		var rpt_content = $("#frmReport > input[name=flexRadioDefault]").val();
		
// 	});

});



</script>
<title>Insert title here</title>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<section class="page-section bg-light">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">

					<div class="jumbotron" style="background-color: black;">
						<h2 style="color: white;">신고하기</h2>
						<br>
					</div>

					<form id="frmReport" role="form"
						action="/report/sendReport" method="post">
						<label for="exampleFormControlInput1" class="form-label">[신고하기]</label>
<!-- 						<input type="text" class="form-control" id="b_title" -->
<!-- 							name="b_title" /> <label for="exampleFormControlTextarea1" -->
<!-- 							class="form-label">신고내용</label> -->
<!-- 						<textarea class="form-control" id="b_content" name="b_content" -->
<!-- 							rows="3"></textarea> -->
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="rpt_content" id="flexRadioDefault1" checked> <label
								class="form-check-label" for="flexRadioDefault1">
						스팸홍보/도배글입니다. </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="rpt_content" id="flexRadioDefault2">
							<label class="form-check-label" for="flexRadioDefault2">
								불법정보를 포함하고 있습니다. </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="rpt_content" id="flexRadioDefault3">
							<label class="form-check-label" for="flexRadioDefault2">	
							욕설/생명경시/혐오/차별적 표현입니다. </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="rpt_content" id="flexRadioDefault4">
							<label class="form-check-label" for="flexRadioDefault2">
								개인정보 노출 게시물입니다. </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="rpt_content" id="flexRadioDefault5">
							<label class="form-check-label" for="flexRadioDefault2">
								불쾌한 표현이 있습니다. </label>
						</div>
						<div>
							<button type="submit" class="btn btn-success" id="btnRport">신고하기</button>
						</div>
					</form>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</div>
</section>




<%@ include file="../include/footer.jsp"%>