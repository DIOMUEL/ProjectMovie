<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="administerHeader.jsp"%>
<div id="schdlContainer">
	<div class="container">
		<div class="col-lg-9 col-md-8 col-12">
			<div class="row" style="padding:20px;text-align:left;">
				<h3>상영시간표</h3>
				<div class="movie-option mb20">
					<div class="option">
						<ul>
							<li><i class="iconset ico-stage" title="무대인사"></i>무대인사</li>
							<li><i class="iconset ico-user" title="회원시사"></i>회원시사</li>
							<li><i class="iconset ico-open" title="오픈시사"></i>오픈시사</li>
							<li><i class="iconset ico-goods" title="굿즈패키지"></i>굿즈패키지</li>
							<li><i class="iconset ico-singalong" title="싱어롱"></i>싱어롱</li>
							<li><i class="iconset ico-gv" title="GV"></i>GV</li>
							<li><i class="iconset ico-sun" title="조조"></i>조조</li>
							<li><i class="iconset ico-brunch" title="브런치"></i>브런치</li>
							<li><i class="iconset ico-moon" title="심야"></i>심야</li>
						</ul>
					</div>
				</div>
				<div class="reserve theater-list-box">
					<div class="tab-block tab-layer mb30">
						<ul>
							<c:forEach items="${areaVo}" var="areaVo">
								<li>
									<button class="btn selectArea" value="${areaVo.area_no}">${areaVo.area_name}</button>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div>
					<select class="selectTheaterName" name="theaterName">
						<option value="0" selected>--영화관명--</option>
					</select>
					<select class="selectTheater" name="theater">
						<option value="0" selected>--제0관--</option>
					</select>
					<button type="button" class="btn btn-primary" id="btnSearching">조회</button>
					<form id="frmSeatSetting" role="form" action="/administerPage/administerMovieScheduleRegistPage" method="get">
						<div class="form-group">
							<input type="hidden" class="form-control" id="area_theater_no" name="area_theater_no"/>
						</div>
						<div class="form-group">
							<input type="hidden" class="form-control" id="theater_no" name="theater_no"/>
						</div>
						<div class="form-group">
							<input type="hidden" class="form-control" id="theater_name" name="theater_name"/>
						</div>
						<div class="form-group"> 
							<input type="hidden" class="form-control" id="theater_seatNum" name="theater_seatNum"/>
						</div>
						<button type="submit" style="display:none" class="btn btn-primary" id="btnAddScheduleMovie">추가</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<section>
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
								<table class="table" style="text-align:center;height:auto;display:none;" id="movieScheduleTable">
									<thead>
										<tr>
											<th style="width:100px;">순서</th>
											<th style="width:100px;">영화타입</th>
											<th style="width:100px;">영화시간</th>
											<th style="width:100px;">총타임(분)</th>
											<th style="width:100px;">남은 좌석</th>
											<th style="width:100px;">등록일</th>
											<th style="width:100px;">수정</th>
										</tr>
									</thead>
									<tbody style="vertical-align:middle;table-layout:fixed;">
										<tr style="height:50px;vertical-align:middle;">
											<td style="vertical-align:middle;"></td>
											<td style="vertical-align:middle;"></td>
											<td style="vertical-align:middle;"></td>
											<td style="vertical-align:middle;"></td>
											<td style="vertical-align:middle;"></td>
											<td style="vertical-align:middle;"></td>
											<td style="vertical-align:middle;"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<link rel="stylesheet" href="../resources/administerPage/css/megabox.min.css" media="all">
