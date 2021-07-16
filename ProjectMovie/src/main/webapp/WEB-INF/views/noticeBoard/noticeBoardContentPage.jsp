<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
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
	
	$("#btnDelete").click(function(){
		alert("삭제하시겠습니까?");
		location.href = "/noticeBoard/noticeBoardDeleteRun?b_no=${noticeBoardVo.b_no}";
	});
	
	// 목록
	$("#btnList").click(function() {
		location.href = "/board/noticeBoardPage?page=${pagingDto.page}&perPage=${pagingDto.perPage}&searchType=${pagingDto.searchType}&keyword=${pagingDto.keyword}";
	});
	
});
</script>
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
				<br>
				<a type="button" class="btn btn-success" id="btnList">목록</a>
				<button type="button" class="btn btn-warning" id="btnModify">수정</button>
				<button type="submit" class="btn btn-success" style="display:none" id="btnModifyFinish">수정완료</button>
				<button type="button" class="btn btn-danger" id="btnDelete" >삭제</button>
			</form>
			</div>
			<div class="mb-3"></div>

		</div>
	</div>
</div>

</section>



<%@ include file="../include/footer.jsp"%>