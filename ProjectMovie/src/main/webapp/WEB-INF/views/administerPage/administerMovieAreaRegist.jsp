<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="administerHeader.jsp" %>
<section>
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">영화관 관리_지역 등록</h4>
						</div>
						<form id="frmArea" role="form" action="/administerPage/areaAddRun" method="get">
							<div class="form-group" style="vertical-align:middle;">
								<label for="area_name"><strong>지역 이름</strong></label>
								<input type="text" class="form-control" id="area_name" name="area_name" placeholder="지역 이름"/>
							</div>
							<button type="submit" class="btn btn-primary">등록</button>
							<a href="#" class="btn btn-primary">목록</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</section>
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script>
	<!-- 주소 창에서 주소 받을때 지정하기 -->
	function jusoCallBack(roadFullAddr){
		$("#theater_address").val(roadFullAddr);
	}
	$(function() {
		// 실패했을 경우
		var result = "${result}";
		if(result == "false") {
			alert("등록에 실패하셨습니다 다시 확인해주세요.");
		}
		// 전송 할 때
		$("#frmArea").submit(function() {
			var area_name = $("#area_name_result").val();
			if(area_name != "true" || area_name == null) {
				alert("비어있는 정보가 있습니다. 다시 확인해주세요.");
				return false;
			}
		});
	});
	</script>
</body>
</html>