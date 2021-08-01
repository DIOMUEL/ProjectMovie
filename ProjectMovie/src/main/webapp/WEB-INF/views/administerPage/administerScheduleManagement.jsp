<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="administerHeader.jsp"%>
<%@ page import = "java.util.Calendar" %>

<style>
.custom_calendar_table{
	text-align: center;
}
.table{
	text-align: center;
}
.custom_calendar_table td {
	text-align: left;
	vertical-align: top;
	border:1px solid green;
}

.custom_calendar_table thead.cal_date th {
	font-size: 1.5rem;
}

.custom_calendar_table thead.cal_date th button {
	font-size: 1.5rem;
	background: none;
	border: none;
}

.custom_calendar_table thead.cal_week th {
	background-color: #288CFF;
	color: #fff;
}

.custom_calendar_table tbody td {
	cursor: pointer;
}

.custom_calendar_table tbody td:nth-child(1) {
	color: red;
}

.custom_calendar_table tbody td:nth-child(7) {
	color: #288CFF;
}

.custom_calendar_table tbody td.select_day {
	background-color: #288CFF;
	color: #fff;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-md-12">	
		 		
			<div class="modal fade" id="modal-container-512696" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">추가 스케줄 양식</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div>
								<label for="managerSchedule_title"><strong>해야 할 일</strong></label>
								<input type="text" class="form-control" id="managerSchedule_title" placeholder="입력할 할일"/>
							</div>
							<div>
								<label for="managerSchedule_content"><strong>내용</strong></label>
								<input type="text" class="form-control" id="managerSchedule_content" placeholder="자세한 내용"/>
							</div>
						</div>
						<div class="modal-footer">							 
							<button type="button" class="btn btn-primary" id="btnAddSchedule">추가</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnCancle">취소</button>
						</div>
					</div>					
				</div>				
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-9 col-md-8 col-12">
			<div id="calendarForm"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-9 col-md-8 col-12">
			<table class="table">
				<thead>
					<tr>
						<th>오늘일정</th>
						<th>해야할일</th>
						<th>내용</th>
						<th>완료여부</th>
						<th><a id="modal-512696" href="#modal-container-512696" role="button" class="btn btn-success" data-toggle="modal">일정 추가</a></th>
					</tr>
				</thead>
				<tbody id="tableTbody">
					<c:forEach items="${todaylist}" var="todaylist">
					<tr>
						<td>${todaylist.managerSchedule_no}</td>
						<td>${todaylist.managerSchedule_title}</td>
						<td>${todaylist.managerSchedule_content}</td>
						<c:choose>
							<c:when test="${todaylist.managerSchedule_complete == 'N'}">
								<td><input type="checkbox" class="checkbox" id="checkbox" name="checkbox" value="checkbox" data-no="${todaylist.managerSchedule_no}" data-year="${todaylist.managerSchedule_year}" data-month="${todaylist.managerSchedule_month}" data-date="${todaylist.managerSchedule_date}"></td>
							</c:when>
							<c:otherwise>
							 	<td><input type="checkbox" class="checkbox" id="checkbox" name="checkbox" value="checkbox" checked></td>
							</c:otherwise>
						</c:choose>
						<td><button class="btn-primary deleteSchedule">삭제</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<table>
				<tbody id="cloneTbody" style="display:none">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="checkbox" class="checkbox" id="checkbox" name="checkbox" value="checkbox"></td>
						<td><button class="btn-primary deleteSchedule" >삭제</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	calendarMaker($("#calendarForm"), new Date());
	
	var today = new Date();
	var date = today.getDate();
// 	console.log("today:"+today);
// 	console.log("date:"+date);
	$("#"+date).attr("style", "background-color:#93bf85;color:#fff;");
	$("#"+date).attr("class", "select_day");

		
	//스케줄 추가할때 숨은정보 모달창에 보내기
	$("#modal-512696").click(function(){
// 		console.log("클릭됨");
		var data_year = $(".select_day").attr("data-year");
		var data_month = $(".select_day").attr("data-month");
		var data_date = $(".select_day").attr("data-date");
// 		console.log(data_year);
// 		console.log(data_month);
// 		console.log(data_date);
 		$("#btnAddSchedule").attr("data-year",data_year);
 		$("#btnAddSchedule").attr("data-month",data_month);
 		$("#btnAddSchedule").attr("data-date",data_date);
	});
	$("#btnAddSchedule").click(function() {
		var managerSchedule_year = $(this).attr("data-year");
		var managerSchedule_month = $(this).attr("data-month");
		var managerSchedule_date = $(this).attr("data-date");
		
		var managerSchedule_title = $("#managerSchedule_title").val();
		var managerSchedule_content = $("#managerSchedule_content").val();
		var sendData = {
				"managerSchedule_year" : managerSchedule_year,
				"managerSchedule_month" : managerSchedule_month,
				"managerSchedule_date" : managerSchedule_date,
				"managerSchedule_title" : managerSchedule_title,
				"managerSchedule_content" : managerSchedule_content
		};
		var url = "/administerPage/administerAddSchedule";

		$.get(url, sendData, function(rData){
			//console.log("rData: "+rData);
			if (rData == "success") {
				alert("스케줄 추가 완료.");
				$("#btnCancle").trigger("click");
			};
		});
	});
	//체크박스 클릭시 데이터베이스 YN 업데이트
	$(document).on("click", ".checkbox", function() {
// 		console.log("클릭됨");
		var managerSchedule_no = $(this).attr("data-no");
		var managerSchedule_year = $(this).attr("data-year");
		var managerSchedule_month = $(this).attr("data-month");
		var managerSchedule_date = $(this).attr("data-date");
		var managerSchedule_complete = $(this).attr("checked");
		if(managerSchedule_complete == null){
			$(this).attr("checked", true);
			managerSchedule_complete = "Y";
		}else if(managerSchedule_complete == "checked"){
			$(this).attr("checked", false);
			managerSchedule_complete = "N";
		}
// 		console.log(managerSchedule_no);
// 		console.log(managerSchedule_year);
// 		console.log(managerSchedule_month);
// 		console.log(managerSchedule_date);
// 		console.log(managerSchedule_complete);
		
		var url = "/administerPage/administerCheckBoxClick";
		var sendData = {
				"managerSchedule_no" : managerSchedule_no,
				"managerSchedule_year" : managerSchedule_year,
				"managerSchedule_month" : managerSchedule_month,
				"managerSchedule_date" : managerSchedule_date,
				"managerSchedule_complete" : managerSchedule_complete
		}
		$.get(url, sendData, function(rData){
			console.log("rData : ", rData);
		});
	});
	//삭제클릭시 해당 스케줄 삭제
	$(document).on("click", ".deleteSchedule", function() {
		//console.log("클릭됨");
		var managerSchedule_no = $(this).parent().parent().find(".checkbox").attr("data-no");
		var managerSchedule_year = $(this).parent().parent().find(".checkbox").attr("data-year");
		var managerSchedule_month = $(this).parent().parent().find(".checkbox").attr("data-month");
		var managerSchedule_date = $(this).parent().parent().find(".checkbox").attr("data-date");
		
		var sendData = {
				"managerSchedule_no" : managerSchedule_no,
				"managerSchedule_year" : managerSchedule_year,
				"managerSchedule_month" : managerSchedule_month,
				"managerSchedule_date" : managerSchedule_date
		};
		var url = "/administerPage/administerDeleteSchedule";

		$.get(url, sendData, function(rData){
			console.log(rData);
		});
	});
});

	var nowDate = new Date();
	function calendarMaker(target, date) {
		if (date == null || date == undefined) {
			date = new Date();
		}
		nowDate = date;
		if ($(target).length > 0) {
			var year = nowDate.getFullYear();
			var month = nowDate.getMonth() + 1;
			$(target).empty().append(assembly(year, month));
		} else {
			console.error("custom_calendar Target is empty!!!");
			return;
		}
		
		var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
		var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);

		var tag = "<tr>";
		var cnt = 0;
		//빈 공백 만들어주기
		for (i = 0; i < thisMonth.getDay(); i++) {
			tag += "<td style='height:75px;'></td>";
			cnt++;
		}

		//날짜 채우기
		for (i = 1; i <= thisLastDay.getDate(); i++) {
			if (cnt % 7 == 0) {
				tag += "<tr>";
			}
			var today = new Date();
			var thisyear = today.getFullYear();
			var thismonth = today.getMonth();
			
			tag += "<td style='height:75px;' id='"+ i +"' data-year='"+ thisyear + "' data-month='"+ thismonth +"' data-date='"+ i + "'>" + i + "</td>";
			cnt++;
			if (cnt % 7 == 0) {
				tag += "</tr>";
			}
		}
		$(target).find("#custom_set_date").append(tag);
		calMoveEvtFn();

		function assembly(year, month) {
			var calendar_html_code = "<table class='custom_calendar_table'>"
					+ "<colgroup>"
					+ "<col style='width:150px;'/>"
					+ "<col style='width:150px;'/>"
					+ "<col style='width:150px;'/>"
					+ "<col style='width:150px;'/>"
					+ "<col style='width:150px;'/>"
					+ "<col style='width:150px;'/>"
					+ "<col style='width:150px;'/>"
					+ "</colgroup>"
					+ "<thead class='cal_date' style='text-align:center;'>"
					+ "<th><button type='button' class='prev'><</button></th>"
					+ "<th colspan='5'><p><span>"
					+ year
					+ "</span>년 <span>"
					+ month
					+ "</span>월</p></th>"
					+ "<th><button type='button' class='next'>></button></th>"
					+ "</thead>"
					+ "<thead  class='cal_week' style='width:150px;'>"
					+ "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>"
					+ "</thead>" + "<tbody id='custom_set_date'>" + "</tbody>"
					+ "</table>";
			return calendar_html_code;
		}

		function calMoveEvtFn() {
			//전달 클릭
			$(".custom_calendar_table").on("click", ".prev", function() {
				nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
				calendarMaker($(target), nowDate);
			});
			//다음달 클릭
			$(".custom_calendar_table").on("click", ".next", function() {
				nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
				calendarMaker($(target), nowDate);
			});
			//일자 선택 클릭
			$(".custom_calendar_table").on("click", "td", function() {
				$(".custom_calendar_table .select_day").removeClass("select_day");
				$(this).removeClass("select_day").addClass("select_day");
				var thisdate = $(this).text();
				$(".table > thead > tr > th:eq(0)").text(thisdate + "일 일정");
				
				var managerSchedule_year = $(this).attr("data-year");
				var managerSchedule_month = $(this).attr("data-month");
				var managerSchedule_date = $(this).attr("data-date");
				
				var sendData = {
						"managerSchedule_year" : managerSchedule_year,
						"managerSchedule_month" : managerSchedule_month,
						"managerSchedule_date" : managerSchedule_date
				};
				var url = "/administerPage/administerSearchSchedule";

				$.get(url, sendData, function(rData){
					//console.log("rData: ",rData);
					var arrYN = new Array();
					for(i=0; i<rData.length; i++){
						arrYN[i] = rData[i].managerSchedule_complete;	
						if(arrYN[i] == 'N'){
							arrYN[i] = false;
						}else if(arrYN[i] == 'Y'){
							arrYN[i] = true;
						}
					};
// 					console.log("arrYN[0]"+ arrYN[0]);
// 					console.log("arrYN[1]"+ arrYN[1]);
// 					console.log("arrYN[2]"+ arrYN[2]);
// 					console.log("arrYN[3]"+ arrYN[3]);
					var cloneTr;
					var YN = 0;
					
					// -> 기존에 달려 있던 리스트들 모두 삭제
					$("#tableTbody > tr").remove();
					$.each(rData, function() {
						cloneTr = $("#cloneTbody > tr").clone();
						var td = cloneTr.find("td");
						td.eq(0).text(this.managerSchedule_no);
						td.eq(1).text(this.managerSchedule_title);
						td.eq(2).text(this.managerSchedule_content);
						td.find(".checkbox").attr("checked", arrYN[YN]);
						td.find(".checkbox").attr("data-no", this.managerSchedule_no);
						td.find(".checkbox").attr("data-year", this.managerSchedule_year);
						td.find(".checkbox").attr("data-month", this.managerSchedule_month);
						td.find(".checkbox").attr("data-date", this.managerSchedule_date);

						$("#tableTbody").append(cloneTr);
						cloneTr.show("slow");
						YN++;
					});
				});
			});
		}
	}
</script>
</body>
</html>