<!-- Bootstrap core JavaScript-->
<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/resources/js/my-script.js"></script>
<script>
	$(document).ready(function(){
		//등록 성공했을때
		var msgRegist = "${msgRegist}";
		if(msgRegist == "success"){
			alert("등록성공");
		}
		//지역선택시 지역영화관이름 리스트 호출
		$(document).on("click",".selectArea",function(){
			var that = $(this);
			var area_no = $(this).val();
			//console.log("area_no : "+ area_no);
			var url = "/administerPage/seatSetting_callingTheater";
			var sendData = {
					"area_no" : area_no
			};
			$.get(url, sendData, function(rData){
				$(".selectTheaterName").children('option:not(:first)').remove();
//					console.log("rData : "+ rData);
//					console.log("rData[0] : "+ rData[0].area_theater_name);
				var arrName = new Array();//[.......]
				var arrNo = new Array();
				for(i=0; i<rData.length; i++){
					arrName[i] = rData[i].area_theater_name;		
					arrNo[i] = rData[i].area_theater_no;		
				};
//				console.log("rData.length : "+ rData.length);
//				console.log("arrNo[] : "+ arrNo[i]);

				$.each(arrName, function(key, value) { 
					$(".selectTheaterName").append($("<option></option>").attr("class", "arrNo").text(value)); 	
				});
				for(i=0; i<rData.length; i++){
//						console.log("rData.length : "+ rData.length);
//						console.log("i : "+ i);
//						console.log("arrNo[] : "+ arrNo[i]);
					$(".arrNo:eq("+ i +")").attr("value", arrNo[i]); 
					//$(".selectTheaterName").children("option:eq("+ i+1 +")").attr("value", arrNo[i]); 
				};
			});
		});
		//영화관이름 선택시 영화관 관명리스트 호출
		$(".selectTheaterName").change(function(){
			var area_theater_no = $(".selectTheaterName").val();
			var url = "/administerPage/callingTheaterRoomList";
			var sendData = {
					"area_theater_no" : area_theater_no
			};
			$.get(url, sendData, function(rData){
				$(".selectTheater").children('option:not(:first)').remove();
// 				console.log("rData : ", rData);
// 				console.log("rData[0] : "+ rData[0].area_theater_name);
 				var arrName = new Array();
 				var arrTNo = new Array();
 				var arrSeat = new Array();
				for(i=0; i<rData.length; i++){
					arrName[i] = rData[i].theater_name;		
					arrTNo[i] = rData[i].theater_no;		
					arrSeat[i] = rData[i].theater_seatNum;		
				};
// 				console.log("rData.length : "+ rData.length);
//  			console.log("arrTNo[] : "+ arrTNo[0]);
//  			console.log("arrSeat[] : "+ arrSeat[0]);

				$.each(arrName, function(key, value) { 
					$(".selectTheater").append($("<option></option>").attr("class", "arrTNo").text(value)); 	
				});
				for(i=0; i<rData.length; i++){
//					console.log("rData.length : "+ rData.length);
//					console.log("i : "+ i);
//					console.log("arrNo[] : "+ arrNo[i]);
					$(".arrTNo:eq("+ i +")").attr("value", arrTNo[i]); 
					$(".arrTNo:eq("+ i +")").attr("data-theater_seatNum", arrSeat[i]); 
					//$(".selectTheaterName").children("option:eq("+ i+1 +")").attr("value", arrNo[i]); 
				};
			});
		});
		//얻은값들 히든에 넣기
		$(".selectTheater").change(function(){
			var area_theater_no = $(".selectTheaterName").val();
			var theater_no = $(".selectTheater").val();
			var theater_name = $(".selectTheater option:checked").text();
			var theater_seatNum = $(".selectTheater option:checked").attr("data-theater_seatNum");
// 			console.log("area_theater_no: "+area_theater_no);
// 			console.log("theater_no: "+theater_no);
// 			console.log("theater_name: ", theater_name);
// 			console.log("theater_seatNum: ",theater_seatNum);
			$("#area_theater_no").attr("value", area_theater_no);
			$("#theater_no").attr("value", theater_no);
			$("#theater_name").attr("value", theater_name);
			$("#theater_seatNum").attr("value", theater_seatNum);
		});
		//관별 상영 리스트 조회
		$("#btnSearching").click(function(){
			$("#btnAddScheduleMovie").attr("style", "");
			$("#movieScheduleTable").attr("style", "text-align:center;height:auto;");
			var theater_no = $(".selectTheater").val();
			var url = "/administerPage/administerGetMovieScheduleList";
			var sendData = {
					"theater_no" : theater_no
			};
// 			console.log("theater_no : " + theater_no);
			$.get(url, sendData, function(rData){
 				console.log("rData : ", rData);
 				var cloneTr;
 				$("#movieScheduleTable > tbody > tr:gt(0)").remove();
				$.each(rData, function() {
					cloneTr = $("#movieScheduleTable > tbody > tr:first").clone();
					var td = cloneTr.find("td");
					td.eq(0).text(this.movieschedule_recoding);
					td.eq(1).text(this.movieSchedule_type);
					td.eq(2).text(this.movieSchedule_playTime);
					td.eq(3).text(this.movieSchedule_totalPlayTime);
					td.eq(4).text(this.movieSchedule_seat);
					td.eq(5).text(changeDateString(this.movieSchedule_registTime));
					$("#movieScheduleTable > tbody").append(cloneTr);
 					td.show();
				});
			});
		});
	});
</script>
</body>
</html>