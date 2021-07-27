<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
	$(document).ready(function() {
		$(".pagination > li > a").click(function(e) {
			e.preventDefault(); // 페이지 이동 막기
			var page = $(this).attr("href");
			var frmPaging = $("#frmPaging");
			frmPaging.find("[name=page]").val(page);
			frmPaging.submit();
			// -> 주소창에 : http://localhost/board/listAll?page=1&perPage=10&searchType=&keyword=
		});
	});
</script>
<form id="frmPaging" action="/mypage/boardtext" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}" /> <input
		type="hidden" name="perPage" value="${pagingDto.perPage}" /> <input
		type="hidden" name="searchType" value="${pagingDto.searchType}" /> <input
		type="hidden" name="keyword" value="${pagingDto.keyword}" /> <input
		type="hidden" name="b_no" />
</form>
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

							<div class="jumbotron" style="background-color: black;">

								<h2 style="color: white;">게시글 확인</h2>
								<br>
								<!-- Nav tabs -->
								<ul class="nav nav-tabs">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home">내가쓴글</a></li>

								</ul>

								<!-- Tab panes -->
								<div class="row">
									<div class="col-md-12">
										<table class="table" style="color: white;">
											<thead>
												<tr>
													<th>구분</th>
													<th>제목</th>
													<th>내용</th>
													<th>글쓴날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="noticeBoardVo" items="${list}">
													<tr>
														<td>${noticeBoardVo.b_no}</td>
														<td>${noticeBoardVo.b_title}</td>
														<td>${noticeBoardVo.b_content}</td>
														<td>${noticeBoardVo.b_regdate}</td>
														<td></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<br>
								<!-- 페이징 -->

								<div class="row">
									<div class="col-md-12">
										<nav>
											<ul class="pagination justify-content-center">
												<c:if test="${pagingDto.startPage != 1}">
													<li class="page-item"><a class="page-link"
														href="${pagingDto.startPage - 1}">&laquo;</a></li>
												</c:if>
												<c:forEach var="v" begin="${pagingDto.startPage}"
													end="${pagingDto.endPage}">
													<li
														<c:choose>
															<c:when test="${pagingDto.page == v}">
																class="page-item active"
															</c:when>
															<c:otherwise>	
																class="page-item"
															</c:otherwise>
														</c:choose>>
														<a class="page-link" href="${v}">${v}</a>
													</li>
												</c:forEach>
												<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
													<li class="page-item"><a class="page-link"
														href="${pagingDto.endPage + 1}">&raquo;</a></li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div>


								<!-- // 페이징 -->

							</div>
							<div class="col-lg-3"></div>

						</div>
					</div>
				</div>
</section>
<%@ include file="../include/footer.jsp"%>