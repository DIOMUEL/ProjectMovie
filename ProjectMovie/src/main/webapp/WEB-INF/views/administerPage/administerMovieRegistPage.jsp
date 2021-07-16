<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		border-top-right-radius:3px;
		border-top-left-radius:3px;
		border-bottom-left-radius:3px;
		border-bottom-right-radius:3px;
		text-align:center;
		background-color:green;
		padding-top:2px;
		color: white;
	}
</style>
<body class="js">
		<!-- admin_category -->
		<section class="product-area shop-sidebar shop section" style="padding-top:10px;">
			<div class="container" style="padding:0px;">
				<div class="row">
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
						<!-- -------- 페이지별 바뀌는 부분  코딩 필요-->
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;margin-bottom:20px;">
									<h4 class="title" >영화관리_영화등록</h4>
								</div>	
								<!--  페이지별 내용 -->
								<form role="form" action="/admin/admin_movie_register" method="post" id="registForm">
									<div class="form-group">
										<label for="movie_name"><strong>영화이름</strong></label>
										<input type=text class="form-control" id="movie_name" name="movie_name" required/>
									</div>
									<div class="form-group">
										<label for="movie_genre"><strong>영화장르 :</strong></label>
										<input type="radio" name="movie_genre" value="드라마" class="movie_genre" checked/><span class="movie_genre_span">드라마</span>
										<input type="radio" name="movie_genre" value="판타지" class="movie_genre"/><span class="movie_genre_span">판타지</span>
										<input type="radio" name="movie_genre" value="로맨스" class="movie_genre"/><span class="movie_genre_span">로맨스</span>
										<input type="radio" name="movie_genre" value="미스터리" class="movie_genre"/><span class="movie_genre_span">미스터리</span>
										<input type="radio" name="movie_genre" value="SF" class="movie_genre"/><span class="movie_genre_span">SF</span>
										<input type="radio" name="movie_genre" value="액션" class="movie_genre"/><span class="movie_genre_span">액션</span>
										<input type="radio" name="movie_genre" value="에로" class="movie_genre"/><span class="movie_genre_span">에로</span>
										<input type="radio" name="movie_genre" value="다큐" class="movie_genre"/><span class="movie_genre_span">다큐</span>
										<input type="radio" name="movie_genre" value="스릴러" class="movie_genre"/><span class="movie_genre_span">스릴러</span>
										<input type="radio" name="movie_genre" value="코미디" class="movie_genre"/><span class="movie_genre_span">코미디</span>
										<input type="radio" name="movie_genre" value="애니" class="movie_genre"/><span class="movie_genre_span">애니</span>
										<input type="radio" name="movie_genre" value="컬트" class="movie_genre"/><span class="movie_genre_span">컬트</span>
									</div>
									<div class="form-group">
										<label for="movie_director"><strong>영화감독</strong></label> 
										<input type="text" class="form-control" id="movie_director" name="movie_director" required/>
									</div>
									<div class="form-group">
										<label for="movie_actor"><strong>등장인물</strong></label>
										<input type="text" class="form-control" id="movie_actor" name="movie_actor" required/>
									</div>
									<div class="form-group">
										<label for="movie_grade"><strong>영화등급 :</strong></label>
										<input type="radio" name="movie_grade" value="all" class="movie_grade" checked/><span class="movie_grade_span">전체관람가</span>
										<input type="radio" name="movie_grade" value="12" class="movie_grade"/><span class="movie_grade_span">12세</span>
										<input type="radio" name="movie_grade" value="15" class="movie_grade"/><span class="movie_grade_span">15세</span>
										<input type="radio" name="movie_grade" value="19" class="movie_grade"/><span class="movie_grade_span">19세</span>
									</div>
									<div class="form-group">
										<label for="movie_open_date"><strong>개봉일</strong></label>
										<input type="text" class="form-control" id="movie_open_date" name="movie_open_date" placeholder="'-'를 넣어서 ex)2020-07-07" required/>
									</div>
									<div class="form-group">
										<label for="movie_total_time"><strong>총시간(분)</strong></label>
										<input type="number" class="form-control" id="movie_total_time" name="movie_total_time" placeholder="ex)180분->180" required/>
									</div>
									<div class="form-group">
										<label for="movie_content"><strong>영화정보</strong></label>
										<textarea class="form-control" rows="5" id="movie_content" name="movie_content"></textarea>
									</div>
									<div> 
										<span style="color:blue;">* 이미지 & 동영상 파일 크기는 10MB 미만만 가능합니다.</span>
										<span style="color:red;">( 파일명에 '#', [], {}, 등 특수문자는 제외시켜주세요.)</span>
									</div>
									<div class="form-group">
										<label for="movie_main_image" style="margin-right:10px;"><strong>영화 메인이미지 : </strong></label>
										<input type="file" class="movie_main_image" id="movie_main_image" onchange="loadImage(this);" accept="image/*" required style="display:none;"/>
										<label for="movie_main_image" class="fileLabel btn_orange" >파일 선택</label>
										<span id="movie_main_image_text">선택된 파일 없음</span>
										<div id="main_image_div" style="width:300px;height:auto;"></div>
									</div>
									<div class="form-group"> 
										<label for="movie_sub_image" style="margin-right:10px;"><strong>영화 상세사진 : </strong></label>
										<input type="file" class="movie_sub_image" id="movie_sub_image" multiple onchange="loadSubImage(this);" required style="display:none;" accept="image/*" required/>
										<label for="movie_sub_image" class="fileLabel" >파일 선택</label>
										<span id="movie_sub_image_text">선택된 파일 없음</span>
										<div id="movie_sub_image_div" style="width:300px;height:auto;"></div>
									</div>
									<div class="form-group">
										<label for="movie_preview" style="margin-right:10px;"><strong>영화 예고편 : </strong></label>
										<input type="file" class="movie_preview" id="movie_preview" accept="video/*" onchange="previewUpload(this);" required style="display:none;"/>
										<label for="movie_preview" class="fileLabel" >파일 선택</label>
										<span id="movie_preview_span">선택된 파일 없음</span>
										<div id="movie_preview_text" style="width:250px;height:auto;"></div>
									</div>
									<button type="submit" class="btn btn-primary" id="btnSubmit">등록</button>
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
			$("#movie_manage > dd").css("display","block");
			$("#movie_manage > dt").css("color","red");
			$("#movie_manage > dd").eq(1).css("color","blue");
			$("#registForm").submit(function () {
				// 개봉일 형식 확인(2020-07-07)
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
				console.log(movie_total_time);
				if (movie_total_time < 0 || movie_total_time > 999) {
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
					$("#registForm").prepend(hiddenInput);
				});
				
				// 서브 파일 담기
				var upDiv2 = $("#movie_sub_image_div > div");
				upDiv2.each(function(index) {
					var filename = $(this).attr("data-filename");
					var hiddenInput = "<input type='hidden' name='movie_sub_image["+index+"]' value='"+filename+"'/>";
					$("#registForm").prepend(hiddenInput);
				});
				
				// 동영상 파일 담기
				var upDiv3 = $("#movie_preview_text > div");
				upDiv3.each(function(index) {
					var filename = $(this).attr("data-filename");
					var hiddenInput = "<input type='hidden' name='movie_preview' value='"+filename+"'/>";
					$("#registForm").prepend(hiddenInput);
				});
				
			});
			
		});
		var tempLength = 0;
		var rearLength = 0;
		// 파일 데이터 미리보기 - 1개
		function loadImage(value) {
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
					console.log(rData);
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
			$("#registForm").on("click", ".attach-del", function(e) {
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
			console.log("subImage");
			$("#movie_sub_image_div > img").remove();
			var files = value.files;
			var filesArr = Array.prototype.slice.call(files);
			var fileIndex = 0;
			var length = filesArr.length;
			rearLength += length;
			
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
				
				$("#movie_sub_image_text").text("파일 " + (rearLength+tempLength) + "개");
				
			});
			// 이미지 지우기
			$("#registForm").on("click", ".attach-del1", function(e) {
				tempLength = -1;
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
						var check = rearLength+tempLength;
						rearLength = check;
						tempLength = 0;
						$("#movie_sub_image_text").text("파일 " + check + "개");
						removeDiv.remove();
					}
				});
			});
		}
		
		// 예고편 동영상 올리기
		function previewUpload(value) {
			$("#movie_preview").prop("disabled","true");
			$("#tempDiv").remove();
			var file = value.files[0];
			var fileSize = Math.floor(file.size/(1024*1024));
			console.log("fileSize:" + fileSize + "MB");
			
			if(fileSize > 10) {
				console.log("사이즈오류");
				
				var html = "<div id='tempDiv'>";
				html += "<span style='color:red;'>파일사이즈가 맞지않습니다.</span>";
				html += "</div>";
				$("#movie_preview_text").append(html);
				$("#movie_preview").removeAttr("disabled");
				return false;
			}
			var formData = new FormData(); // <form> 작성
			formData.append("file", file); // <input type="file"> : 파일 선택
			var url = "/upload/previewUploadAjax";
			$.ajax({
				"processData" : false,  // text 파일
				"contentType" : false,	// text 파일
				"type" : "post",
				"url" : url,
				"data" : formData,
				"success" : function(rData) {
					var originalFilename = rData.substring(rData.lastIndexOf("-")+1);
					var text = "파일명: "+ originalFilename + " Size:" + fileSize;
					var html = "<div data-fileName='" + rData + "'>";
					html += "<span style='margin-left:100px;width:100px;'>파일사이즈: "+fileSize+"MB</span>";
					html += "<a href='"+rData+"' class='attach-del2'><span class='pull-right' style='color:red;'>[삭제]</span></a>";
					html += "</div>";
					
					$("#movie_preview_text").append(html);
					$("#movie_preview_span").text(originalFilename);
				}
			});
			
			// 이미지 지우기
			$("#registForm").on("click", ".attach-del2", function(e) {
				e.preventDefault();
				$("#movie_preview_span").text("선택된 파일 없음");
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
						$("#movie_preview").removeAttr("disabled");
					}
				});
			});
			
		}
		</script>
	</body>
</html>