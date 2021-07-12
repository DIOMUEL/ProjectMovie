<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="col-md-12">
	<div class="row">
		<div class="col-md-6">
			<div class="jumbotron">
				<h2>Hello, world!</h2>
				<p></p>
				<p>
					<a class="btn btn-primary btn-large" href="#">Learn more</a>
				</p>
			</div>
		</div>
		<div class="col-md-6">
			<img alt="Bootstrap Image Preview"
				src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
		</div>
	</div>
</div>
<div class="container">
	<div class="contact-head">
		<div class="row">
			<%@ include file="../include/menu_side_bar_mypage.jsp"%>
			<div class="col-lg-8 col-12">
				<div class="form-main">
					<div class="title">

						<div class="jumbotron"
							style="background-color: rgba(0, 255, 255, 0.8)">

							<h2>포인트 확인</h2>
							<br>
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">

								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#menu1">포인트</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<thead>
											<tr>
												<th>일자</th>
												<th>구분</th>
												<th>내용</th>
												<th></th>
												<th>포인트</th>
											</tr>
										</thead>
										<tbody>

											<tr>
												<td>${messageVo.msg_no}</td>
												<td></td>
												<td>${messageVo.msg_sender}</td>
												<td>${messageVo.msg_senddate}</td>

												<td></td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
							<br>
						</div>
						<div class="col-lg-3"></div>

					</div>
				</div>
			</div>
			<%@ include file="../include/footer.jsp"%>