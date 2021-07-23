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
	
	//댓글수정
	$("#btnModify").click(function(){
// 		e.preventDefault();
// 		if("${noticeBoardVo.user_id}" == ""){
// 			alert("로그인을 확인해주세요");
// 			location.href = "/board/loginPage";
// 		}else{		
// 		}
		$("#btnModifyFinish").show(1000);
		$("[name^=b_]").prop("readonly", false);
	});	
	
	//댓글삭제
	$("#btnDelete").click(function(){
		alert("삭제하시겠습니까?");
		location.href = "/noticeBoard/noticeBoardDeleteRun?b_no=${noticeBoardVo.b_no}";
	});
	
	//댓글입력
	$("#btnCommentInsert").click(function() {
		var c_content = $("#c_content").val();
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
 				}
			}
		});
	});
	
	//댓글목록
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
<section class="page-section bg-light">
<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
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
				<a type="button" class="btn btn-success" id="btnList">목록</a>
				<button type="button" class="btn btn-warning" id="btnModify">수정</button>
				<button type="submit" class="btn btn-primary" style="display:none" id="btnModifyFinish">수정완료</button>
				<button type="button" class="btn btn-danger" id="btnDelete" >삭제</button>
			</form>
			<br>
			<div>
				<textarea class="form-control" id="c_content" name="c_content" rows="3" >${commentVo.c_content}</textarea>
				<button type="button" class="btn btn-primary" id="btnCommentInsert" >등록</button>	
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
												<button class="dropdown-item searchType commentModify">수정</button> 
												<button class="dropdown-item searchType commentDelete">삭제</button> 
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