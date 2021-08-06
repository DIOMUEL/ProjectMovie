<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
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
				$(".selectTheaterName").attr("disabled", false);
			});
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
							<select class="selectArea" name="selectArea">
								<option value="0" selected>--지역--</option>
								<c:forEach items="${areaVo}" var="areaVo">
									<option value="${areaVo.area_no}">${areaVo.area_name}</option>
								</c:forEach>
							</select>
							<select class="movieName" name="movieName">
								<option value="0" selected>--영화 선택--</option>
								<c:forEach items="${movieList}" var="movieList">
									<option value="${movieList.movie_name}">${movieList.movie_name}</option>
								</c:forEach>
							</select>
							<select class="selectTheaterName" name="theaterName" disabled>
								<option value="0" selected>--영화관명--</option>
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