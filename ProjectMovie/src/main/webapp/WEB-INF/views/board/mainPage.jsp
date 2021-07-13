<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
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
</style>
<title>메인메뉴</title>
<script>
$(document).ready(function(){
	var user_name = "${user_name}";
	console.log(user_name);
	var msgLoginMember = "${msgLoginMember}";
	console.log(msgLoginMember);
	if(msgLoginMember == "success"){
		alert("환영합니다. "+ user_name + "님.");
	}
});
</script>
	<!-- 메인 화면-->
	<header class="masthead">
		<div class="container">
			<div class="masthead-subheading">영화 광고</div>
			<div class="masthead-heading text-uppercase">영화 간략 소개</div>
		</div>
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
					<p class="text-muted"><a href="/moiveintro/Movie1-1">영화 정보보기</a></p>
				</div>
				<div class="col-md-4">
					<img class="img-fluid" src=".././resources/mainPage/assets/img/portfolio/movie1-2.jpg" alt="..." />
					<h4 class="my-3">푸치니 투란도트</h4>
					<p class="text-muted"><a href="/moiveintro/Movie1-2">영화 정보보기</a></p>
				</div>
				<div class="col-md-4">
					<img class="img-fluid" src=".././resources/mainPage/assets/img/portfolio/movie1-3.jpg" alt="..." />
					<h4 class="my-3">메이드 인 루프탑</h4>
					<p class="text-muted"><a href="/moiveintro/Movie1-3">영화 정보보기</a></p>
				</div>
			</div>
		</div>
	</section>
	<!-- 상영중인 영화-->
	<section class="page-section bg-light" id="portfolio">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">상영중인 영화</h2>
				<h3 class="section-subheading text-muted">신작</h3>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 1-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack1.jpg" alt="..." />
								</div>
							</div> 
							<img class="img-fluid" style="width:100%; height:100%;" src=".././resources/mainPage/assets/img/portfolio/movie1.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">분노의 질주 (더 얼티메이트)</div>
							<div class="portfolio-caption-subheading text-muted"><a href="/movieintro/Movie1">영화 정보보기</a></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 2-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack2.jpeg" alt="..." />
								</div>
							</div> 
							<img class="img-fluid" style="width:100%; height:100%;" src=".././resources/mainPage/assets/img/portfolio/movie2.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">미드나이트</div>
							<div class="portfolio-caption-subheading text-muted"><a href="/movieintro/Movie2">영화 정보보기</a></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 3-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack3.jpg" alt="..." />
								</div>
							</div> <img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movie3.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">컨저링3</div>
							<div class="portfolio-caption-subheading text-muted"><a href="/movieintro/Movie3">영화 정보보기</a></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
					<!-- Portfolio item 4-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal4">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack4.jpg" alt="..." />
								</div>
							</div> <img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movie4.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">블랙 위도우</div>
							<div class="portfolio-caption-subheading text-muted"><a href="/movieintro/Movie4">영화 정보보기</a></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
					<!-- Portfolio item 5-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal5">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack5.jpg" alt="..." />
								</div>
							</div> <img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movie5.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">시카다 3301</div>
							<div class="portfolio-caption-subheading text-muted"><a href="/movieintro/Movie5">영화 정보보기</a></div>
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
									<img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack6.jpg" alt="..." />
								</div>
							</div> <img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movie6.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">바르다가 사랑한 얼굴들</div>
							<div class="portfolio-caption-subheading text-muted"><a href="/movieintro/Movie6">영화 정보보기</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 영화관 소개 -->
	<section class="page-section" id="about">
		<div class="container">
			<div class="text-center">
			<!-- https://www.megabox.co.kr/specialtheater/dolby 참고 -->
				<h2 class="section-heading text-uppercase" style="font-weight:bolder">영화관 소개</h2>
			</div>
			<ul class="timeline">
				<li>
					<div class="timeline-image">
						<img class="rounded-circle img-fluid" src=".././resources/mainPage/assets/img/about/4D.jpg"
							alt="..." />
					</div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h3 style="font-weight:bolder">4D</h3>
							<h4 class="subheading" style="font-family:'Monoton';">GET INTO THE ACTION.</h4> 
							<h5>영화속의 생동감을 온몸으로 느끼다.</h5>
							<!-- 사진 누르면 소개페이지로 이동 -->
						</div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image">
						<img class="rounded-circle img-fluid" src=".././resources/mainPage/assets/img/about/IMAX.jpg"
							alt="..." />
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
						<img class="rounded-circle img-fluid" src=".././resources/mainPage/assets/img/about/PremiumSeat.jpg"
							alt="..." />
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
						<img class="rounded-circle img-fluid" src=".././resources/mainPage/assets/img/about/SoundX.jpg"
							alt="..." />
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
						<h4>
							Be Part <br /> Of Our <br /> MovieTheater
						</h4>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<!-- Team-->
	<section class="page-section bg-light" id="services">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">멤버쉽 관리</h2>
			</div>
			<div class="row">
				<div class="col-lg-3">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src=".././resources/mainPage/assets/img/team/point.png"
							alt="..." />
						<h4>포인트</h4>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src=".././resources/mainPage/assets/img/team/sale.jpg"
							alt="..." />
						<h4>할인안내</h4>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src=".././resources/mainPage/assets/img/team/membership.jpg"
							alt="..." />
						<h4>멤버쉽</h4>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src=".././resources/mainPage/assets/img/team/VIP.jpg"
							alt="..." />
						<h4>Vip</h4>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<p class="large text-muted">Lorem ipsum dolor sit amet,
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
<%@ include file="../include/footer.jsp" %>