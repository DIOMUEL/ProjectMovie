<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<script src="/resources/js/my-script.js"></script>
<title>Insert title here</title>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<script>
$(document).ready(function(){
	
	//게시판목록
	$("#btnList").click(function() {
		location.href = "/board/noticeBoardPage?page=${pagingDto.page}&perPage=${pagingDto.perPage}&searchType=${pagingDto.searchType}&keyword=${pagingDto.keyword}";
	});
	
	//게시글수정
	$("#btnModify").click(function(){
// 		e.preventDefault();
// 		if("${sessionScope.loginVo}" == ""){
// 			alert("로그인을 확인해주세요");
// 			location.href = "/board/loginPage";
// 		}else{		
// 		}
		$("#btnModifyFinish").show(1000);
		$("[name^=b_]").prop("readonly", false);
	});	
	
	//게시글삭제
	$("#btnDelete").click(function(){
		alert("삭제하시겠습니까?");
		location.href = "/noticeBoard/noticeBoardDeleteRun?b_no=${noticeBoardVo.b_no}";
	});
	
	//댓글등록
	$("#btnCommentInsert").click(function() {
		var c_content = $("#c_content").val();
		if(c_content  == ""){
			alert("댓글을 입력해 주세요");
			return;
		}
		
		var b_no = parseInt("${noticeBoardVo.b_no}");
		var url = "/commentBoard/insertComment";
		var sendData = {
				"c_content" : c_content,
				"b_no"	    : b_no
		};
		
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post",
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(receivedData) {
				console.log(receivedData);
 				if (receivedData == "success") {
 					$("#btnCommentList").trigger("click");
 					$("#c_content").val("");
 				}
			}
		});
	});
	
	//댓글보기
	$("#btnCommentList").click(function() {
		var url = "/commentBoard/getCommentList/${noticeBoardVo.b_no}";
		
		$.get(url, function(receivedData) {
 			console.log(receivedData);
			var cloneTr;
			$("#commentTable > tbody > tr:gt(0)").remove();
			$.each(receivedData, function() {
				var cloneTr = $("#commentTable > tbody > tr:first").clone();
				var td = cloneTr.find("td");
				td.eq(0).text(this.c_no);
				td.eq(1).text(this.user_id);
				td.eq(2).text(changeDateString(this.c_regdate));
				td.eq(3).text(this.c_content);
				td.eq(4).find("button").attr("data-cno", this.c_no);
//  			td.eq(4).find("button").attr("comment-user_id", this.user_id);
				$("#commentTable > tbody").append(cloneTr);
				cloneTr.show("slow");
			});
			
		});
		
	});
	
	//댓글수정
	$("#commentTable").on("click", ".commentModify", function() {
		//모달창
		var c_no = $(this).parent().parent().parent().parent().parent().parent().find("td").eq(0).text();
		var c_content = $(this).parent().parent().parent().parent().parent().parent().find("td").eq(3).text();
//		console.log(c_content);
		$(".modal-body > .c_content").val(c_content);
		$("#btnModalOk").attr("data-cno", c_no);
		$("#modal-284734").trigger("click");
	});
	
	// 모달 수정완료 
	$("#btnModalOk").click(function() {
		var c_no = $(this).attr("data-cno");
		var c_content = $(".modal-body > .c_content").val();
		var url = "/commentBoard/updateComment";
		var sendData = {
				"c_no" : c_no,
				"c_content" : c_content
		};
		console.log(sendData);
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post",
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(receivedData) {
				console.log(receivedData);
				if (receivedData == "success") {
					$("#btnModalClose").trigger("click");
					$("#btnCommentList").trigger("click");
				}
			}
		});
	});
	
	// 댓글삭제 
	$("#commentTable").on("click", ".commentDelete", function() {
		var c_no = $(this).attr("data-cno");
		console.log(c_no);
		var url = "/commentBoard/deleteComment/" + c_no + "/${noticeBoardVo.b_no}";
		if (confirm("댓글을 삭제하시겠어요?")) {
			$.get(url, function(receivedData) {
				console.log(receivedData);
				if (receivedData == "success") {
					$("#btnCommentList").trigger("click");
				}
			});
		}
		
	});
	
	var isLike = "${likeMap.isLike}";
	if (isLike == "true") {
		$("#likeHeart").css("color", "green");
	}
	
	$("#likeHeart").click(function() {
		var that = $(this);
		console.log("click");
		var b_no = "${noticeBoardVo.b_no}";
		console.log(b_no);
		var sendData = {
				"b_no" : b_no
		}
		console.log(sendData);
		var url = "";
		if (isLike == "true") {
			url = "/like/sendLikeCancel";
		} else {
			url = "/like/sendLike";
		}
		
		$.get(url, sendData, function(rData) {
			console.log(rData);
			
			if (isLike == "true") {
				console.log("true");
				that.css("color", "gray");
				isLike = "false";
			} else {
				console.log("false");
				that.css("color", "green");
				isLike = "true";
			}
			
			$("#likeCount").text("[" + rData + "]");
				
			
		});
		
	});
	
	// 신고 링크
