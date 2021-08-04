u<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"> 
<style>
@font-face {
  font-family: 'Monoton';
  font-style: normal;
  font-weight: 800;
  src: url('.././resources/fontStyle/Monoton-Regular.ttf') format('truetype');
}
@font-face {
  font-family: 'FrederickatheGreat';
  font-style: normal;
  font-weight: 800;
  src: url('.././resources/fontStyle/FrederickatheGreat-Regular.ttf') format('truetype');
}
@font-face {
  font-family: 'GravitasOne';
  font-style: normal;
  font-weight: 800;
  src: url('.././resources/fontStyle/GravitasOne-Regular.ttf') format('truetype');
}
@font-face {
  font-family: 'HennyPenny';
  font-style: normal;
  font-weight: 800;
  src: url('.././resources/fontStyle/HennyPenny-Regular.ttf') format('truetype');
}
 video { max-width:80%; display:block; margin:20px auto; }
</style>
<title>메인메뉴</title>
<script>
$(document).ready(function(){
	var mySwiper = new Swiper('.swiper-container', {
		// 슬라이드를 버튼으로 움직일 수 있습니다.
		navigation: {
		    nextEl: '.swiper-button-next',
		    prevEl: '.swiper-button-prev',
		},
		// 현재 페이지를 나타내는 점이 생깁니다. 클릭하면 이동합니다.
	 	pagination: {
		    el: '.swiper-pagination',
		    type: 'bullets',
		},
	// 현재 페이지를 나타내는 스크롤이 생깁니다. 클릭하면 이동합니다.
		scrollbar: {
			el: '.swiper-scrollbar',
			draggable: true,
		},
	// 10초마다 자동으로 슬라이드가 넘어갑니다. 1초 = 1000
		autoplay: {
			delay: 5000,
		},
	});
	var user_name = "${user_name}";
	//console.log(user_name);
	var msgLoginMember = "${msgLoginMember}";
	//console.log(msgLoginMember);
	if(msgLoginMember == "success"){
		alert("환영합니다. "+ user_name + "님.");
	}
});
</script>
<!-- 메인 화면-->
<header>
<br><br>
	<div class="swiper-container" style="background-color:#424242; height:auto;">
	    <div class="swiper-wrapper">
		    <div class="swiper-slide">
		        <video muted autoplay loop>
		            <source src="/resources/mainPage/assets/video/advertise2.mp4" type="video/mp4">
		        </video>
		    </div>
		    <div class="swiper-slide">
		        <video muted autoplay loop>
			        <source src="/resources/mainPage/assets/video/advertise3.mp4" type="video/mp4">
			    </video>
		    </div>
		    <div class="swiper-slide">
		        <video muted autoplay loop>
			        <source src="/resources/mainPage/assets/video/advertise4.mp4" type="video/mp4">
			    </video>
		    </div> 
		    <div class="swiper-slide">
		        <video muted autoplay loop>
			        <source src="/resources/mainPage/assets/video/advertise5.mp4" type="video/mp4">
			    </video>
		    </div> 
		    <div class="swiper-slide">
		        <video muted autoplay loop>
			        <source src="/resources/mainPage/assets/video/advertise6.mp4" type="video/mp4">
			    </video>
		    </div> 
		    <div class="swiper-slide">
		        <video muted autoplay loop>
			        <source src="/resources/mainPage/assets/video/advertise7.mp4" type="video/mp4">
			    </video>
		    </div> 
		    <div class="swiper-slide">
		        <video muted autoplay loop>
			        <source src="/resources/mainPage/assets/video/advertise8.mp4" type="video/mp4">
			    </video>
		    </div> 
			<div class="swiper-slide">
			    <video muted autoplay loop>
			     	<source src="/resources/mainPage/assets/video/advertise9.mp4" type="video/mp4">
				</video>
			</div> 
		</div>
		<!-- If we need pagination -->
	    <div class="swiper-pagination"></div>
	    <!-- If we need navigation buttons -->
	    <div class="swiper-button-prev"></div>
	    <div class="swiper-button-next"></div>
	    <div class="swiper-scrollbar"></div> 
	</div>
	<br><br>
