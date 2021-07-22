<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href=".././resources/mainPage/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href=".././resources/mainPage/css/styles.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color:black">
		<div class="container">
			<a class="navbar-brand" href="/board/mainPage">
			<img src=".././resources/mainPage/assets/img/navbar-logo.svg" alt="..." /></a>
			<!-- <button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				메뉴 <i class="fas fa-bars ms-1"></i>
			</button> -->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
			<!-- 로그인이 안되어있는경우 -->
					<c:choose>
						<c:when test="${empty sessionScope.loginVo}">
							<li class="nav-item"><a class="nav-link" href="/board/mainPage#services">서비스</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/noticeBoardPage">고객게시판</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/loginPage">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/registForm">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="/board/mainPage#services">서비스</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/noticeBoardPage">고객게시판</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/ticketingPage">예매하기</a></li>
							<li class="nav-item dropdown no-arrow">
								<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
									<span class="mr-2 d-none d-lg-inline text-gray-600 small">"${sessionScope.loginVo.user_name}"님</span> 
										<img class="img-profile rounded-circle" width="35" src=".././resources/images/undraw_profile.svg"/>
								</a> <!-- Dropdown - User Information -->
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
									<c:choose>
										<c:when test="${sessionScope.loginVo.user_name != 'admin'}">
										<a class="dropdown-item" href="/mypage/management"> 
											<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>My페이지
										</a> 
										</c:when>
										<c:otherwise>
										<a class="dropdown-item" href="/administerPage/administerMainPage"> 
											<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>관리페이지
										</a> 
										</c:otherwise>
									</c:choose>
									<a class="dropdown-item" href="/mypage/message"> 
										<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>메세지
									</a> 
									<a class="dropdown-item" href="/mypage/purchase_history_movie"> 
										<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>구매내역
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/board/logout"> 
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>로그아웃
									</a>
								</div>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>