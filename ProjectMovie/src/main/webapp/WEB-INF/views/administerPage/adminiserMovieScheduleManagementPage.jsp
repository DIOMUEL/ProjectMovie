<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="administerHeader.jsp"%>
<div id="schdlContainer">
	<div class="container">
		<div class="col-lg-9 col-md-8 col-12">
			<div class="row" style="padding:20px;text-align:left;">
				<h3>상영시간표</h3>
				<div class="movie-option mb20">
					<div class="option">
						<ul>
							<li><i class="iconset ico-stage" title="무대인사"></i>무대인사</li>
							<li><i class="iconset ico-user" title="회원시사"></i>회원시사</li>
							<li><i class="iconset ico-open" title="오픈시사"></i>오픈시사</li>
							<li><i class="iconset ico-goods" title="굿즈패키지"></i>굿즈패키지</li>
							<li><i class="iconset ico-singalong" title="싱어롱"></i>싱어롱</li>
							<li><i class="iconset ico-gv" title="GV"></i>GV</li>
							<li><i class="iconset ico-sun" title="조조"></i>조조</li>
							<li><i class="iconset ico-brunch" title="브런치"></i>브런치</li>
							<li><i class="iconset ico-moon" title="심야"></i>심야</li>
						</ul>
					</div>
				</div>
				<div class="reserve theater-list-box">
					<div class="tab-block tab-layer mb30">
						<ul>
							<li class="on">
								<a href="#" class="btn">서울</a>
							</li>
							<li>
								<a href="#" class="btn">경기</a>
							</li>
							<li>
								<a href="#" class="btn">인천</a>
							</li>
							<li>
								<a href="#" class="btn">대전/충청/세종</a>
							</li>
							<li>
								<a href="#" class="btn">부산/대구/경상</a>
							</li>
						</ul>
					</div>
					<div class="theater-list">
						<div class="theater-area-click">
							<a href="#" title="강남 상세보기">강남</a>
						</div>
						<div class="theater-type-box">
							<div class="theater-type">
								<p class="theater-name">2관</p>
								<p class="totalChair">총 103석</p>
							</div>
							<div class="theater-time">
								<div class="theater-type-area">2D(자막)</div>
								<div class="theater-time-box">
									<table class="time-list-table">
										<colgroup>
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
										</colgroup>
										<tbody>
											<tr>
												<td>
													<div class="td-ab">
														<div class="txt-center">
															<a href="#">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="playTime">16:45</p>
																<p class="remainChair">65석</p>
																<div class="play-time">
																	<p>16:45~18:42</p>
																	<p>4회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td>
													<div class="td-ab">
														<div class="txt-center">
															<a href="#">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="playTime">19:00</p>
																<p class="remainChair">65석</p>
																<div class="play-time">
																	<p>19:00~20:57</p>
																	<p>5회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td>
													<div class="td-ab">
														<div class="txt-center">
															<button class="btn">일정 추가</button>
														</div>
													</div>
												</td>
											</tr>
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
</div>
<link rel="stylesheet" href="../resources/administerPage/css/megabox.min.css" media="all">
<!-- Bootstrap core JavaScript-->
<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>


</body>
</html>