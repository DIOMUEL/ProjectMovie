<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		//연도 선택시 스케줄의 영화 상영일 호출/서비스에서 스케줄의 영화관넘버로 지역넘버넘기기
		$(document).on("change", "#movieSchedule_registTime", function(){
			$(".movieName").attr("disabled", false);
		});
		//영화 선택 - 상영일과 영화를 통해 지역 호출
		$(document).on("change", ".movieName", function(){
			var movie_name = $(this).val();
			var yymmdd = $("#movieSchedule_registTime").val();
			var yy = yymmdd.substr(2, 2);
			var mm = yymmdd.substr(5, 2);
			var dd = yymmdd.substr(8, 2);
			var movieSchedule_registTime = yy +"/"+ mm +"/"+ dd;
			var url = "/ticketingPage/ticketingSchedule";
			var sendData = {
					"movie_name" : movie_name,
					"movieSchedule_registTime" : movieSchedule_registTime
			};
			console.log("movieSchedule_registTime"+ movieSchedule_registTime);
			$.get(url, sendData, function(rData){
				var arrAREA_THEATER_NO = new Array();
				var arrTHEATER_NO = new Array();
				var arrMOVIESCHEDULE_PLAYTIME = new Array();
				for(i=0; i<rData.length; i++){
					arrAREA_THEATER_NO[i] = rData[i].area_theater_no;		
					arrTHEATER_NO[i] = rData[i].theater_no;		
					arrMOVIESCHEDULE_PLAYTIME[i] = rData[i].movieschedule_playtime;		
				};
// 				$(".selectArea").children('option:not(:first)').remove();
// 				var arrName = new Array();//[.......]
// 				var arrNo = new Array();
// 				for(i=0; i<rData.length; i++){
// 					arrName[i] = rData[i].area_name;		
// 					arrNo[i] = rData[i].area_no;		
// 				};
	
// 				$.each(arrName, function(key, value) { 
// 					$(".selectArea").append($("<option></option>").attr("class", "arrNo").text(value)); 	
// 				});
// 				for(i=0; i<rData.length; i++){
// 					$(".arrNo:eq("+ i +")").attr("value", arrNo[i]);  
// 				};
// 				$("#movieSchedule_registTime").attr("disabled", false);
			});		
		});
		//그연도에 있는 지역들 호출
		//지역 선택시 거기에맞는 영화관 지역 호출
		//
// 		//지역선택시 영화관 열림
// 		$(document).on("change", ".selectArea", function(){
// 			var area_no = $(this).val();
// 			var url = "/ticketingPage/ticketingArea";
// 			var sendData = {
// 					"area_no" : area_no
// 			};
// 			$.get(url, sendData, function(rData){
// 				$(".selectAreaTheaterName").children('option:not(:first)').remove();
// 				var arrName = new Array();//[.......]
// 				var arrNo = new Array();
// 				for(i=0; i<rData.length; i++){
// 					arrName[i] = rData[i].area_theater_name;		
// 					arrNo[i] = rData[i].area_theater_no;		
// 				};
	
// 				$.each(arrName, function(key, value) { 
// 					$(".selectAreaTheaterName").append($("<option></option>").attr("class", "arrNo").text(value)); 	
// 				});
// 				for(i=0; i<rData.length; i++){
// 					$(".arrNo:eq("+ i +")").attr("value", arrNo[i]);  
// 				};
// 				$(".selectAreaTheaterName").attr("disabled", false);
// 			});
// 		});
// 		//영화관 선택시 영화이름 열림
// 		$(document).on("change", ".selectAreaTheaterName", function(){
// 			$(".movieName").attr("disabled", false);
// 		});
// 		//관 선택시 그날 스케줄 열림
// 		$(document).on("change", ".selectTheaterName", function(){
// 			$(".selectMovieSchedule").attr("disabled", false);
// 		});
		
		$('#btnReserve').click(function() {
			var result = confirm('정말 예약하시겠습니까?');
			if (result) {
				$("form:first").submit();
			}
		});
		$('#btnReturn').click(function() {
			var result = confirm('메인 페이지로 돌아갑니다.');
			if (result == true) {
				location.href = "/board/mainPage";
			}
		});
	});
</script>
</head>
<body>
	<div id="schdlContainer">
		<div class="container">
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row" style="padding:20px;text-align:left;">
					<h3>예매 시간표</h3>
					<div class="reserve theater-list-box" style="margin-top:50px;">
						<div class="tab-block tab-layer mb30">
							<!-- 날짜 셀랙트 -->
							<input type="date" class="form-control form-Read movieSchedule_registTime" id="movieSchedule_registTime" />
							<!-- 영화이름 셀랙트 -->
							<select class="movieName" name="movieName">
								<option value="0" selected>--영화 선택--</option>
								<c:forEach items="${movieList}" var="movieList">
									<option value="${movieList.movie_name}">${movieList.movie_name}</option>
								</c:forEach>
							</select>
							<!-- 지역 셀랙트 -->
							<select class="selectArea" name="selectArea">
								<option value="0" selected>--지역--</option>
							</select>
							<!-- 지역-영화관 셀랙트 -->
<!-- 							<select class="selectAreaTheaterName" name="AreatheaterName"> -->
<!-- 								<option value="0" selected>--지역영화관--</option> -->
<!-- 							</select> -->
							
							<!-- 지역-영화관+영화이름+날짜- 관 셀랙트 -->
<!-- 							<select class="selectTheaterName" name="theaterName"> -->
<!-- 								<option value="0" selected>--영화관명--</option> -->
<!-- 							</select> -->
							<!-- 지역-영화관+영화이름+날짜-관-스케줄 셀랙트 -->
<!-- 							<select class="selectMovieSchedule" name="movieSchedule"> -->
<!-- 								<option value="0" selected>--상영일시--</option> -->
<!-- 							</select> -->
						</div>
					</div>
					<button class="btn btn-primary" id="btnReserve" value="예약">예약</button>
					<button class="btn btn-warning" id="btnReturn" value="취소">취소</button>
				</div>
			</div>	
		</div>
	</div>		
	
</body>
</html>