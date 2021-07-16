<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<script>

</script>
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
		
								<h2>영화예매 내역</h2>
								<br>
								<!-- Nav tabs -->


								<!-- Tab panes -->
								<div class="row">
									<div class="col-md-12">
										<table class="table">
											<thead>
												<tr>
													<th>구분</th>
													<th>영화제목</th>
													<th>가격</th>
													<th>구매일자</th>
													<th>비고</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="BuyMovieVo" items="${list}">
													<tr>
														<td>${BuyMovieVo.bm_no}</td>
														<td>${BuyMovieVo.bm_Moviename}</td>
														<td>${BuyMovieVo.bm_price}</td>
														<td>${BuyMovieVo.bm_datepurch}</td>
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