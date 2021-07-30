<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		var today = new Date();
		var managerSchedule_year = today.getFullYear();
		var managerSchedule_month = today.getMonth();
		var managerSchedule_date = today.getDate();
// 		console.log("year : ",year);
// 		console.log("month : ",month);
// 		console.log("date : ",date);
		var url ="/administerPage/administerTodayScheduleList";
		var sendData = {
				"managerSchedule_year" : managerSchedule_year,
				"managerSchedule_month" : managerSchedule_month,
				"managerSchedule_date" : managerSchedule_date
		}
		$.get(url, sendData, function(rData){
			console.log("rData : ",rData);
			var arrYN = new Array();
			for(i=0; i<rData.length; i++){
				arrYN[i] = rData[i].managerSchedule_complete;	
				if(arrYN[i] == 'N'){
					arrYN[i] = false;
				}else if(arrYN[i] == 'Y'){
					arrYN[i] = true;
				}
			};
//				console.log("arrYN[0]"+ arrYN[0]);
//				console.log("arrYN[1]"+ arrYN[1]);
//				console.log("arrYN[2]"+ arrYN[2]);
//				console.log("arrYN[3]"+ arrYN[3]);
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
</script>
<title>오늘자 할일 리스트</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-9 col-md-8 col-12">
			<table class="table">
				<thead>
					<tr>
						<th>오늘일정</th>
						<th>해야할일</th>
						<th>내용</th>
						<th>완료여부</th>
					</tr>
				</thead>
				<tbody id="tableTbody">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="checkbox" class="checkbox" id="checkbox" name="checkbox" value="checkbox" data-no="${todaylist.managerSchedule_no}" data-year="${todaylist.managerSchedule_year}" data-month="${todaylist.managerSchedule_month}" data-date="${todaylist.managerSchedule_date}"></td>
					</tr>
				</tbody>
			</table>
			<table>
				<tbody id="cloneTbody" style="display:none">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="checkbox" class="checkbox" id="checkbox" name="checkbox" value="checkbox"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>