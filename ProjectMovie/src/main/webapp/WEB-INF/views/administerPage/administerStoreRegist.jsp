<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="administerHeader.jsp"%>
<style>
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
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="jumbotron">
				<h2>매점 식음료 등록 페이지입니다.</h2>
				<p>요구대는 사항에 맞게 작성하신 후 등록을 눌러주세요</p>
			</div>
			<form role="form" action="/administerPage/administerStoreRegistRun" method="post" id="foodRegistForm">
				<div class="form-group">
				<label for="food_code">상품 종류</label>
					<select class="food_code" id="food_code" name="food_code" required>
						<option value="0" selected>--상품 분류--</option>
					   	<option value="1001">음식</option>	   
					   	<option value="1002">음료</option>	   
					   	<option value="1003">세트메뉴</option>	   
					</select>
				</div>
				<div class="form-group">
					<label for="food_name">상품명</label>
					<input type="text" class="form-control" id="food_name" name="food_name" placeholder="음식명을 적어주세요" required/>
				</div>
				<div class="form-group">
					<label for="food_price">상품가격</label>
					<input type="number" class="form-control" id="food_price" name="food_price" placeholder="ex)10000원 -> 10000 / 미정일시 00을 적어주세요." required/>
				</div>
				<div class="form-group">
					<label for="food_count">상품수량</label>
					<input type="number" class="form-control" id="food_count" name="food_count" placeholder="ex)180개 -> 180 / 미정일시 00을 적어주세요." required/>
				</div>
				<div> 
					<span style="color:blue;">* 이미지 파일 크기는 10MB 미만만 가능합니다.</span>
					<span style="color:red;">( 파일명에 '#', [], {}, 등 특수문자는 제외시켜주세요.)</span>
				</div>
				<div class="form-group">
					<label for="food_image" style="margin-right:10px;"><strong>식음료 이미지 : </strong></label>
					<input type="file" class="food_image" id="food_image" onchange="loadImage(this);" accept="image/*" style="display:none;"/>
					<label for="food_image" class="fileLabel btn_orange" >파일 선택</label>
					<span id="food_image_text">선택된 파일 없음</span>
					<div id="food_image_div" style="width:300px;height:auto;"></div>
				</div>
				<button type="submit" class="btn btn-primary">등록</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
	$(function(){
		//이미지 저장
		$("#foodRegistForm").submit(function () {
			var upDiv = $("#food_image_div > div");
			upDiv.each(function(index) {
				var filename = $(this).attr("data-filename");
				var hiddenInput = "<input type='hidden' name='food_image' value='"+filename+"'/>";
				$("#foodRegistForm").prepend(hiddenInput);
			});
		});
	});
	var tempLength = 0;
	var rearLength = 0;
	// 파일 데이터 미리보기 - 1개
	function loadImage(value) {
		$("#food_image").prop("disabled","true");
	 	// 파일 추가하기
		var file = value.files[0];
		var formData = new FormData(); // <form> 작성
		formData.append("file", file); // <input type="file"> : 파일 선택
		var url = "/foodUpload/uploadAjax";
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
				html += "<img src='/foodUpload/displayFile?fileName=" + thumbnailName + "'/>";
				html += "<a href='"+rData+"' class='attach-del'><span class='pull-right' style='color:red;'>[삭제]</span></a>";
				html += "</div>";
				
				$("#food_image_div").append(html);
				$("#food_image_text").text(originalFilename);
			}
		});
		// 이미지 지우기
		$("#foodRegistForm").on("click", ".attach-del", function(e) {
			e.preventDefault();
			$("#food_image_text").text("선택된 파일 없음");
			var removeDiv = $(this).parent();
			var fileName = $(this).attr("href");
			var url = "/foodUpload/deleteFile";
			var sendData = {"fileName" : fileName};
			$.ajax({
				"type" : "get",
				"url" : url,
				"data" : sendData,
				"success" : function(rData) {
					removeDiv.remove();
					$("#food_image").removeAttr("disabled");
				}
			});
		});
	}
</script>
</body>
</html>