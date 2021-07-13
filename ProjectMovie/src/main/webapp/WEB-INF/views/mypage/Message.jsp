<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<br>
<br>
<br>
<br>

<section class="page-section bg-light">

	<div class="container">
		<div class="contact-head">
			<div class="row">
				<%@ include file="../include/menu_side_bar_mypage.jsp"%>
				<div class="col-lg-8 col-12">
					<div class="form-main">
						<div class="title">

							<div class="jumbotron"
								style="background-color: rgba(0, 255, 255, 0.8)">

								<h2>쪽지 함</h2>
								<br>
								<!-- Nav tabs -->
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#home">보낸쪽지함</a></li>
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#menu1">받은 쪽지함</a></li>
								</ul>

								<!-- Tab panes -->
								<div class="row">
									<div class="col-md-12">
										<table class="table">
											<thead>
												<tr>
													<th>#</th>
													<th>쪽지내용</th>
													<th>보낸사람</th>
													<th>보낸날짜</th>
													<th>읽은날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="messageVo" items="${list}">
													<tr>
														<td>${messageVo.msg_no}</td>
														<td></td>
														<td>${messageVo.msg_sender}</td>
														<td>${messageVo.msg_senddate}</td>
														<td></td>
													</tr>
												</c:forEach>
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
</section>
<%@ include file="../include/footer.jsp"%>