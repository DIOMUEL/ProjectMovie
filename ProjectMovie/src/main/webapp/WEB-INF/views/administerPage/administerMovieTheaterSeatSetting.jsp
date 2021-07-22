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
							   	<option value="0" selected>--지역명--</option>
							   	<c:forEach items="${areaVo}" var="areaVo">
							  		<option value="${areaVo.area_no}">${areaVo.area_name}</option>
							  	</c:forEach>
							</select>
							<select class="selectTheaterName" name="theater">
								<option value="0" selected>--영화관명--</option>
							</select>
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-primary" id="theaterRoomList">조회</button>
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
						</form>
					</div>
					<div class="col-md-12">
						<table class="table" style="display:none;">
							<thead>
								<tr>
									<th>#</th>
									<th>지역</th>
									<td>영화관명</td>
									<td>제O관</td>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><a class="btn-primary" style="color: white;">수정</a></td>
									<td><a class="btn-danger" style="color: white;">삭제</a></td>
								</tr>
							</tbody>
						</table>
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
			//선택한 지역에 속해있는 영화관 호출하기
			$(".selectArea").click(function(){
				var that = $(this);
				var area_no = $(".selectArea").val();
				//console.log("area_no : "+ area_no);
				var url = "/administerPage/SeatSetting_callingTheater";
				var sendData = {
						"area_no" : area_no
				};
				$.get(url, sendData, function(rData){
					$(".selectTheaterName").children('option:not(:first)').remove();
// 					console.log("rData : "+ rData);
// 					console.log("rData[0] : "+ rData[0].area_theater_name);
					var arrName = new Array();
					for(i=0; i<rData.length; i++){
						arrName[i] = rData[i].area_theater_name;		
					};
//  				console.log("rData.length : "+ rData.length);
					$.each(arrName, function(key, value) { 
						$(".selectTheaterName").append($("<option></option>").attr("value",key).text(value)); 
					});
				});
			});
			//영화관에 속해있는 관 리스트 조회
			$("#theaterRoomList").click(function(){
				$(".table").attr("style", "");
				$(document).on("click",".btnShowTheaterList",function(){
					var that = $(this);
					
					var area_no = $(this).attr("data-area_no");
					var url = "/administerPage/administerMovieAreaTheaterList";
					var sendData = {
							"area_no" : area_no
					};
					$.get(url, sendData, function(rData) {
						//console.log("rData: "+rData);
						var clone_tr;
						var tr;
						$.each(rData, function() {
							tr = that.parent().parent();
							//console.log(tr)
							clone_tr = $("#addTheaterList").clone();
							clone_tr.removeAttr("id");
							//console.log(clone_tr);
							var td = clone_tr.find("td");
							td.eq(0).text();
							td.eq(1).text(this.area_theater_no);
							td.eq(2).text(this.area_theater_name);
							td.eq(3).children().attr("data-area_theater_no", this.area_theater_no);
							td.eq(3).children().attr("href", "#modal-container-975549");
							td.eq(3).children().attr("data-toggle", "modal");
							td.eq(4).children().attr("data-area_theater_no", this.area_theater_no);
							clone_tr.insertAfter(tr);
							clone_tr.show();
						});
					});
				});
			});
		});
	</script>	
</body>
</html>