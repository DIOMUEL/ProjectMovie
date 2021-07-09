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
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
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
							<li class="nav-item"><a class="nav-link" href="#services">서비스</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/noticeBoardPage">고객게시판</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/loginPage">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/registForm">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="#services">서비스</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/noticeBoardPage">고객게시판</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/ticketingPage">예매</a></li>
							<li class="nav-item"><a class="nav-link" href="/board/logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>