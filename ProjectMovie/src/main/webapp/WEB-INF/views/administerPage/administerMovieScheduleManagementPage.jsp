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
										<tbody>
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
													<div class="td-ab">
														<div class="txt-center">
															<a href="/administerPage/administerMovieScheduleRegistPage" class="btn btnAddSchedule" id="btnAddSchedule">일정 추가</a>
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
			var sendData = {
					"area_theater_no" : area_theater_no
			};
			console.log("area_theater_no : "+ area_theater_no);
			$.get(url, sendData, function(rData){
 				console.log("rData : "+ rData);
 				var clone_Namelist;
 				var div;
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
					var btnAddSchedule = clone_nameList.find(".btnAddSchedule");
					btnAddSchedule.attr("href", "/administerPage/administerMovieScheduleRegistPage?theater_seatNum=" + this.theater_seatNum);
					div.append(clone_nameList);
					clone_nameList.show();
				});
 			});
		});
	});
</script>

</body>
</html>