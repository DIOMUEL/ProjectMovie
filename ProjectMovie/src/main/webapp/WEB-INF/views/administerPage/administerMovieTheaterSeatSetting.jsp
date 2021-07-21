<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="administerHeader.jsp"%>

<!-- 영화관 좌석 및 영화관 세팅하기 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">영화관 좌석 관리</h4>
						</div>
						<div>
							<select class="selectArea" name="area">
							   	<option value="" selected>--지역명--</option>
							   	<c:forEach items="${areaVo}" var="areaVo">
							  		<option value="${areaVo.area_no}">${areaVo.area_name}</option>
							  	</c:forEach>
							</select>
							<select name="theater">
								<option value="" selected>--영화관명--</option>
							   	<option value=""></option>
							</select>
						</div>
						<form id="frmArea" role="form" action="#" method="get">
							<div class="form-group">
								<label for="theaterName"> 관 이름 </label> 
								<input type="text" class="form-control" id="theaterRoomName" />
							</div>
							<div class="form-group">
								<label for="seatingNum"> 좌석 수 </label> 
								<input type="number" class="form-control" id="seatingNum" />
							</div>
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-primary">목록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script>
		$(function() {
			$(".selectArea").click(function(){
				var area_no = $(".selectArea").val();
				//console.log("area_no : "+ area_no);
				var url = "/administerPage/SeatSetting_callingTheater";
				var sendData = {
						"area_no" : area_no
				};
				$.get(url, sendData, function(rData){
					console.log("rData : "+ rData);
				});
			});
		});
	</script>	
</body>
</html>