// 	$(".sendReport").click(function(e) {
// 		e.preventDefault();
// 		if("${sessionScope.loginVo}" == ""){
// 			alert("로그인을 확인해주세요");
// 			location.href = "/board/loginPage";
// 		}else{
// 			var user_id = $(this).attr("data-user_id");
// 			$("#btnSendReport").attr("data-rpt_receiver", user_id);
// 		}
// 	});
	
	//신고링크
	$("#commentTable").on("click", ".sendReport", function() {
		var user_id = $(this).parent().parent().parent().parent().parent().parent().find("td").eq(1).text();
		var c_no = $(this).parent().parent().parent().parent().parent().parent().find("td").eq(0).text();
		
// 		var user_id = $(this).attr("data-user_id");
		$("#btnSendReport").attr("data-rpt_receiver", user_id);
		$("#btnSendReport").attr("data-rpt_c_no", c_no);
	});
	
// 	$("#commentTable").on("click", "#dropdownMenuButton", function() {
// 		var user_id = $(this).parent().parent().parent().parent().parent().find("td").eq(1).text();
// 		$("#dropdownMenuButton").attr("comment-user_id", user_id);
// 	});
	
	// 신고하기 버튼
	$("#btnSendReport").click(function() {
		var that = $(this);
		var rpt_content = $("input[name=rpt_content]:checked").val();
//		var rpt_content = $("#rpt_content").val();
		var rpt_receiver = $(this).attr("data-rpt_receiver");
		var rpt_c_no = $(this).attr("data-rpt_c_no");
		var b_no = parseInt("${noticeBoardVo.b_no}");
		var sendData = {
				"rpt_receiver" : rpt_receiver,
				"rpt_content" : rpt_content,
				"rpt_c_no" : rpt_c_no,
				"b_no" : b_no
		};
		console.log(sendData);
		var url = "/report/sendReport";
		
		$.ajax({
			"url" : url,
			"method" : "post",
			"dataType" : "text",
			"headers" : {
				"Content-Type" : "application/json"
			},
			"data" : JSON.stringify(sendData),
			"success" : function(receivedData) {
//				console.log(receivedData);
				if (receivedData == "success") {
					that.next().trigger("click");
					$("#rpt_content").val("");
					
				}
				
			}
		});
	});
	
});
</script>
<!-- 모달창 -->
<div class="row">
	<div class="col-md-12">
		 <a style="display:none" id="modal-284734" href="#modal-container-284734" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
		 <div class="modal fade" id="modal-container-284734" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							댓글 수정
						</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control c_content"/>
					</div>
					<div class="modal-footer">
						 
						<button type="button" class="btn btn-primary"
							id="btnModalOk">
							수정완료
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

