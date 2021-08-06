<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function(){
	
	$("#headList").hide();
	$("#list").show();
	$("#branchList").hide();

	
	$(".list").click(function() {
		$("#headList").hide();
		$("#list").show();
		$("#branchList").hide();
	});
	
	$(".head").click(function() {
		$("#headList").show();
		$("#list").hide();
		$("#branchList").hide();
	})
	
	$(".branch").click(function() {
		$("#headList").hide();
		$("#list").hide();
		$("#branchList").show();
	})
	
	
	
	
// 	$("#btnWrite").click(function(){
// 		if("${sessionScope.loginVo}" == ""){
// 			alert("로그인을 확인해주세요");
// 			return false;
// 		}
// 	});
	
	$("#btnWrite").click(function(e){
		e.preventDefault();
		if("${sessionScope.loginVo}" == ""){
			alert("로그인을 확인해주세요");
			location.href = "/board/loginPage";
		}else{
			location.href = "/noticeBoard/noticeBoardWritePage";
		}
	});
	
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
		if("${sessionScope.loginVo}" == ""){
			alert("로그인을 확인해주세요");
			location.href = "/board/loginPage";
		}else{
			var b_no = $(this).attr("data-bno");
			$("#frmPaging > input[name=b_no]").val(b_no);
			$("#frmPaging").attr("action", "/noticeBoard/noticeBoardContentPage");
			$("#frmPaging").submit();
		}
		
	});
	
	// 페이지 
	$(".pagination > li > a").click(function(e) {
		e.preventDefault(); 
		var page = $(this).attr("href");
		var frmPaging = $("#frmPaging");
		frmPaging.find("[name=page]").val(page);
		frmPaging.submit();
	});
	
	// 쪽지보내기 링크
	$(".sendMessage").click(function(e) {
		e.preventDefault();
		if("${sessionScope.loginVo}" == ""){
			alert("로그인을 확인해주세요");
			location.href = "/board/loginPage";
		}else{
			var user_id = $(this).attr("data-user_id");
			$("#btnSendMessage").attr("data-msg_receiver", user_id);
		}
		
	});
	// 쪽지 모달 보내기 버튼
	$("#btnSendMessage").click(function() {
		var that = $(this);
		var msg_content = $("#msg_content").val();
		var msg_receiver = $(this).attr("data-msg_receiver");
		var sendData = {
				"msg_receiver" : msg_receiver,
				"msg_content" : msg_content
		};
		console.log(sendData);
		var url = "/noticeMessage/sendMessage";

		$.ajax({
			"url" : url,
			"method" : "post",
			"dataType" : "text",
			"headers" : {
				"Content-Type" : "application/json"
			},
			"data" : JSON.stringify(sendData),
			"success" : function(receivedData) {
//				console.log(receivedData);
				if (receivedData == "success") {
					that.next().trigger("click");
					
				}
				
			}
		});
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
<!-- 쪽지 보내기 모달창 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="modal-container-105698" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">쪽지 보내기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" id="msg_content"/>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-primary"
							id="btnSendMessage">보내기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>

			</div>

		</div>

	</div>
</div>
<!-- // 쪽지 보내기 모달창 -->
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
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				
					<div class="jumbotron" style="background-color: black;">
						<h2 style="color: white;">고객게시판</h2>
						<br>
					</div>
					
<!--tap -->
					<ul class="nav nav-tabs">
						<li class="nav-item list"><a class="nav-link active"
							data-toggle="tab" href="#home">전체</a></li>
						<li class="nav-item head"><a class="nav-link"
							data-toggle="tab" href="#menu1">본사알림</a></li>
						<li class="nav-item branch"><a class="nav-link"
							data-toggle="tab" href="#menu2">지점알림</a></li>
					</ul>

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
<div class="container" id="list">
	<div class="row">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">극장</th>
					<th style="background-color: #eeeeee; text-align: center;">구분</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">등록일</th>
					<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					<th style="background-color: #eeeeee; text-align: center;">&vellip;</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="noticeBoardVo" items="${list}">
				<tr>
					<td>${noticeBoardVo.b_no}</td>
					<td>${noticeBoardVo.b_theater}</td>
					<td>${noticeBoardVo.b_division}</td>
					<td><a class="a_title" href="#" data-bno="${noticeBoardVo.b_no}">${noticeBoardVo.b_title}</a>
					<span class="badge badge-info">${noticeBoardVo.comment_cnt}</span></td>
					<td>${noticeBoardVo.user_id}</td>
					<td>${noticeBoardVo.b_regdate}</td>
					<td>${noticeBoardVo.b_viewcnt}</td>
					<td>
						<div class="row">
							<div class="col-md-12">
								<div class="dropdown">
									<button class="btn btn-Info dropdown" type="button"
										id="dropdownMenuButton" data-toggle="dropdown">
										&vellip;</button>
									<div class="dropdown-menu"
										aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item searchType sendMessage"
										data-toggle="modal"
										href="#modal-container-105698"
										data-user_id="${noticeBoardVo.user_id}">쪽지보내기</a> 
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="container" id="headList">
	<div class="row">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">극장</th>
					<th style="background-color: #eeeeee; text-align: center;">구분</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">등록일</th>
					<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					<th style="background-color: #eeeeee; text-align: center;">&vellip;</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="noticeBoardVo" items="${headList}">
				<tr>
					<td>${noticeBoardVo.b_no}</td>
					<td>${noticeBoardVo.b_theater}</td>
					<td>${noticeBoardVo.b_division}</td>
					<td><a class="a_title" href="#" data-bno="${noticeBoardVo.b_no}">${noticeBoardVo.b_title}</a>
					<span class="badge badge-info">${noticeBoardVo.comment_cnt}</span></td>
					<td>${noticeBoardVo.user_id}</td>
					<td>${noticeBoardVo.b_regdate}</td>
					<td>${noticeBoardVo.b_viewcnt}</td>
					<td>
						<div class="row">
							<div class="col-md-12">
								<div class="dropdown">
									<button class="btn btn-Info dropdown" type="button"
										id="dropdownMenuButton" data-toggle="dropdown">
										&vellip;</button>
									<div class="dropdown-menu"
										aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item searchType sendMessage"
										data-toggle="modal"
										href="#modal-container-105698"
										data-user_id="${noticeBoardVo.user_id}">쪽지보내기</a> 
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="container" id="branchList">
	<div class="row">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">극장</th>
					<th style="background-color: #eeeeee; text-align: center;">구분</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">등록일</th>
					<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					<th style="background-color: #eeeeee; text-align: center;">&vellip;</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="noticeBoardVo" items="${branchList}">
				<tr>
					<td>${noticeBoardVo.b_no}</td>
					<td>${noticeBoardVo.b_theater}</td>
					<td>${noticeBoardVo.b_division}</td>
					<td><a class="a_title" href="#" data-bno="${noticeBoardVo.b_no}">${noticeBoardVo.b_title}</a>
					<span class="badge badge-info">${noticeBoardVo.comment_cnt}</span></td>
					<td>${noticeBoardVo.user_id}</td>
					<td>${noticeBoardVo.b_regdate}</td>
					<td>${noticeBoardVo.b_viewcnt}</td>
					<td>
						<div class="row">
							<div class="col-md-12">
								<div class="dropdown">
									<button class="btn btn-Info dropdown" type="button"
										id="dropdownMenuButton" data-toggle="dropdown">
										&vellip;</button>
									<div class="dropdown-menu"
										aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item searchType sendMessage"
										data-toggle="modal"
										href="#modal-container-105698"
										data-user_id="${noticeBoardVo.user_id}">쪽지보내기</a> 
									</div>
								</div>
							</div>
						</div>
					</td>
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
<!-- 페이징 -->
<div class="row">
	<div class="col-md-12">
		<nav>
			<ul class="pagination justify-content-center">
<%-- 				<li class="page-item"><a class="page-link" href="${pagingDto.startPage}">&laquo;</a></li> --%>
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" 
							href="${pagingDto.startPage - 1}">&laquo;</a>
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
							href="${pagingDto.endPage + 1}">&raquo;</a>
					</li>
				</c:if>
<%-- 				<li class="page-item"><a class="page-link" href="${pagingDto.endPage}">&raquo;</a></li> --%>
			</ul>
		</nav>
	</div>
</div>
<!-- //페이징 -->
				</div>
				<div class="col-md-2">
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