<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function(){
	//지역 셀렋트박스 호출
	var url = "/noticeBoard/searchingArea";
	$.get(url, function(rData){
		console.log(rData);
		$(".selectAreaName").children('option:not(:first)').remove();
		var arrName = new Array();//[.......]
		var arrNo = new Array();
		for(i=0; i<rData.length; i++){
			arrName[i] = rData[i].area_name;		
			arrNo[i] = rData[i].area_no;		
		};
	
		$.each(arrName, function(key, value) { 
			$(".selectAreaName").append($("<option></option>").attr("class", "arrNo").text(value)); 	
		});
		for(i=0; i<rData.length; i++){
			$(".arrNo:eq("+ i +")").attr("value", arrNo[i]); 
		};
	});
	//지역에따른 영화관 호출
	$(document).on("click",".selectAreaName",function(){
		var that = $(this);
		var area_no = $(this).val();
		var url = "/noticeBoard/searchingTheater";
		var sendData = {
				"area_no" : area_no
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
		});
	});
	

	
	$("#btnWrite").click(function(){
		
		b_title = $("#b_title").val();
		if(b_title == ""){
			alert("제목을 입력해 주세요");
			return false;
		}
		b_content = $("#b_content").val();
		if(b_content == ""){
			alert("내용을 입력해주세요")
			return false;
		}
		
	});
	
});
</script>
<title>Insert title here</title>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<section class="page-section bg-light">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">

					<div class="jumbotron" style="background-color: black;">
						<h2 style="color: white;">글쓰기</h2>
						<br>
					</div>

					<form id="frmWrite" role="form"
						action="/noticeBoard/noticeBoardWriteRun" method="post">
						<label for="exampleFormControlInput" class="form-label">제목</label>
						<input type="text" class="form-control" id="b_title" name="b_title" /> 
					<br>	
						<label for="exampleFormControlInput" class="form-label">지역</label>
						<div class="form-check">
							<select class="selectAreaName" name="b_area">
								<option value="0" selected>--지역명--</option>
							</select>
						</div>
						
						<label for="exampleFormControlInput" class="form-label">영화관</label>
						<div class="form-check">
							<select class="selectTheaterName" name="b_theater">
								<option value="0" selected>--영화관--</option>
							</select>
						</div>
					<br>	
						<label for="exampleFormControlInput" class="form-label">구분</label>	
						<div class="form-check">
							<select name="b_division">
							   <option value="공지">공지</option>
							   <option value="기타">기타</option>
							</select>
						</div>		
					<br>		
						<label for="exampleFormControlTextarea" class="form-label">내용</label>
						<textarea class="form-control" id="b_content" name="b_content" rows="3"></textarea>
						<div>
							<button type="submit" class="btn btn-success" id="btnWrite">작성완료</button>
						</div>
					</form>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</div>
</section>




<%@ include file="../include/footer.jsp"%>