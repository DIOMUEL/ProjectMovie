<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="administerHeader.jsp" %>
<style>
	.movie_grade {
		margin-left:20px;
	}
	
	.movie_grade_span {
		margin-left:10px;
	}	
	.fileLabel {
		width:80px;
		height:30px;
		border:1px solid #767676;
		border-top-right-radius:3px;
		border-top-left-radius:3px;
		border-bottom-left-radius:3px;
		border-bottom-right-radius:3px;
		text-align:center;
		background-color:#efefef;
		padding-top:2px;
	}
</style>
<body>
<!-- 해더 부분 -->
		<!-- admin_category -->
		<section class="product-area shop-sidebar shop section" style="padding-top:10px;">
			<div class="container" style="padding:0px;">
				<div class="row">
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;margin-bottom:20px;">
									<h4 class="title" >영화관리_영화상세페이지</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/administerPage/administerMovieModifyRun" method="post" id="modifyForm">
									<div class="form-group">
										<input type="hidden" class="form-control" id="movie_code" name="movie_code" value="${movieVo.movie_code}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_name"><strong>영화제목</strong></label>
										<input type="text" class="form-control" id="movie_name" name="movie_name" value="${movieVo.movie_name}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_genre"><strong>영화장르 :</strong></label>
										<input type="radio" name="movie_genre" value="드라마" class="movie_genre" <c:if test="${movieVo.movie_genre == '드라마'}">checked</c:if> disabled/><span class="movie_genre_span">드라마</span>
										<input type="radio" name="movie_genre" value="판타지" class="movie_genre" <c:if test="${movieVo.movie_genre == '판타지'}">checked</c:if> disabled/><span class="movie_genre_span">판타지</span>
										<input type="radio" name="movie_genre" value="로맨스" class="movie_genre" <c:if test="${movieVo.movie_genre == '로맨스'}">checked</c:if> disabled/><span class="movie_genre_span">로맨스</span>
										<input type="radio" name="movie_genre" value="미스터리" class="movie_genre" <c:if test="${movieVo.movie_genre == '미스터리'}">checked</c:if> disabled/><span class="movie_genre_span">미스터리</span>
										<input type="radio" name="movie_genre" value="SF" class="movie_genre" <c:if test="${movieVo.movie_genre == 'SF'}">checked</c:if> disabled/><span class="movie_genre_span">SF</span>
										<input type="radio" name="movie_genre" value="액션" class="movie_genre" <c:if test="${movieVo.movie_genre == '액션'}">checked</c:if> disabled/><span class="movie_genre_span">액션</span>
										<input type="radio" name="movie_genre" value="에로" class="movie_genre" <c:if test="${movieVo.movie_genre == '에로'}">checked</c:if> disabled/><span class="movie_genre_span">에로</span>
										<input type="radio" name="movie_genre" value="다큐" class="movie_genre" <c:if test="${movieVo.movie_genre == '다큐'}">checked</c:if> disabled/><span class="movie_genre_span">다큐</span>
										<input type="radio" name="movie_genre" value="스릴러" class="movie_genre" <c:if test="${movieVo.movie_genre == '스릴러'}">checked</c:if> disabled/><span class="movie_genre_span">스릴러</span>
										<input type="radio" name="movie_genre" value="코미디" class="movie_genre" <c:if test="${movieVo.movie_genre == '코미디'}">checked</c:if> disabled/><span class="movie_genre_span">코미디</span>
										<input type="radio" name="movie_genre" value="애니" class="movie_genre" <c:if test="${movieVo.movie_genre == '애니'}">checked</c:if> disabled/><span class="movie_genre_span">애니</span>
										<input type="radio" name="movie_genre" value="컬트" class="movie_genre" <c:if test="${movieVo.movie_genre == '컬트'}">checked</c:if> disabled/><span class="movie_genre_span">컬트</span>
									</div>
									<div class="form-group">
										<label for="movie_director"><strong>영화감독</strong></label> 
										<input type="text" class="form-control" id="movie_director" name="movie_director" value="${movieVo.movie_director}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_actor"><strong>등장인물</strong></label>
										<input type="text" class="form-control" id="movie_actor" name="movie_actor" value="${movieVo.movie_actor}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_grade"><strong>영화등급 :</strong></label>
										<input type="radio" name="movie_grade" value="all" class="movie_grade"<c:if test="${movieVo.movie_grade == 'all'}">checked</c:if> disabled/>
										<span class="movie_grade_span">전체관람가</span>
										<input type="radio" name="movie_grade" value="12" class="movie_grade"<c:if test="${movieVo.movie_grade == '12'}">checked</c:if> disabled/>
										<span class="movie_grade_span">12세</span>
										<input type="radio" name="movie_grade" value="15" class="movie_grade"<c:if test="${movieVo.movie_grade == '15'}">checked</c:if> disabled/>
										<span class="movie_grade_span">15세</span>
										<input type="radio" name="movie_grade" value="19" class="movie_grade"<c:if test="${movieVo.movie_grade == '19'}">checked</c:if> disabled/>
										<span class="movie_grade_span">19세</span>
									</div>
									<div class="form-group">
										<label for="movie_open_date"><strong>개봉일</strong></label>
										<input type="text" class="form-control" id="movie_open_date" name="movie_open_date"  value="${movieVo.movie_open_date}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_total_time"><strong>총시간(분)</strong></label>
										<input type="number" class="form-control" id="movie_total_time" name="movie_total_time" value="${movieVo.movie_total_time}" readonly/>
									</div>
									<div class="form-group">
										<label for="movie_content"><strong>영화정보</strong></label>
										<textarea rows="5" class="form-control" id="movie_content" name="movie_content" readonly>${movieVo.movie_content}</textarea>
									</div>
									<div> 
									</div>
									<div class="form-group">
										<label for="movie_main_image" style="margin-right:10px;"><strong>영화 메인이미지 : </strong></label>
										<input type="file" class="movie_main_image image" id="movie_main_image" onchange="loadImage(this);" accept="image/*" style="display:none;" disabled/>
										<label for="movie_main_image" class="fileLabel" >파일 선택</label>
										<span id="movie_main_image_text"></span>
										<div id="main_image_div" style="width:300px;height:auto;">
											<div data-fileName="${movieVo.movie_main_image}">
												<img src="/upload/displayFile?fileName=${movieVo.movie_main_image}" width="150px;"/>
												<a href="${movieVo.movie_main_image}" style="display:none" class="attach-main-del display"><span class="pull-right" style="color:red;">[삭제]</span></a>
											</div>
											
										</div>
									</div>
									<div class="form-group"> 
										<label for="movie_sub_image" style="margin-right:10px;"><strong>영화 상세사진 : </strong></label>
										<input type="file" class="movie_sub_image image" id="movie_sub_image" multiple onchange="loadSubImage(this);" style="display:none;" accept="image/*"/>
										<label for="movie_sub_image" class="fileLabel" >파일 선택</label>
										<span id="movie_sub_image_text"></span>
										<div id="movie_sub_image_div" style="width:300px;height:auto;">
										<c:forEach items="${movieImageVo}" var="imageVo">
											<div data-fileName="${imageVo.movie_sub_image}">
												<img src="/upload/displayFile?fileName=${imageVo.movie_sub_image}" width="225px;"/>
												<a href="${imageVo.movie_sub_image}" style="display:none" class="attach-sub-del display"><span class="pull-right" style="color:red;">[삭제]</span></a>
											</div>
										</c:forEach>	
										</div>
									</div>
									<br/>
									<div class="form-group">
										<label for="movie_preview" style="margin-right:10px;"><strong>영화 예고편 : </strong></label>
										<input type="file" class="movie_preview image" id="movie_preview" accept="video/*" onchange="previewUpload(this);" style="display:none;" disabled/>
										<label for="movie_preview" class="fileLabel" >파일 선택</label>
										<span id="movie_preview_span"></span>
										<div id="movie_preview_text" style="width:250px;height:auto;">
											<div data-fileName="${movieVo.movie_preview}">
