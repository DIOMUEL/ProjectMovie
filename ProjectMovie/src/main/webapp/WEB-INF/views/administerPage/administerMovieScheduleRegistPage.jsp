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
				<h2>영화 상영 일정 등록 페이지입니다.</h2>
				<p>요구대는 사항에 맞게 작성하신 후 등록을 눌러주세요</p>
			</div>
			<form role="form" action="/administerPage/administerMovieScheduleRegistRun" method="post">
				<div class="form-group">
				<label for="movieSchedule_type">영화 타입</label>
					<select class="movieType" id="movieSchedule_type" name="movieSchedule_type" required>
						<option value="0" selected>--영화 타입--</option>
					   	<option value="2D">2D</option>	   
					   	<option value="2D(자막)">2D(자막)</option>	   
					   	<option value="3D">3D</option>	   
					   	<option value="3D(자막)">3D(자막)</option>	
					   	<option value="4D">4D</option>	   
					   	<option value="4D(자막)">4D(자막)</option>
					   	<option value="IMAX">IMAX</option>	   
					   	<option value="PREMIUM">PREMIUM</option>	   	   
					</select>
				</div>
				<div class="form-group">
					<label for="movie_name">상영할 영화</label>
					<select class="movie_name" id="movie_name" name="movie_name" required>
						<option value="0" selected>--영화 선택--</option>	 
						<c:forEach items="${movieVo}" var="movieVo">
							<option>${movieVo.movie_name}</option>
						</c:forEach>  	   
					</select>
				</div>
				<div class="form-group">
					<input type="hidden" class="form-control" id="area_theater_no" name="area_theater_no" value="${area_theater_no}"/>
				</div>
				<div class="form-group">
					<label for="lastTime">현재 마지막 상영시간</label>
					<input type="text" class="form-control" id="lastTime" name="lastTime"  value="${movieScheduleVo.lastTime}" readOnly/>
				</div>
				<div class="form-group">
					<label for="movieSchedule_playTime">상영시간</label>
					<input type="text" class="form-control" id="movieSchedule_playTime" name="movieSchedule_playTime" placeholder="시작시간 ~끝나는 시간 예)시작시간 =전편 끝난시간 +청소시간(15분)"/>
				</div>
				<div class="form-group">
					<label for="movieSchedule_totalPlayTime">상영시간</label>
					<input type="text" class="form-control" id="movieSchedule_totalPlayTime" name="movieSchedule_totalPlayTime" readOnly/>
				</div>
				<div class="form-group">
					<label for="movieSchedule_seat">총 좌석</label>
					<input type="number" class="form-control" id="movieSchedule_seat" name="movieSchedule_seat" value="${seat}" readOnly/>
				</div>
				<button type="submit" class="btn btn-primary">등록</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
$(function () {
	var theater_seatNum = "${theater_seatNum}";
	console.log("theater_seatNum: "+ theater_seatNum);
	$("#movie_name").change(function(){
		var movie_name = $("#movie_name").val();
		//console.log("movie_name : " + movie_name);
		var url = "/administerPage/administerGetMovieInfo";
		var sendData = {
				"movie_name" : movie_name
		};
		$.get(url, sendData, function(rData){
			//console.log("rData: "+ rData);
			var movie_name = rData.movie_name;
			var movieSchedule_totalPlayTime = rData.movie_total_time;
			//console.log("movie_name: "+ movie_name);
			//console.log("movie_total_time: "+ movie_total_time);
			$("#movieSchedule_totalPlayTime").val(movieSchedule_totalPlayTime);
		});
	});
});
</script>
</body>
</html>