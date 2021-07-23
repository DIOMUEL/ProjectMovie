<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="administerHeader.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				 <div class="modal fade" id="modal-container-295481" role="dialog" aria-labelledby="mySeatingModify" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="mySeatingModify">좌석 수 수정</h5> 
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<input type="number" class="form-control" id="modify_theater_seatNum" placeholder="수정할 좌석 수 입력"/>
							</div>
							<div class="modal-footer"> 
								<button type="button" class="btn btn-primary btnSeatingModify" id="btnSeatingModify">좌석 수 수정</button> 
								<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnSeatingCansle">취소</button>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
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
							<button type="button" class="btn btn-primary" id="theaterRoomList">조회</button>
						</div>
						<form id="frmSeatSetting" role="form" action="/administerPage/seatSettingRegist" method="get">
							<div class="form-group">
								<input type="hidden" class="form-control" id="area_theater_no" name="area_theater_no"/>
							</div>
							<div class="form-group">
								<label for="theater_name"> 관 이름 </label> 
								<input type="text" class="form-control" id="theater_name" name="theater_name" placeholder="제O관 예)제1관"/>
							</div>
							<div class="form-group">
								<label for="theater_seatNum"> 좌석 수 </label> 
								<input type="number" class="form-control" id="theater_seatNum" name="theater_seatNum" placeholder="숫자만입력 "/>
							</div>
							<button type="submit" class="btn btn-primary" id="theaterRoomResgist">등록</button>
						</form>
					</div>
					<div class="col-md-12">
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h5 class="subtitle"></h5>
						</div>
						<table class="table" style="display:none;">
							<thead>
								<tr>
									<th>#</th>
									<th>제O관</th>
									<th>좌석수</th>
									<th>좌석 수 수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td><a class="btn-primary btnSeatModify" style="color: white;">좌석 수 수정</a></td>
									<td><a class="btn-danger btnSeatingDelete" style="color: white;">삭제</a></td>
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
			//등록 성공시
			var msgSittingRegist = "${msgSittingRegist}";
			if(msgSittingRegist == "success"){
				alert("영화관등록성공");
			}
			//선택한 지역에 속해있는 영화관 호출하기
			$(".selectArea").change(function(){
				var that = $(this);
				var area_no = $(".selectArea").val();
				//console.log("area_no : "+ area_no);
				var url = "/administerPage/seatSetting_callingTheater";
				var sendData = {
						"area_no" : area_no
				};
				$.get(url, sendData, function(rData){
					$(".selectTheaterName").children('option:not(:first)').remove();
// 					console.log("rData : "+ rData);
// 					console.log("rData[0] : "+ rData[0].area_theater_name);
					var arrName = new Array();//[.......]
					var arrNo = new Array();
					for(i=0; i<rData.length; i++){
						arrName[i] = rData[i].area_theater_name;		
						arrNo[i] = rData[i].area_theater_no;		
					};
//  				console.log("rData.length : "+ rData.length);
//   				console.log("arrNo[] : "+ arrNo[i]);

					$.each(arrName, function(key, value) { 
						$(".selectTheaterName").append($("<option></option>").attr("class", "arrNo").text(value)); 	
					});
					for(i=0; i<rData.length; i++){
// 						console.log("rData.length : "+ rData.length);
// 						console.log("i : "+ i);
// 						console.log("arrNo[] : "+ arrNo[i]);
						$(".arrNo:eq("+ i +")").attr("value", arrNo[i]); 
						//$(".selectTheaterName").children("option:eq("+ i+1 +")").attr("value", arrNo[i]); 
					};
				});
			});
			//지역>영화관 선택시 선택된값 form의 히든값으로 넘기기
			$(".selectTheaterName").change(function(){
				var area_theater_no = $(this).val();
				$("#area_theater_no").val(area_theater_no);
			});
			//영화관 관명등록은 버튼으로 폼으로 넘기기
			//조회버튼-영화관에 속해있는 관 리스트 조회
			$(document).on("click","#theaterRoomList",function(){
				$(".table").attr("style", "");
				//var that = $(this);
				var area_theater_no = $(".selectTheaterName").val();
				//console.log("area_theater_no: "+area_theater_no);
				var url = "/administerPage/callingTheaterRoomList";
				var sendData = {
						"area_theater_no" : area_theater_no
				};
				$.get(url, sendData, function(rData) {
					//console.log("rData: "+rData);
				//리스트 서브타이틀 달기
				 	var province = $(".selectArea option:selected").text(); 
					var city = $(".selectTheaterName option:selected").text();
					$(".subtitle").text(province + "의 " + city + " 영화관 리스트");
				//테이블 복사	
					var clone_tr;
					$(".table > tbody > tr:gt(0)").remove();
					$.each(rData, function() {
						//console.log(tr)
						clone_tr = $(".table > tbody > tr:first").clone();
						//$(".table > tbody > tr:eq(0)").remove();
						//console.log(clone_tr);
						var td = clone_tr.find("td");
						td.eq(0).text(this.theater_no);
						td.eq(1).text(this.theater_name);
						td.eq(2).text(this.theater_seatNum);
						td.eq(3).children().attr("data-theater_no", this.theater_no);
 						td.eq(3).children().attr("href", "#modal-container-295481");
 						td.eq(3).children().attr("data-toggle", "modal");
 						td.eq(4).children().attr("data-theater_no", this.theater_no);
						$(".table > tbody").append(clone_tr);
						$(".table > tbody > tr:first").attr("style", "display:none");
						clone_tr.show();
					});
				});
			});
			//수정 누르고 모달창에서 수정할떄 값 컨트롤러에 보내기
			$(document).on("click",".btnSeatModify",function(){
				var theater_no = $(this).attr("data-theater_no");
				$("#btnSeatingModify").attr("data-theater_no", theater_no); 
				
				$("#btnSeatingModify").click(function(){
					var theater_seatNum = $("#modify_theater_seatNum").val();
					var theater_no = $(this).attr("data-theater_no");
					var sendData = {
							"theater_no" : theater_no,
							"theater_seatNum" : theater_seatNum
					};
					var url ="/administerPage/seatSettingModify";
					$.get(url, sendData, function(rData){
						console.log("rData : "+ rData);
						if(rData == "success"){
							alert("수정 성공");
							$("#btnSeatingCansle").trigger("click");
							$("#theaterRoomList").trigger("click");	
						}
					});
				});
			});
			//영화관 삭제
			$(document).on("click",".btnSeatingDelete",function(){
				var choose = confirm("삭제하시겠습니까?");
				if(choose == "ture"){
					var theater_no = $(this).attr("data-theater_no");
					var url = "/administerPage/seatSettingDelete"
						var sendData = {
							"theater_no" : theater_no
					};
					console.log("theater_no: "+theater_no);
					$.get(url, sendData, function(rData){
		 				console.log("rData: "+rData);
						if (rData == "success") {
							alert("영화관삭제완료.");
							$("#theaterRoomList").trigger("click");	
						}
		 			});
				}
			});
		});
	</script>	
</body>
</html>