<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>관리자 페이지</title>
<!-- Custom fonts for this template-->
<link href=".././resources/administerPage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/resources/administerPage/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/administerPage/administerMainPage">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					관리자님<br> 환영합니다.
				</div>
			</a>
			<!-- Nav Item - Dashboard -->
			<li class="nav-item active">
				<a class="nav-link" href="index.html"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a>
			</li>
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>영화 관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">영화:</h6>
						<a class="collapse-item" href="/administerPage/administerMovieListPage">조회</a> 
						<a class="collapse-item" href="/administerPage/administerMovieRegistPage">등록</a>
					</div>
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">영화관:</h6>
						<a class="collapse-item" href="/administerPage/administerMovieAreaManagement">지역 관리</a> 
						<a class="collapse-item" href="/administerPage/administerMovieTheaterSeatSetting">영화관 관리</a> 
					</div>
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">상영일정:</h6>
						<a class="collapse-item" href="/administerPage/adminiserMovieScheduleManagementPage">상영 일정 관리</a> 
					</div>
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">영화 상품:</h6>
						<a class="collapse-item" href="#">영화 상품 조회</a> 
					</div>
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">매점 상품:</h6>
						<a class="collapse-item" href="/administerPage/administerStoreManagement">상품 관리</a> 
						<a class="collapse-item" href="/administerPage/administerStoreRegist">상품 등록</a> 
					</div>
				</div>
			</li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> 
				<i class="fas fa-fw fa-wrench"></i> 
				<span>스케줄</span>
				</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">스케줄 설정 및 유지:</h6>
						<a class="collapse-item" href="utilities-color.html">스케줄 관리</a> <a
							class="collapse-item" href="utilities-border.html">오늘 할일</a> <a
							class="collapse-item" href="utilities-animation.html">메시지 관리</a>
						<a class="collapse-item" href="utilities-other.html">게시판 관리</a>
					</div>
				</div>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">차트 설정</div>

			<!-- Nav Item - Pages Collapse Menu -->
			
			<!-- Nav Item - Charts -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#"
					data-toggle="collapse" data-target="#collapsePages"
					aria-expanded="true" aria-controls="collapsePages"> 
					<i class="fas fa-fw fa-chart-area"></i> 
					<span>Charts</span>
				</a>
			<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">영화 관련:</h6>
						<a class="collapse-item" href="/administerPage/totalMovieChart">총 수익</a> 
						<a class="collapse-item" href="#">장르별 수익</a> 
						<a class="collapse-item" href="#">영화별 수익</a>
						<a class="collapse-item" href="#">월별 수익</a>
						<a class="collapse-item" href="#">주별 수익</a>
						<a class="collapse-item" href="#">일별 수익</a>
					<div class="collapse-divider"></div>
						<h6 class="collapse-header">매점 관련:</h6>
						<a class="collapse-item" href="#">총 수익</a> 
						<a class="collapse-item" href="#">음료별 수익</a> 
						<a class="collapse-item" href="#">음식별 수익</a>
						<a class="collapse-item" href="#">월별 수익</a>
						<a class="collapse-item" href="#">주별 수익</a>
						<a class="collapse-item" href="#">일별 수익</a>
					</div>
				</div>
			</li>
			<!-- Nav Item - Tables -->
			<li class="nav-item">
				<a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> 
					<span>Tables</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

			<!-- Sidebar Message -->
			<div class="sidebar-card d-none d-lg-flex">
				<img class="sidebar-card-illustration mb-2"
					src=".././resources/administerPage/img/undraw_rocket.svg" alt="...">
				<p class="text-center mb-2">
					<strong>광고</strong> 관리자용 광고
				</p>
				<a class="btn btn-success btn-sm"
					href="https://startbootstrap.com/theme/sb-admin-pro">광고로 업글!</a>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link color" style="color:black" href="/board/mainPage#services">서비스</a></li>
						<li class="nav-item"><a class="nav-link color" style="color:black" href="/board/noticeBoardPage">고객게시판</a></li>
						<li class="nav-item"><a class="nav-link color" style="color:black" href="/board/ticketingPage">예매하기</a></li>
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">"${sessionScope.loginVo.user_name}"님</span> 
									<img class="img-profile rounded-circle" width="35" src=".././resources/images/undraw_profile.svg"/>
							</a> <!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="/administerPage/administerMainPage"> 
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>관리페이지
								</a> 
								<a class="dropdown-item" href="/mypage/Message"> 
									<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>메세지
								</a> 
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/board/logout"> 
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>로그아웃
								</a>
							</div>
						</li>
					</ul>
				</nav>
			</div>
	<!-- End of Topbar -->