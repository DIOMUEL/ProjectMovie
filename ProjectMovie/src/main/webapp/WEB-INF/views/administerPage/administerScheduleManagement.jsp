<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<th>체크여부</th>
						<th><button class="btn btn-success">일정추가</button></th>
					</tr>
				</thead>
				<tbody id="tableTbody">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
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

			tag += "<td style='height:75px;' id='"+ i + "'>" + i + "</td>";
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
			});
		}
	}
</script>
</body>
</html>
