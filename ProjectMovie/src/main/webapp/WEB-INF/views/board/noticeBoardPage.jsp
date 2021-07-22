<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function(){
	
// 	$("#btnWrite").click(function(e){
// 		e.preventDefault();
// 		if("${noticeBoardVo.user_id}" == ""){
// 			alert("로그인을 확인해주세요");
// 			location.href = "/board/loginPage";
// 		}else{
// 			location.href = "/noticeBoard/noticeBoardWritePage";
// 		}
		
// 	});
	
	// 검색 옵션 
	$(".searchType").click(function(e) {
		e.preventDefault();
		var searchType = $(this).attr("href");
		$("#frmPaging > input[name=searchType]").val(searchType);
		$("#dropdownMenuButton").text($(this).text());
	});
	
	// 검색
	$("#btnSearch").click(function() {
		var searchType = 
			$("#frmPaging > input[name=searchType]").val();
		if (searchType == "") {
			alert("검색 옵션을 선택해 주세요");
			return;
		}
		var keyword = $("#txtSearch").val().trim();
		if (keyword == "") {
			alert("검색어를 입력해 주세요");
			return;
		}
		$("#frmPaging > input[name=keyword]").val(keyword);
		$("#frmPaging > input[name=page]").val("1");
		$("#frmPaging").submit();
	});
	
	// 글제목 
	$(".a_title").click(function(e) {
		e.preventDefault();
		var b_no = $(this).attr("data-bno");
		$("#frmPaging > input[name=b_no]").val(b_no);
		$("#frmPaging").attr("action", "/noticeBoard/noticeBoardContentPage");
		$("#frmPaging").submit();
	});
	
	// 페이지 
	$(".pagination > li > a").click(function(e) {
		e.preventDefault(); 
		var page = $(this).attr("href");
		var frmPaging = $("#frmPaging");
		frmPaging.find("[name=page]").val(page);
		frmPaging.submit();
	});
});
</script>
<form id="frmPaging" action="/board/noticeBoardPage" method="get">
	<input type="hidden" name="page" value="${pagingDto.page}"/>
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${pagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
	<input type="hidden" name="b_no"/>
</form>

<br>
<br>
<br>
<br>
<br>
<br>
<section class="page-section bg-light">
<title>고객게시판</title>
<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
<!--tap -->				
<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Home</button>
    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</button>
    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">...</div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
</div>
<!--//tap-->
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
												검색옵션</button>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item searchType" href="t">제목</a> 
												<a class="dropdown-item searchType" href="c">내용</a> 
												<a class="dropdown-item searchType" href="u">작성자</a> 
												<a class="dropdown-item searchType" href="tc">제목+내용</a>
											</div>
										</div>
									</div>
								</div>
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<form class="d-flex">
							<input class="form-control me-2" type="text"
								placeholder="검색어를 입력하세요." aria-label="Search" value="${pagingDto.keyword}" id="txtSearch">
							<button class="btn btn-outline-success" type="button" id="btnSearch">Search</button>
						</form>
					</div>
				</nav>
			</div>
		</nav>
	</div>
</div>
<!--//검색창 -->
<div>
[전체 ${pagingDto.count}건]
</div>
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
			<c:forEach var="noticeBoardVo" items="${list}">
				<tr>
					<td>${noticeBoardVo.b_no}</td>
					<td><a class="a_title" href="#" data-bno="${noticeBoardVo.b_no}">${noticeBoardVo.b_title}</a>
					<span class="badge badge-info">${noticeBoardVo.comment_cnt}</span></td>
					<td>${noticeBoardVo.user_id}</td>
					<td>${noticeBoardVo.b_regdate}</td>
					<td>${noticeBoardVo.b_viewcnt}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!--//테이블 -->
<div>
<a class="btn btn-primary" id="btnWrite" href="/noticeBoard/noticeBoardWritePage">글쓰기</a>
</div>
<!--페이징 -->
<div class="row">
	<div class="col-md-12">
		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="${pagingDto.startPage}">&laquo;</a></li>
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" 
							href="${pagingDto.startPage - 1}">이전</a>
					</li>
				</c:if>
				<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
				<li
				<c:choose>
					<c:when test="${pagingDto.page == v}">
						class="page-item active"
					</c:when>
					<c:otherwise>
						class="page-item"
					</c:otherwise>
				</c:choose>
				>
				<a class="page-link" href="${v}">${v}</a>
				</li>
				</c:forEach>
				<c:if test="${pagingDto.endPage < pagingDto.totalPage}">	
					<li class="page-item">
						<a class="page-link" 
							href="${pagingDto.endPage + 1}">다음</a>
					</li>
				</c:if>
				<li class="page-item"><a class="page-link" href="${pagingDto.endPage}">&raquo;</a></li>
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
</section>
<br>
<br>
<br>
<br>
<br>
<br>
<%@ include file="../include/footer.jsp"%>