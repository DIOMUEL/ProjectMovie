<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		//지역선택시 영화관 열림
		$(document).on("change", ".selectArea", function(){
			var area_no = $(this).val();
			var url = "/ticketingPage/ticketingArea";
			var sendData = {
					"area_no" : area_no
			};
			$.get(url, sendData, function(rData){
				$(".selectAreaTheaterName").children('option:not(:first)').remove();
				var arrName = new Array();//[.......]
				var arrNo = new Array();
				for(i=0; i<rData.length; i++){
					arrName[i] = rData[i].area_theater_name;		
					arrNo[i] = rData[i].area_theater_no;		
				};
	
				$.each(arrName, function(key, value) { 
					$(".selectAreaTheaterName").append($("<option></option>").attr("class", "arrNo").text(value)); 	
				});
				for(i=0; i<rData.length; i++){
					$(".arrNo:eq("+ i +")").attr("value", arrNo[i]);  
				};
				$(".selectAreaTheaterName").attr("disabled", false);
			});
		});
		//영화관 선택시 영화이름 열림
		$(document).on("change", ".selectAreaTheaterName", function(){
			$(".movieName").attr("disabled", false);
		});
		//영화 이름 선택시 날짜 열림
		$(document).on("change", ".movieName", function(){
			var movie_name = $(this).val();
			var url = "/ticketingPage/ticketingArea";
			var sendData = {
					"movie_name" : movie_name
			};
			$.get(url, sendData, function(rData){
				$(".selectTheaterName").children('option:not(:first)').remove();
				var arrName = new Array();//[.......]
				var arrNo = new Array();
				for(i=0; i<rData.length; i++){
					arrName[i] = rData[i].area_theater_name;		
					arrNo[i] = rData[i].area_theater_no;		
				};
	
				$.each(arrName, function(key, value) { 
					$(".selectTheaterName").append($("<option></option>").attr("class", "arrNo").text(value)); 	
				});
				for(i=0; i<rData.length; i++){
					$(".arrNo:eq("+ i +")").attr("value", arrNo[i]);  
				};
				$("#movieSchedule_registTime").attr("disabled", false);
			});		
		});
		//날짜 선택시 관 열림
		$(document).on("change", "#movieSchedule_registTime", function(){
			$(".selectTheaterName").attr("disabled", false);
		});
		//관 선택시 그날 스케줄 열림
		$(document).on("change", ".selectTheaterName", function(){
			$(".selectMovieSchedule").attr("disabled", false);
		});
		
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
							<!-- 지역 셀랙트 -->
							<select class="selectArea" name="selectArea">
								<option value="0" selected>--지역--</option>
								<c:forEach items="${areaVo}" var="areaVo">
									<option value="${areaVo.area_no}">${areaVo.area_name}</option>
								</c:forEach>
							</select>
							<!-- 지역-영화관 셀랙트 -->
							<select class="selectAreaTheaterName" name="AreatheaterName" disabled>
								<option value="0" selected>--지역영화관--</option>
							</select>
							<!-- 영화이름 셀랙트 -->
							<select class="movieName" name="movieName" disabled>
								<option value="0" selected>--영화 선택--</option>
								<c:forEach items="${movieList}" var="movieList">
									<option value="${movieList.movie_name}">${movieList.movie_name}</option>
								</c:forEach>
							</select>
							<!-- 날짜 셀랙트 -->
							<input type="date" class="form-control form-Read" id="movieSchedule_registTime" disabled/>
							<!-- 지역-영화관+영화이름+날짜- 관 셀랙트 -->
							<select class="selectTheaterName" name="theaterName" disabled>
								<option value="0" selected>--영화관명--</option>
							</select>
							<!-- 지역-영화관+영화이름+날짜-관-스케줄 셀랙트 -->
							<select class="selectMovieSchedule" name="movieSchedule" disabled>
								<option value="0" selected>--상영일시--</option>
							</select>
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