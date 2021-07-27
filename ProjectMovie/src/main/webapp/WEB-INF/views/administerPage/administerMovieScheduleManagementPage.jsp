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
									<button class="btn btnAreaVo" value="${areaVo.area_no}">${areaVo.area_name}</button>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="theater-list" style="display:none">
						<div class="theater-area-click list" id="list">
							<br>
							<div class="btn btn-outline-primary thn">영화관명</div>
						</div>
					</div>
					<div class="theater-list NameList" id="NameList" style="display:none">
						<div class="theater-type-box">
							<div class="theater-type">
								<p class="theater-name">제0관</p>
								<p class="totalChair">총 좌석</p>
							</div>
							<div class="theater-time">
								<div class="theater-time-box">
									<table class="time-list-table">
										<colgroup>
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
										</colgroup>
										<tbody id="movieSchedule">
											<tr>
												<td>
													<div class="td-ab">
														<div class="txt-center">
															<a href="#">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="playTime">시작시간</p>
																<p class="remainChair">남은 좌석</p>
																<div class="play-time">
																	<p>언제부터 언제까지</p>
																	<p>몇회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td>
													<div class="td-ab" style="vertical-align:middle;">
														<div class="txt-center" >
															<form role="form" action="/administerPage/administerMovieScheduleRegistPage" method="get">
																<div class="form-group">
																	<input type="hidden" class="form-control seat" id="seat" name="seat"/>
																</div>
																<div class="form-group">
																	<input type="hidden" class="form-control area_theater_no" id="area_theater_no" name="area_theater_no"/>
																</div>
																<button class="submit btn btn-outline-primary btnAddSchedule" id="btnAddSchedule">일정 추가</button>
															</form>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<link rel="stylesheet" href="../resources/administerPage/css/megabox.min.css" media="all">
<!-- Bootstrap core JavaScript-->
<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
	$(document).ready(function(){
		//등록 성공했을때
		var msgRegist = "${msgRegist}";
		if(msgRegist == "success"){
			alert("등록성공");
		}
		//영화관 리스트
		$(".btnAreaVo").click(function(){
			var that = $(this);
			var area_no = $(this).val();
			var url = "/administerPage/administerGetAreaTheaterList";
			var sendData = {
					"area_no" : area_no
			};
			//console.log("area_no : "+ area_no);
			$.get(url, sendData, function(rData){
// 				console.log("rData : "+ rData);
				var clone_list;
				var div;
				$.each(rData, function() {
					div = that.parent().parent().parent();
					//console.log("div : "+div)
					clone_list = $("#list").clone();
					$("#list").remove("id");
// 					console.log("clone_list : "+ clone_list);
					var thn = clone_list.find(".thn");
					thn.text(this.area_theater_name);
					thn.attr("data-area_theater_no", this.area_theater_no);
					div.append(clone_list);
					clone_list.show();
				});
			});
		});	
		//영화관 관 및 좌석 리스트
		$(document).on("click",".thn",function(){
			var that = $(this);
			var area_theater_no = $(this).attr("data-area_theater_no");
			var url = "/administerPage/administerGetTheaterNameList";
			var url2 = "/administerPage/administerGetMovieScheduleList";
			var sendData = {
					"area_theater_no" : area_theater_no
			};
			//console.log("area_theater_no : "+ area_theater_no);
			//영화관 관 및 좌석 리스트
			$.get(url, sendData, function(rData){
 				//console.log("rData : "+ rData);
 				var clone_Namelist;
 				var div;
 				//$(".NameList").remove();
 				$.each(rData, function() {
					div = that.parent();
					//console.log("div : "+div)
					clone_nameList = $("#NameList").clone();
					$("#NameList").remove("id");
// 					console.log("clone_list : "+ clone_list);
					var theaterName = clone_nameList.find(".theater-name");
					theaterName.text(this.theater_name);
					var totalChair = clone_nameList.find(".totalChair");
					totalChair.text("총 좌석 : " + this.theater_seatNum);
					var seat = clone_nameList.find(".seat");
					seat.val(this.theater_seatNum);
					var area_theater_no = clone_nameList.find(".area_theater_no");
					area_theater_no.val(this.area_theater_no);
					div.append(clone_nameList);
					clone_nameList.show();
				});
 			});
			//각영화관마다의 영화스케줄 얻어오기
			$.get(url2, sendData, function(rData2){
				//console.log("rData2 : "+ rData2);
				var clone_ScheduleList;
				var div;
				$.each(rData2, function() {
					div = that.parent().children().children().children().children().children().children("td:eq(0)");
					//$(".thn").parent().children().children().children().children().children().children().children("td");
					clone_ScheduleList = $("#movieSchedule > tr").clone();
					$("#movieSchedule").remove("id");
					var playTime = clone_ScheduleList.find(".playTime");
					playTime.text(this.movieSchedule_totalPlayTime);
					var remainChair = clone_ScheduleList.find(".remainChair");
					remainChair.text(this.movieSchedule_seat);
					var play_time = clone_ScheduleList.find(".play-time");
					play_time.text(this.movieSchedule_playTime);
					div.append(clone_ScheduleList);
					//clone_ScheduleList.insertAfter(div);
					clone_ScheduleList.show();
				});
			});
		});
	});
</script>
</body>
</html>