<!-- 신고 모달창 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="modal-container-105698" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">신고하기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
<!-- 						<input type="text" class="form-control" id="rpt_content"/> -->
						<form id="frmReport" role="form"
						action="/report/sendReport" method="post">
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="rpt_content" id="flexRadioDefault1" value="스팸홍보/도배글입니다." checked>
								<label class="form-check-label" for="flexRadioDefault1">
								스팸홍보/도배글입니다. </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="rpt_content" id="flexRadioDefault2" value="불법정보를 포함하고 있습니다.">
							<label class="form-check-label" for="flexRadioDefault2">
								불법정보를 포함하고 있습니다. </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="rpt_content" id="flexRadioDefault3" value="욕설/생명경시/혐오/차별적 표현입니다.">
							<label class="form-check-label" for="flexRadioDefault2">	
							욕설/생명경시/혐오/차별적 표현입니다. </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="rpt_content" id="flexRadioDefault4" value="개인정보 노출 게시물입니다.">
							<label class="form-check-label" for="flexRadioDefault2">
								개인정보 노출 게시물입니다. </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="rpt_content" id="flexRadioDefault5" value="불쾌한 표현이 있습니다.">
							<label class="form-check-label" for="flexRadioDefault2">
								불쾌한 표현이 있습니다. </label>
						</div>
					</form>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-primary"
							id="btnSendReport">신고하기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>

			</div>

		</div>

	</div>
</div>
<!-- // 신고 모달창 -->
<section class="page-section bg-light">
<div class="row">
	<div class="col-md-12">
		<div class="row">
		
			<div class="col-md-3"></div>
			<div class="col-md-6">

					<div class="jumbotron" style="background-color: black;">
						<h2 style="color: white;">게시판 관리</h2>
						<br>
					</div>

					<form role="form" action="/noticeBoard/noticeBoardModifyRun" method="post">
				<input type="hidden" name="user_id" value="${noticeBoardVo.user_id}" />
				<input type="hidden" name="b_no" value="${noticeBoardVo.b_no}" />
				<label for="exampleFormControlInput1" class="form-label">제목</label>
				<input type="text" class="form-control" id="b_title" name="b_title"
					value="${noticeBoardVo.b_title}" readonly/>
				<br>
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea class="form-control" id="b_content" name="b_content"
					rows="3" readonly>${noticeBoardVo.b_content}</textarea>
				<a type="button" class="btn btn-success" id="btnList">게시판목록</a>
				<button type="button" class="btn btn-warning" id="btnModify">수정</button>
				<button type="submit" class="btn btn-primary" style="display:none" id="btnModifyFinish">수정완료</button>
				<button type="button" class="btn btn-danger" id="btnDelete" >삭제</button>
				<div style="float:right">
				<i class="far fa-thumbs-up" style="color:gray; cursor:pointer" id="likeHeart"></i>
				<span id="likeCount">[${likeMap.likeCount}]</span>
<!-- 				<i class="far fa-thumbs-down"></i> -->
<%-- 				<span id="likeCount">[${likeMap.likeCount}]</span> --%>
				</div>
			</form>
			<br>
			<div>[현재댓글${noticeBoardVo.comment_cnt}]</div>
			<div>
				<textarea class="form-control" id="c_content" name="c_content" rows="3" >${commentVo.c_content}</textarea>
				<button type="button" class="btn btn-primary" id="btnCommentInsert" >댓글등록</button>	
				<button type="button" class="btn btn-info" id="btnCommentList" >댓글보기</button>	
			<br>
			</div>
<!--댓글목록 -->
			<div class="row">
				<div class="col-md-12">
					<table class="table" id="commentTable">
						<tbody>
							<tr style="display:none;">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
								<div class="row">
									<div class="col-md-12">
										<div class="dropdown">
											<button class="btn btn-Info dropdown" type="button"
												id="dropdownMenuButton" data-toggle="dropdown">
												&vellip;</button>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<c:choose>
												<c:when test="${sessionScope.loginVo.user_id == user_id}">
												<button class="dropdown-item searchType commentModify">수정</button> 
												<button class="dropdown-item searchType commentDelete">삭제</button>
												</c:when>
												<c:otherwise>
												<a class="dropdown-item searchType sendReport"
												data-toggle="modal" 
												href="#modal-container-105698" 
												data-user_id="${commentVo.user_id}">신고</a>
												</c:otherwise> 
												</c:choose>
<!-- 											<a class="dropdown-item searchType commenReport sendReport" href="/report/reportPage">신고</a>  -->
											</div>
										</div>
									</div>
								</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
<!--//댓글목록 -->		
			</div>
			<div class="mb-3"></div>
		</div>
	</div>
</div>

</section>



<%@ include file="../include/footer.jsp"%>