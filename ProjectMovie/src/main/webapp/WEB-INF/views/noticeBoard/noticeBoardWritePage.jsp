<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function(){
	
	$("#btnWrite").click(function(){
		
		b_title = $("#b_title").val();
		if(b_title == ""){
			alert("제목을 입력해 주세요");
			return false;
		}
		b_content = $("#b_content").val();
		if(b_content == ""){
			alert("내용을 입력해주세요")
			return false;
		}
		
	});
	
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
						<h2 style="color: white;">글쓰기</h2>
						<br>
					</div>

					<form id="frmWrite" role="form"
						action="/noticeBoard/noticeBoardWriteRun" method="post">
						<label for="exampleFormControlInput1" class="form-label">제목</label>
						<input type="text" class="form-control" id="b_title"
							name="b_title" /> <label for="exampleFormControlTextarea1"
							class="form-label">내용</label>
						<textarea class="form-control" id="b_content" name="b_content"
							rows="3"></textarea>
						<div>
							<button type="submit" class="btn btn-success" id="btnWrite">작성완료</button>
						</div>
					</form>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</div>
</section>




<%@ include file="../include/footer.jsp"%>