<%-- 											<video src="/upload/displayFile?fileName=${movieVo.movie_preview}" width="300px;" controls></video> --%>
											<a href="${movieVo.movie_preview}" style="display:none" class="attach-preview-del display"><span class="pull-right" style="color:red;">[삭제]</span></a>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-primary" id="btnModify">수정</button>
									<button type="submit" class="btn btn-warning" style="display:none;" id="btnModifyComplite">수정완료</button>
									<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>
									<a href="/administerPage/administerMovieListPage" class="btn btn-primary" style="color:#fff;">목록</a>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<!-- Bootstrap core JavaScript-->
<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
$(function () {
	$("#btnModify").click(function(){
		$(".form-control").attr("readonly", false);
		$(".movie_genre").attr("disabled", false);
		$(".movie_grade").attr("disabled", false);
		$(".image").attr("disabled", false);
		$(".display").attr("style", "");
		$("#btnModify").attr("style", "display:none");
		$("#btnModifyComplite").attr("style", "");
	});
	var msg = "${msg}";
	if(msg == "success"){
		alert("수정완료");
	}
	$("#btnDelete").click(function(){
		if (confirm("삭제하시겠습니까?")) {
			location.href = "/administerPage/administerMovieDeleteRun?movie_code=${movieVo.movie_code}";
		}
	});
	$("#modifyForm").submit(function () {
		// 개봉일 형식 확인(yyyy-mm-ss)
		var movie_open_date = $("#movie_open_date").val();
		var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
		if(!date_pattern.test(movie_open_date)) {
			$("#movie_open_date").parent().find("span").remove();
			html = "<span style='color:red;'>개봉일 형식을 확인해주세요.</span>";
			$("#movie_open_date").parent().append(html);
			return false;
		}
		$("#movie_open_date").parent().find("span").remove();
		
		// 총시간(0~999)
		var movie_total_time = $("#movie_total_time").val();
		if (movie_total_time<0 || movie_total_time>999) {
			$("#movie_total_time").parent().find("span").remove();
			html = "<span style='color:red;'>총시간을 확인해주세요.</span>";
			$("#movie_total_time").parent().append(html);
			return false;
		} 
		$("#movie_total_time").parent().find("span").remove();
		
		// 메인 파일 담기
		var upDiv1 = $("#main_image_div > div");
		upDiv1.each(function(index) {
			var filename = $(this).attr("data-filename");
			var hiddenInput = "<input type='hidden' name='movie_main_image' value='"+filename+"'/>";
			$("#modifyForm").prepend(hiddenInput);
		});
		
		// 서브 파일 담기
		var upDiv2 = $("#movie_sub_image_div > div");
		upDiv2.each(function(index) {
			var filename = $(this).attr("data-filename");
			var hiddenInput = "<input type='hidden' name='movie_sub_image["+index+"]' value='"+filename+"'/>";
			$("#modifyForm").prepend(hiddenInput);
		});
		
		// 동영상 파일 담기
		var upDiv3 = $("#movie_preview_text > div");
		upDiv3.each(function(index) {
			var filename = $(this).attr("data-filename");
			var hiddenInput = "<input type='hidden' name='movie_preview' value='"+filename+"'/>";
			$("#modifyForm").prepend(hiddenInput);
		});
// 		return false;
	});
	
	// 기존 메인이미지 지우기
	$(".attach-main-del").click(function (e) {
		e.preventDefault();
		$("#movie_main_image_text").text("선택된 파일 없음");
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				removeDiv.remove();
			}
		});
	});
	
	// 기존 sub_이미지 지우기
	$(".attach-sub-del").click(function (e) {
		e.preventDefault();
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				removeDiv.remove();
			}
		});
	});
	
	// 기존 동영상 지우기
	$(".attach-preview-del").click(function (e) {
		e.preventDefault();
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				removeDiv.remove();
			}
		});
	});
	
});
// 파일 데이터 미리보기 - 1개
function loadImage(value) {
	$("#main_image_div > div").remove();
	$("#movie_main_image").prop("disabled","true");
 	// 파일 추가하기
	var file = value.files[0];
	var formData = new FormData(); // <form> 작성
	formData.append("file", file); // <input type="file"> : 파일 선택
	var url = "/upload/uploadAjax";
	$.ajax({
		"processData" : false,  // text 파일
		"contentType" : false,	// text 파일
		"type" : "post",
		"url" : url,
		"data" : formData,
		"success" : function(rData) {
			var slashIndex = rData.lastIndexOf("/");
			var front = rData.substring(0, slashIndex + 1);
			var rear = rData.substring(slashIndex + 1);
			var originalFilename = rData.substring(rData.lastIndexOf("-")+1);
			var thumbnailName = front + "sm_" + rear;
			var html = "<div data-fileName='" + rData + "'>";
			html += "<img src='/upload/displayFile?fileName=" + thumbnailName + "'/>";
			html += "<a href='"+rData+"' class='attach-del'><span class='pull-right' style='color:red;'>[삭제]</span></a>";
			html += "</div>";
			
			$("#main_image_div").append(html);
			$("#movie_main_image_text").text(originalFilename);
		}
	});
	
	// 이미지 지우기
	$("#modifyForm").on("click", ".attach-del", function(e) {
		e.preventDefault();
		$("#movie_main_image_text").text("선택된 파일 없음");
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				removeDiv.remove();
				$("#movie_main_image").removeAttr("disabled");
			}
		});
	});
}

