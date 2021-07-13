<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
	
</script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="container">
	<div class="contact-head">
		<div class="row">
			<%@ include file="../include/menu_side_bar_mypage.jsp"%>
			<div class="col-lg-8 col-12">
				<div class="form-main">
					<div class="title">

						<div class="jumbotron"
							style="background-color: rgba(0, 255, 255, 0.8)">

							<h2>게시글 확인</h2>
							<br>
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#home">내가쓴글</a></li>

							</ul>

							<!-- Tab panes -->
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<thead>
											<tr>
												<th>구분</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>내용</th>
												<th>글쓴날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="messageVo" items="${list}">
												<tr>
													<td>${member.msg_no}</td>
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
			<%@ include file="../include/footer.jsp"%>