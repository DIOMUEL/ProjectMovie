<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	$("#send").hide();
	$("#reciver").show();
	$(".pagination > li > a").click(function(e) {
		e.preventDefault(); // 페이지 이동 막기
		var page = $(this).attr("href");
		var frmPaging = $("#frmPaging");
		frmPaging.find("[name=page]").val(page);
		frmPaging.submit();
	
	});
	$(".send").click(function() {
		$("#send").hide();
		$("#reciver").show();
	});
	
	$(".receiver").click(function() {
		$("#send").show();
		$("#reciver").hide();
	})
	$("#btnSendMessage").click(function() {
		location.href = "/mypage/message_send";
	})
	$(".a_title").click(function(e) {
		e.preventDefault(); // prevent:막다, 방지하다, default: 기본
		
		var msg_no = $(this).attr("data-msg_no"); // 489
		$("#frmPaging > input[name=msg_no]").val(msg_no);
		$("#frmPaging").attr("action", "/mypage/message_send");
		$("#frmPaging").submit();
	});

})

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
								style="background-color:black;">

								<h2 style="color: white;">쪽지 함</h2>
								<br>
								<!-- Nav tabs -->
								<ul class="nav nav-tabs">
									<li class="nav-item send" ><a class="nav-link active" data-toggle="tab"
										href="#home" >보낸쪽지함</a></li>
									<li class="nav-item receiver"><a class="nav-link"
										data-toggle="tab" href="#menu1" >받은 쪽지함</a></li>
								</ul>

								<!-- Tab panes -->
								<div class="row" id="send">
									<div class="col-md-12">
										<table class="table" style="color: white;">
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
												<c:forEach var="messageVo" items="${send_MessageList}">
													<tr>
														<td>${messageVo.msg_no}</td>
														<td><a href="/mypage/message_send_content?msg_no=${messageVo.msg_no}">${messageVo.msg_content}</a></td>
														<td>${messageVo.msg_receiver}</td>
														<td>${messageVo.msg_senddate}</td>
														<td></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row" id="reciver">
									<div class="col-md-12">
										<table class="table"  style="color: white;">
											<thead>
												<tr>
													<th>#</th>
													<th>쪽지내용</th>
													<th>받는사람</th>
													<th>보낸날짜</th>
													<th>읽은날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="messageVo" items="${receive_MessageList}">
													<tr>
														<td>${messageVo.msg_no}</td>
														<td><a href="/mypage/message_receiver_content?msg_no=${messageVo.msg_no}">${messageVo.msg_content}</a> </td>
														<td>${messageVo.msg_sender}</td>
														<td>${messageVo.msg_senddate}</td>
														<td></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										
									</div>
							<!-- 페이징 -->
	
	<div class="row">
		<div class="col-md-12">
			<nav>
				<ul class="pagination justify-content-center">
				<c:if test="${pagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" 
							href="${pagingDto.startPage - 1}">&laquo;</a>
					</li>
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
				</ul>
			</nav>
		</div>
	</div>
	
	
	<!-- // 페이징 -->
								</div>
								<br>
								<input type="button" id="btnSendMessage" class="btn btn-outline-success"value="쪽지 보내기">
							</div>
							<div class="col-lg-3"></div>
						</div>
					</div>
				</div>
</section>
<%@ include file="../include/footer.jsp"%>