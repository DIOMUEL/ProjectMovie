<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

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
								style="background-color:black;">

								<h2 style="color: white;">음식 구매내역</h2>
								<br>
								<!-- Nav tabs -->


								<!-- Tab panes -->
								<div class="row">
									<div class="col-md-12">
										<table class="table" style="color: white;">
											<thead>
												<tr>
													<th>구분</th>
													<th>상품명</th>
													<th>가격</th>
													<th>구매일자</th>
													
												</tr>
											</thead>
											<tbody>
												<c:forEach var="buyFoodVo" items="${list}">
													<tr>
														<td>${buyFoodVo.bf_no}</td>
														<td>${buyFoodVo.bf_foodname}</td>
														<td>${buyFoodVo.bf_price}원</td>
														<td>${buyFoodVo.bf_datepurch}</td>														
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