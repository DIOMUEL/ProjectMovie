<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="administerHeader.jsp" %>
<!-- Bootstrap core JavaScript-->
<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
	$(document).ready(function(){
		//오늘 할일 리스트 퍼센트
		var today = new Date();
		var managerSchedule_year = today.getFullYear();
		var managerSchedule_month = today.getMonth()+1;
		var managerSchedule_date = today.getDate();
// 		console.log("year : ",year);
// 		console.log("month : ",month);
// 		console.log("date : ",date);
		var url ="/administerPage/administerCompleteSchedulePersent";
		var sendData = {
				"managerSchedule_year" : managerSchedule_year,
				"managerSchedule_month" : managerSchedule_month,
				"managerSchedule_date" : managerSchedule_date
		}
		$.get(url, sendData, function(rData){
			console.log(rData);
			var persentage = rData
			$(".persentage").text(persentage + "%");
			$(".persentageBar").attr("style", "width:"+persentage+"%");
		});
	});
	function showPopup() { 
		window.open("/administerPage/administerManagerSchedule", "pop", "width=600, height=450, left=700, top=300");
	}
</script>
<!-- Begin Page Content -->
<div class="container-fluid">
	<input type="hidden" id="label_rate20" value="${label_rate20}"/>
	<input type="hidden" id="label_rate30" value="${label_rate30}"/>
	<input type="hidden" id="label_rate40" value="${label_rate40}"/>
	<input type="hidden" id="label_rate50" value="${label_rate50}"/>
	<input type="hidden" id="label_rate60" value="${label_rate60}"/>
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">관리자 페이지</h1>
		<a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-download fa-sm text-white-50"></i> 리포트 생성하기
		</a>
		<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-sm text-white-50"></i> 야간모드
		</button>
	</div>
	<!-- Content Row -->
	<div class="row">
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-primary text-uppercase mb-1">
								목표 수익</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-calendar fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">
								이달 수익</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-info text-uppercase mb-1">오늘 할일
							</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800 persentage">70%</div>
								</div>
								<div class="col">
									<div class="progress progress-sm mr-2">
										<div class="progress-bar bg-info persentageBar" role="progressbar" style="width:90%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-auto">
							<a class="btn" onclick="showPopup();"><i class="fas fa-clipboard-list fa-2x text-gray-300"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Pending Requests Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">않읽은 메세지</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">${sessionScope.loginVo.notReadCount}</div>
						</div>
						<div class="col-auto">
							<a href="/administerPage/administerMessageBox"><i class="fas fa-comments fa-2x text-gray-300"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Content Row -->
	
	<div class="row">
	
		<!-- Area Chart -->
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">영화 배급및 수요량</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button"id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
							<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
							<div class="dropdown-header">수익별 태그:</div>
							<a class="dropdown-item" id="myTotal">총 수익</a> 
							<a class="dropdown-item" id="myGenre">장르별 수익</a>
							<a class="dropdown-item" id="myMovie">영화별 수익</a>
							<a class="dropdown-item" id="myMonth">달별 수익</a>
							<a class="dropdown-item" id="myWeek">주별 수익</a>
							<a class="dropdown-item" id="myDays">일별 수익</a>
						</div>
					</div>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-area">
						<canvas class="chart-change" id="myTotalAreaChart"></canvas>
						<canvas class="chart-change" id="myGenreAreaChart" style="display:none;"></canvas>
						<canvas class="chart-change" id="myMovieAreaChart" style="display:none;"></canvas>
						<canvas class="chart-change" id="myMonthAreaChart" style="display:none;"></canvas>
						<canvas class="chart-change" id="myWeekAreaChart" style="display:none;"></canvas>
						<canvas class="chart-change" id="myDaysAreaChart" style="display:none;"></canvas>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Pie Chart -->
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">나이별 영화관 이용량</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <i
							class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							aria-labelledby="dropdownMenuLink">
							<div class="dropdown-header">Dropdown Header:</div>
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-pie pt-4 pb-2">
						<canvas id="myPieChart"></canvas>
					</div>
					<div class="mt-4 text-center small">
						<span class="mr-2"> 
							<i class="fas fa-circle text-primary"></i>20대이하
						</span> 
						<span class="mr-2"> 
							<i class="fas fa-circle text-success"></i>30대
						</span> 
						<span class="mr-2"> 
							<i class="fas fa-circle text-info"></i>40대
						</span>
						<span class="mr-2"> 
							<i class="fas fa-circle text-warning"></i>50대
						</span>
						<span class="mr-2"> 
							<i class="fas fa-circle text-danger"></i>60대이상
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">매점 배급 및 수요량</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button"id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
							<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
							<div class="dropdown-header">수익별 태그:</div>
							<a class="dropdown-item" id="myTotal_store">총 수익</a> 
							<a class="dropdown-item" id="myDrink_store">음료별 수익</a>
							<a class="dropdown-item" id="myFood_store">음식별 수익</a>
							<a class="dropdown-item" id="myMonth_store">달별 수익</a>
							<a class="dropdown-item" id="myWeek_store">주별 수익</a>
							<a class="dropdown-item" id="myDays_store">일별 수익</a>
						</div>
					</div>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-area">
						<canvas class="chart-change" id="myTotalStoreAreaChart"></canvas>
						<canvas class="chart-change" id="myDrinkStoreAreaChart" style="display:none;"></canvas>
						<canvas class="chart-change" id="myFoodStoreAreaChart" style="display:none;"></canvas>
						<canvas class="chart-change" id="myMonthStoreAreaChart" style="display:none;"></canvas>
						<canvas class="chart-change" id="myWeekStoreAreaChart" style="display:none;"></canvas>
						<canvas class="chart-change" id="myDaysStoreAreaChart" style="display:none;"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Content Row -->
	<div class="row">
		<!-- Content Column -->
		<div class="col-lg-6 mb-4">
			<!-- Project Card Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
				</div>
				<div class="card-body">
					<h4 class="small font-weight-bold">
						20대이하 영화관 만족도 <span class="float-right">20%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-danger" role="progressbar"
							style="width: 20%" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						30-40대 영화관 만족도 <span class="float-right">40%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: 40%" aria-valuenow="40" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						50대이상 영화관 만족도 <span class="float-right">60%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar" role="progressbar"
							style="width: 60%" aria-valuenow="60" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						영화 배급량 <span class="float-right">80%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-info" role="progressbar"
							style="width: 80%" aria-valuenow="80" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						재고량 <span class="float-right">Complete!</span>
					</h4>
					<div class="progress">
						<div class="progress-bar bg-success" role="progressbar"
							style="width: 100%" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<!-- Color System -->
			<div class="row">
				<div class="col-lg-6 mb-4">
					<div class="card bg-primary text-white shadow">
						<div class="card-body">
							Primary
							<div class="text-white-50 small">#4e73df</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-success text-white shadow">
						<div class="card-body">
							Success
							<div class="text-white-50 small">#1cc88a</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-info text-white shadow">
						<div class="card-body">
							Info
							<div class="text-white-50 small">#36b9cc</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-warning text-white shadow">
						<div class="card-body">
							Warning
							<div class="text-white-50 small">#f6c23e</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-danger text-white shadow">
						<div class="card-body">
							Danger
							<div class="text-white-50 small">#e74a3b</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-secondary text-white shadow">
						<div class="card-body">
							Secondary
							<div class="text-white-50 small">#858796</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-light text-black shadow">
						<div class="card-body">
							Light
							<div class="text-black-50 small">#f8f9fc</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mb-4">
					<div class="card bg-dark text-white shadow">
						<div class="card-body">
							Dark
							<div class="text-white-50 small">#5a5c69</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="administerFooter.jsp" %>
