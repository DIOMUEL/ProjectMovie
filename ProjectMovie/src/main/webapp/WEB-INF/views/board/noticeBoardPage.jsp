<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp"%>
<br>
<br>
<br>
<br>
<br>
<br>
<title>고객게시판</title>

<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
				
				<!--검색창 -->
<div class="row">
	<div class="col-md-12">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">

								<div class="row">
									<div class="col-md-12">
										<div class="dropdown">

											<button class="btn btn-default dropdown-toggle" type="button"
												id="dropdownMenuButton" data-toggle="dropdown">
												선택</button>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item disabled" href="#">제목</a> 
												<a class="dropdown-item" href="#">내용</a> 
												<a class="dropdown-item" href="#">제목+내용</a>
											</div>
										</div>
									</div>
								</div>
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</nav>
			</div>
		</nav>
	</div>
</div>
<!--//검색창 -->

<!--테이블 -->
<div class="container">
	<div class="row">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">등록일</th>
					<th style="background-color: #eeeeee; text-align: center;">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="boardVo" items="${list}">
				<tr>
					<td>${boardVo.b_no}</td>
					
<%-- 					<a class="a_title" href="#" data-bno="${boardVo.b_no}"> --%>
<%-- 								${boardVo.b_title}  --%>
<!-- 							</a> -->
					<td><a class="title" href="/board/noticeBoardContentPage">${boardVo.b_title}</a></td>
					<td>${boardVo.user_id}</td>
					<td>${boardVo.b_regdate}</td>
					<td>${boardVo.b_viewcnt}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!--//테이블 -->

<!--페이징 -->
<div class="row">
	<div class="col-md-12">
		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">Previous</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>
</div>
<!--//페이징 -->
				
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="../include/footer.jsp"%>