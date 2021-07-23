<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="administerHeader.jsp" %>

<div class="container-fluid">
	<!-- 지역명 수정 모랄 -->
	<div class="row">
		<div class="col-md-12">
			<div class="modal fade" id="modal-container-112288" role="dialog" aria-labelledby="myMoidfyAreaName" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myMoidfyAreaName">수정할 지역명</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="text" class="form-control" id="areaModifyName" placeholder="수정할 지역명을 입력해 주세요"/>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"  id="btnModifyArea">수정</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnModifyCancle">취소</button>
						</div>
					</div>	
				</div>	
			</div>
		</div>
	</div>
	<!-- 영화관 추가 모랄 -->
	<div class="row">
		<div class="col-md-12">
			<div class="modal fade" id="modal-container-107905" role="dialog" aria-labelledby="myAddTheaterName" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myAddTheaterName">추가할 영화관 이름</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="text" class="form-control" id="theaterAddName" placeholder="등록할 영화관명을 입력해 주세요"/>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="btnAddTheater">등록</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnAddCancle">취소</button>
						</div>
					</div>					
				</div>				
			</div>			
		</div>
	</div>
	<!-- 영화관 수정 모랄 -->
	<div class="row">
		<div class="col-md-12">
			<div class="modal fade" id="modal-container-975549" role="dialog" aria-labelledby="mytheaterModifyName" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myTheaterModifyName">수정할 영화관</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="text" class="form-control" id="theaterModifyName" placeholder="수정할 영화관 이름을 입력해 주세요"/>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="btnModifyTheater">수정</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnCancleTheater">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<section>
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-8 col-12">
				<div class="row">
					<div class="col-12">
						<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
							<h4 class="title">영화관 관리_지역 등록</h4>
						</div>
						<form id="frmArea" role="form" action="/administerPage/administerMovieAreaRegistRun" method="get">
							<div class="form-group" style="vertical-align:middle;">
								<label for="area_name"><strong>지역 이름</strong></label>
								<input type="text" class="form-control" id="area_name" name="area_name" placeholder="지역 이름 도+시 ex)경기 화성"/>
							</div>
							<button type="submit" class="btn btn-primary">등록하기</button>
							<button type="button" class="btn btn-primary" id="btnShowAreaList">목록보기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section>
		<div class="container" style="display:none" id="listDisplay">
			<div class="row">
				<div class="col-lg-9 col-md-8 col-12">
					<div class="row">
						<div class="col-12">
							<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
								<h4 class="title">영화관 관리_지역 조회</h4>
							</div>
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<table class="table">
											<thead>
												<tr>
													<th>#</th>
													<th>지역</th>
													<td>영화관명</td>
													<th>수정</th>
													<th>삭제</th>
												</tr>
											</thead>
											<tbody>
												<tr id="addTheaterList" style="display:none;">
													<td></td>
													<td></td>
													<td></td>
													<td><a class="btn-primary testM" style="color: white;">수정</a></td>
													<td><a class="btn-danger testD" style="color: white;">삭제</a></td>
												</tr>
												<c:forEach items="${areaVo}" var="areaVo">
													<tr>
														<td>${areaVo.area_no}</td>
														<td>${areaVo.area_name}</td>
														<td><a class="btn-primary area_no btnShowTheaterList" style="color: white;" data-area_no="${areaVo.area_no}">더보기▼</a></td>
														<td><a href="#modal-container-112288" class="btn-primary modifyArea" data-area_no="${areaVo.area_no}" data-toggle="modal" style="color:white">수정</a></td>
														<td><a class="btn-danger btnDeleteArea" style="color:white" data-area_no="${areaVo.area_no}">삭제</a></td>
														<td><a href="#modal-container-107905" class="btn-warning addTheater" data-area_no="${areaVo.area_no}" data-toggle="modal" style="color:white">영화관추가</a></td>
													</tr>
												</c:forEach>
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
	</section>
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script>
	$(function() {
		// 지역등록
		var result = "${result}";
		if(result == "success") {
			alert("등록성공.");
		}		
		// 지역등록 할 때
		$("#frmArea").submit(function() {
			var area_name = $("#area_name").val().trim();
			if(area_name == null) {
				alert("비어있는 정보가 있습니다. 다시 확인해주세요.");
				return false;
			}
		});
		//지역리스트 활성화
		$("#btnShowAreaList").click(function(){
			$("#listDisplay").attr("style", "");
		});
//지역명 수정 삭제		
		// 지역 수정 모달 링크로 데이터 넘기기
		$(".modifyArea").click(function() {
	 		var area_no = $(this).attr("data-area_no");
	 		$("#btnModifyArea").attr("data-area_no", area_no); 
		});
		// 수정된 지역명 보내기 버튼
		$("#btnModifyArea").click(function() {
			var area_name = $("#areaModifyName").val();
			var area_no = $(this).attr("data-area_no");
			var sendData = {
					"area_no" : area_no,
					"area_name" : area_name
			};
			var url = "/administerPage/administerMovieAreaModifyRun";
			//console.log("sendData: "+ sendData);
			//console.log("area_no: "+ area_no);
			//console.log("area_name: "+ area_name);
 			$.get(url, sendData, function(rData){
 				//console.log("rData: "+rData);
				if (rData == "success") {
					alert("지역명수정완료.");
					$("#btnModifyCancle").trigger("click");
					location.href ="/administerPage/administerMovieAreaManagement"
				}
 			});
		});
		//지역 삭제
		$(".btnDeleteArea").click(function(){
			var area_no = $(this).attr("data-area_no");
			var url = "/administerPage/administerMovieAreaDeleteRun"
				var sendData = {
					"area_no" : area_no
			};
			//console.log("area_no: "+area_no);
			$.get(url, sendData, function(rData){
 				//console.log("rData: "+rData);
				if (rData == "success") {
					alert("지역명삭제완료.");
					location.href ="/administerPage/administerMovieAreaManagement"
				}else if(rData == "false"){
					alert("해당 지역 안에 영화관이 남아있습니다. \n해당지역 안의 모든 영화관을 삭제 후 실행해주세요");
				}
 			});
		});
		
//영화관 추가 수정 삭제
		// 영화관 추가 모달 링크로 데이터 넘기기
		$(".addTheater").click(function() {
	 		var area_no = $(this).attr("data-area_no");
			$("#btnAddTheater").attr("data-area_no", area_no); 
		});
		// 영화관 이름 보내기 버튼
		$("#btnAddTheater").click(function() {
			var area_theater_name = $("#theaterAddName").val();
			var area_no = $(this).attr("data-area_no");
			var sendData = {
					"area_no" : area_no,
					"area_theater_name" : area_theater_name
			};
			var url = "/administerPage/administerMovieAreaTheaterRegistRun";
			//console.log("sendData: "+ sendData);
			$.get(url, sendData, function(rData){
				//console.log("rData: "+rData);
				if (rData == "success") {
					alert("영화관등록완료.");
					$("#btnAddCancle").trigger("click");
					$(".btnShowTheaterList").trigger("click");
				}
			});
		});
		//영화관 이름 수정
		$(document).on("click",".testM",function(){
			var area_theater_no = $(this).attr("data-area_theater_no");
			$("#btnModifyTheater").attr("data-area_theater_no", area_theater_no); 
			
			$("#btnModifyTheater").click(function() {
				var area_theater_no = $(this).attr("data-area_theater_no");
				//console.log("클릭됨 : " + area_theater_no);
				var area_theater_name = $("#theaterModifyName").val();
				var sendData = {
						"area_theater_no" : area_theater_no,
						"area_theater_name" : area_theater_name
				};
				var url = "/administerPage/administerMovieAreaTheaterModifyRun";
				//console.log("sendData: "+ sendData);
				//console.log("area_theater_no: "+ area_theater_no);
				//console.log("area_theater_name: "+ area_theater_name);
	 			$.get(url, sendData, function(rData){
	 				//console.log("rData: "+rData);
					if (rData == "success") {
						alert("영화관이름수정완료.");
						$("#btnCancleTheater").trigger("click");
						location.href ="/administerPage/administerMovieAreaManagement"
					}
	 			});
			});
		});
		//영화관 삭제
		$(document).on("click",".testD",function(){
			var area_theater_no = $(this).attr("data-area_theater_no");
			var url = "/administerPage/administerMovieAreaTheaterDeleteRun"
				var sendData = {
					"area_theater_no" : area_theater_no
			};
			//console.log("area_theater_no: "+area_theater_no);
			$.get(url, sendData, function(rData){
 				//console.log("rData: "+rData);
				if (rData == "success") {
					alert("영화관삭제완료.");
					location.href ="/administerPage/administerMovieAreaManagement"
				}
 			});
		});
		//더보기 버튼스위치 및 리스트 생성
		$(document).on("click",".btnShowTheaterList",function(){
			var that = $(this);
			
			var area_no = $(this).attr("data-area_no");
			var url = "/administerPage/administerMovieAreaTheaterList";
			var sendData = {
					"area_no" : area_no
			};
			$.get(url, sendData, function(rData) {
				//console.log("rData: "+rData);
				var clone_tr;
				var tr;
				$.each(rData, function() {
					tr = that.parent().parent();
					//console.log(tr)
					clone_tr = $("#addTheaterList").clone();
					clone_tr.removeAttr("id");
					//console.log(clone_tr);
					var td = clone_tr.find("td");
					td.eq(0).text();
					td.eq(1).text(this.area_theater_no);
					td.eq(2).text(this.area_theater_name);
					td.eq(3).children().attr("data-area_theater_no", this.area_theater_no);
					td.eq(3).children().attr("href", "#modal-container-975549");
					td.eq(3).children().attr("data-toggle", "modal");
					td.eq(4).children().attr("data-area_theater_no", this.area_theater_no);
					clone_tr.insertAfter(tr);
					clone_tr.show();
				});
			});
		});
	});
	</script>
</body>
</html>