</header>
	<!-- 금주 영화 포스터 및 소개-->
	<section class="page-section">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Movie selection</h2>
				<h3 class="section-subheading text-muted">금주의 인기 영화</h3>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
						<img class="img-fluid" src=".././resources/mainPage/assets/img/portfolio/movie1-1.jpg" alt="..." />
					<h4 class="my-3">웬디</h4>
					<p class="text-muted"><a href="/movieintro/Movie1_1">영화 정보</a></p>
				</div>
				<div class="col-md-4">
					<img class="img-fluid" src=".././resources/mainPage/assets/img/portfolio/movie1-2.jpg" alt="..." />
					<h4 class="my-3">푸치니 투란도트</h4>
					<p class="text-muted"><a href="/movieintro/Movie1_2">영화 정보</a></p>
				</div>
				<div class="col-md-4">
					<img class="img-fluid" src=".././resources/mainPage/assets/img/portfolio/movie1-3.jpg" alt="..." />
					<h4 class="my-3">메이드 인 루프탑</h4>
					<p class="text-muted"><a href="/movieintro/Movie1_3">영화 정보</a></p>
				</div>
			</div>
		</div>
	</section>
	<!-- 상영중인 영화-->
	<section class="page-section" style="background-color:#2F4F4F" id="portfolio">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase" style="color:white; font-weight:border;">상영중인 영화</h2>
				<h3 class="section-subheading text-muted">신작</h3>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 1-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movieBack1.jpg" alt="..." />
								</div>
							</div> 
							<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movie1.jpg" alt="..." />
						</a>
						<div class="portfolio-caption" style="background-color:#00ff0000">
							<div class="portfolio-caption-subheading text-muted"><a class="btn btn-primary" href="/movieintro/Movie1">영화 정보</a></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 3-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movieBack2.jpg" alt="..." />
								</div>
							</div> 
							<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movie2.jpg" alt="..." />
						</a>
						<div class="portfolio-caption" style="background-color:#00ff0000">
							<div class="portfolio-caption-subheading text-muted"><a class="btn btn-primary" href="/movieintro/Movie2">영화 정보</a></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 3-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movieBack3.jpg" alt="..." />
								</div>
							</div> 
							<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movie3.jpg" alt="..." />
						</a>
						<div class="portfolio-caption" style="background-color:#00ff0000">
							<div class="portfolio-caption-subheading text-muted"><a class="btn btn-primary" href="/movieintro/Movie3">영화 정보</a></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
					<!-- Portfolio item 5-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movieBack4.jpg" alt="..." />
								</div>
							</div>
							<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movie4.jpg" alt="..." />
						</a>
						<div class="portfolio-caption" style="background-color:#00ff0000">
							<div class="portfolio-caption-subheading text-muted"><a class="btn btn-primary" href="/movieintro/Movie4">영화 정보</a></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
					<!-- Portfolio item 5-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movieBack5.jpg" alt="..." />
								</div>
							</div> 
							<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movie5.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption" style="background-color:#00ff0000">
							<div class="portfolio-caption-subheading text-muted"><a class="btn btn-primary" href="/movieintro/Movie5">영화 정보</a></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<!-- Portfolio item 6-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal6">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movieBack6.jpg" alt="..." />
								</div>
							</div> 
							<img class="img-fluid" style="width:100%;border-radius:5%" src=".././resources/mainPage/assets/img/portfolio/movie6.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption" style="background-color:#00ff0000">
							<div class="portfolio-caption-subheading text-muted"><a class="btn btn-primary" href="/movieintro/Movie6">영화 정보</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 영화관 소개 -->
	<section class="page-section" style="background-color:#B8860B" id="about">
		<div class="container">
			<div class="text-center">
			<!-- https://www.megabox.co.kr/specialtheater/dolby 참고 -->
				<h2 class="section-heading text-uppercase" style="font-weight:bolder">영화관 소개</h2>
			</div>
			<ul class="timeline">
				<li>
					<div class="timeline-image">
						<a href="/introduce/introduce1"><img class="rounded-circle img-fluid" src=".././resources/mainPage/assets/img/about/4D.jpg"
							alt="..." /></a>
					</div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h3 style="font-weight:bolder">4DX</h3>
							<h4 class="subheading" style="font-family:'Monoton';">GET INTO THE ACTION.</h4> 
							<h5>영화속의 생동감을 온몸으로 느끼다.</h5>
							<!-- 사진 누르면 소개페이지로 이동 -->
						</div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image">
						<a href="/introduce/introduce2"><img class="rounded-circle img-fluid" src=".././resources/mainPage/assets/img/about/IMAX.jpg"
							alt="..." /></a>
					</div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h3 style="font-weight:bolder">IMAX</h3>
							<h4 class="subheading" style="font-family:'FrederickatheGreat';">ABSOLUTE IMMERSION</h4>
							<h5>재창조된 비주얼 가장 선명하고 실감나게 보다.</h5>
						</div>
					</div>
				</li>
				<li>
					<div class="timeline-image">
						<a href="/introduce/introduce3"><img class="rounded-circle img-fluid" src=".././resources/mainPage/assets/img/about/PremiumSeat.jpg"
							alt="..." /></a>
					</div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h3 style="font-weight:bolder">PremiumSeat</h3>
							<h4 class="subheading" style="font-family:'GravitasOne';">MORE COMFORTERABLE, MORE LUXURIOUSLY</h4>
							<h5> 더 편안하고 더 여유있음을 맛보다.</h5>
						</div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image">
						<a href="/introduce/introduce4"><img class="rounded-circle img-fluid" src=".././resources/mainPage/assets/img/about/SoundX.jpg"
							alt="..." /></a>
					</div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h3 style="font-weight:bolder">서라운드</h3>
							<h4 class="subheading" style="font-family:'HennyPenny';">ENJOY THE BEST POWER OVERWHERMING SOUND</h4>
							<h5>객체화된 각각의 사운드를 단 한자리에서 듣다.</h5>
						</div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image">
						<h4> Be Part <br/> Of Our <br/> MovieTheater </h4>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<!-- Team-->
	<section class="page-section" style="background-color:#4B0082" id="services">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading" style="color:white">멤버쉽 관리</h2>
			</div>
			<div class="row">
				<div class="col-lg-3">
					<div class="team-member">
						<a href = "/membership/membershipPage#point"><img class="mx-auto rounded-circle" style="border-color:black; cursor:pointer" src=".././resources/mainPage/assets/img/team/point.png"
							alt="..." /></a>
						<h4 style="color:white; cursor:pointer"><a href = "/membership/membershipPage#point">포인트</a></h4>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="team-member">
						<a href = "/membership/membershipPage#discount"><img class="mx-auto rounded-circle" style="border-color:black; cursor:pointer" src=".././resources/mainPage/assets/img/team/sale.jpg"
							alt="..." /></a>
						<h4 style="color:white; cursor:pointer"><a href = "/membership/membershipPage#discount">할인안내</a></h4>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="team-member">
						<a href = "/membership/membershipPage#membership"><img class="mx-auto rounded-circle" style="border-color:black; cursor:pointer" src=".././resources/mainPage/assets/img/team/membership.jpg"
							alt="..." /></a>
						<h4 style="color:white; cursor:pointer"><a href = "/membership/membershipPage#membership">멤버쉽</a></h4>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="team-member">
						<a href = "/membership/membershipPage#vip"><img class="mx-auto rounded-circle" style="border-color:gray; cursor:pointer" src=".././resources/mainPage/assets/img/team/VIP.jpg"
							alt="..." /></a>
						<h4 style="color:white; cursor:pointer"><a href = "/membership/membershipPage#vip">Vip</a></h4>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<p class="large text-muted" style="color:white">Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Aut eaque, laboriosam veritatis,
						quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- Clients-->
	<div class="py-5">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src=".././resources/mainPage/assets/img/logos/microsoft.svg" alt="..." /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src=".././resources/mainPage/assets/img/logos/google.svg" alt="..." /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src=".././resources/mainPage/assets/img/logos/facebook.svg" alt="..." /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src=".././resources/mainPage/assets/img/logos/ibm.svg" alt="..." /></a>
				</div>
			</div>
		</div>
	</div>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<%@ include file="../include/footer.jsp" %>