//파일 데이터 미리보기 - 여러개
function loadSubImage(value) {
	$("#movie_sub_image_div > img").remove();
	var files = value.files;
	var filesArr = Array.prototype.slice.call(files);
	var fileIndex = 0;
	
	filesArr.forEach(function(f) { 
		
		// 파일 추가하기
		var file = value.files[fileIndex];
		fileIndex ++;
		var formData = new FormData(); // <form> 작성
		formData.append("file", file); // <input type="file"> : 파일 선택
		var url = "/upload/uploadAjax";
		$.ajax({
			"processData" : false,  // text 파일
			"contentType" : false,	// text 파일
			"type" : "post",
			"url" : url,
			"data" : formData,
			"success" : function(rData) {
				var slashIndex = rData.lastIndexOf("/");
				var front = rData.substring(0, slashIndex + 1);
				var rear = rData.substring(slashIndex + 1);
				var originalFilename = rData.substring(rData.lastIndexOf("-")+1);
				var thumbnailName = front + "sm_" + rear;
				var html = "<div data-fileName='" + rData + "'>";
				html += "<img src='/upload/displayFile?fileName=" + thumbnailName + "'/><br/>";
				html += "<span>"+originalFilename+"</span>";
				html += "<a href='"+rData+"' class='attach-del1'><span class='pull-right' style='color:red;'>[삭제]</span></a>";
				html += "</div>";
				$("#movie_sub_image_div").append(html);
			}
		});		
	});
	// 이미지 지우기
	$("#modifyForm").on("click", ".attach-del1", function(e) {
		e.preventDefault();
		var removeDiv = $(this).parent();
		var fileName = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fileName};
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : sendData,
			"success" : function(rData) {
				removeDiv.remove();
			}
		});
	});
}
</script>
	</body>
</html>