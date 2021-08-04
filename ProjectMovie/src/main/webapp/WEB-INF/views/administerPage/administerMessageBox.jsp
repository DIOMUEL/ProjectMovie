<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="administerHeader.jsp" %>
<script>
$(document).ready(function() {
	$("#send").hide();
	$("#receive").show();
	$("#self").hide();

	$(".receive").click(function() {
		$("#send").hide();
		$("#receive").show();
		$("#self").hide();
	});
	
	$(".send").click(function() {
		$("#send").show();
		$("#receive").hide();
		$("#self").hide();
	});
	
	$(".self").click(function() {
		$("#send").hide();
		$("#receive").hide();
		$("#self").show();
	});

	// 페이지 번호
	$("a.page-link").click(function(e) {
		e.preventDefault(); //막기
		var page = $(this).attr("href").trim();
		$("#frmPaging > input[name=page]").val(page);
		$("#frmPaging > input[name=perPage]").val("5");
		$("#frmPaging").submit();
	});
});

</script>
<form id="frmPaging" action="/administerPage/administerMessageBox" method="get">
	<input type="hidden" name="page" value="${admin_PageingDto.page}"/>
	<input type="hidden" name="perPage" value="${admin_PageingDto.perPage}"/>
	<input type="hidden" name="msg_no"/>
</form>
<section class="page-section bg-light">
	<div class="container">
		<div class="contact-head">
			<div class="row">
				<div class="col-lg-8 col-12">
					<div class="form-main" style="background-color:lightgreen">
						<div class="title">
							<div class="jumbotron" style="background-color:black;">
								<h2 style="color: white;">쪽지 함</h2>
								<br>
							</div>
							<ul class="nav nav-tabs">
								<li class="nav-item receive" ><a class="nav-link active" data-toggle="tab"href="#home" >받은쪽지함</a></li>
								<li class="nav-item send"><a class="nav-link" data-toggle="tab" href="#menu1" >보낸쪽지함</a></li>
								<li class="nav-item self"><a class="nav-link" data-toggle="tab" href="#menu2" >내게쓴쪽지함</a></li>	
							</ul>
							<div class="row" id="receive">
								<div class="col-md-12">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>NO.</th>
												<th>쪽지내용</th>
												<th>보낸사람</th>
												<th>보낸날짜</th>
												<th>읽은날짜</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="noticeReceiveMessageVo" items="${receiveList}">
											<tr>
												<td>${noticeReceiveMessageVo.msg_no}</td>
												<td>
													<span
														<c:if test="${empty noticeReceiveMessageVo.msg_opendate}">
															style="font-weight:bold"
														</c:if>
													>
													<a href="/administerPage/administerMessageReadPage?msg_no=${noticeReceiveMessageVo.msg_no}">${noticeReceiveMessageVo.msg_content}</a></span>
												</td>
												<td>${noticeReceiveMessageVo.msg_sender}</td>
												<td>${noticeReceiveMessageVo.msg_senddate}</td>
												<td>
												<c:choose>
												<c:when test="${empty noticeReceiveMessageVo.msg_opendate}">
													읽지 않음
												</c:when>
												<c:otherwise>
													${noticeReceiveMessageVo.msg_opendate}
												</c:otherwise>
												</c:choose>
												</td>
											</tr>
										</c:forEach>	
										</tbody>
									</table>
								</div>
								<!--페이징-->
								<div class="row">
									<div class="col-md-5"></div>
									<div class="col-md-7">
										<nav>
					 						<ul class="pagination">
												<!-- 이전 -->
					 							<c:if test="${pagingDtoReceive.startPage != 1}">
					 								<li class="page-item"><a class="page-link" href="${pagingDtoReceive.startPage-1}">&laquo;</a></li>
					 							</c:if>
												<!-- 페이지 넘버링 -->
					 							<c:forEach begin="${admin_PageingDto.startPage}" end="${admin_PageingDto.endPage}" var="v">
													<li
					 									<c:if test="${admin_PageingDto.page == v }">
					 										class="page-item active"
					 									</c:if>
					 										class="page-item"
					 								>
					 									<a class="page-link" href="${v}">${v}</a>
					 								</li>
					 							</c:forEach>
												<!-- 다음 -->
					 							<c:if test="${pagingDtoReceive.endPage < pagingDtoReceive.totalPage}">
					 								<li class="page-item"><a class="page-link" href="${pagingDtoReceive.endPage + 1}">&raquo;</a></li>
					 							</c:if>
					 						</ul>
					 					</nav>
									</div>
								</div>
								<!--페이징end-->
							</div>
							<div class="row" id="send">
								<div class="col-md-12">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>NO.</th>
												<th>쪽지내용</th>
												<th>받는사람</th>
												<th>보낸날짜</th>
												<th>읽은날짜</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="noticeSendMessageVo" items="${sendList}">
											<tr>
												<td>${noticeSendMessageVo.msg_no}</td>
												<td>
													<span
														<c:if test="${empty noticeSendMessageVo.msg_opendate}">
															style="font-weight:bold"
														</c:if>
													>
													<a href="/administerPage/administerMessageReadPage?msg_no=${noticeSendMessageVo.msg_no}">${noticeSendMessageVo.msg_content}</a></span>
												</td>
												<td>${noticeSendMessageVo.msg_receiver}</td>
												<td>${noticeSendMessageVo.msg_senddate}</td>
												<td>
												<c:choose>
												<c:when test="${empty noticeSendMessageVo.msg_opendate}">
													읽지 않음
												</c:when>
												<c:otherwise>
													${noticeSendMessageVo.msg_opendate}
												</c:otherwise>
												</c:choose>
												</td>
											</tr>
										</c:forEach>	
										</tbody>
									</table>
								</div>
<!-- 								페이징 -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-md-5"></div> -->
<!-- 									<div class="col-md-7"> -->
<!-- 										<nav> -->
<!-- 					 						<ul class="pagination"> -->
<!-- 												이전 -->
<%-- 					 							<c:if test="${pagingDtoReceive.startPage != 1}"> --%>
<%-- 					 								<li class="page-item"><a class="page-link" href="${pagingDtoReceive.startPage-1}">&laquo;</a></li> --%>
<%-- 					 							</c:if> --%>
<!-- 												페이지 넘버링 -->
<%-- 					 							<c:forEach begin="${admin_PageingDto.startPage}" end="${admin_PageingDto.endPage}" var="v"> --%>
<!-- 													<li -->
<%-- 					 									<c:if test="${admin_PageingDto.page == v }"> --%>
<!-- 					 										class="page-item active" -->
<%-- 					 									</c:if> --%>
<!-- 					 										class="page-item" -->
<!-- 					 								> -->
<%-- 					 									<a class="page-link" href="${v}">${v}</a> --%>
<!-- 					 								</li> -->
<%-- 					 							</c:forEach> --%>
<!-- 												다음 -->
<%-- 					 							<c:if test="${pagingDtoReceive.endPage < pagingDtoReceive.totalPage}"> --%>
<%-- 					 								<li class="page-item"><a class="page-link" href="${pagingDtoReceive.endPage + 1}">&raquo;</a></li> --%>
<%-- 					 							</c:if> --%>
<!-- 					 						</ul> -->
<!-- 					 					</nav> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								페이징end -->
							</div>
							<div class="row" id="self">
								<div class="col-md-12">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>NO.</th>
												<th>쪽지내용</th>
												<th>보낸사람</th>
												<th>보낸날짜</th>
												<th>읽은날짜</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="noticeSelfMessageVo" items="${selfList}">
											<tr>
												<td>${noticeSelfMessageVo.msg_no}</td>
												<td>
													<span
														<c:if test="${empty noticeSelfMessageVo.msg_opendate}">
															style="font-weight:bold"
														</c:if>
													>
													<a href="/administerPage/administerMessageReadPage?msg_no=${noticeSelfMessageVo.msg_no}">${noticeSelfMessageVo.msg_content}</a></span>
												</td>
												<td>${noticeSelfMessageVo.msg_sender}</td>
												<td>${noticeSelfMessageVo.msg_senddate}</td>
												<td>
												<c:choose>
												<c:when test="${empty noticeSelfMessageVo.msg_opendate}">
													읽지 않음
												</c:when>
												<c:otherwise>
													${noticeSelfMessageVo.msg_opendate}
												</c:otherwise>
												</c:choose>
												</td>
											</tr>
										</c:forEach>	
										</tbody>
									</table>
								</div>
<!-- 								페이징 -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-md-5"></div> -->
<!-- 									<div class="col-md-7"> -->
<!-- 										<nav> -->
<!-- 					 						<ul class="pagination"> -->
<!-- 												이전 -->
<%-- 					 							<c:if test="${pagingDtoReceive.startPage != 1}"> --%>
<%-- 					 								<li class="page-item"><a class="page-link" href="${pagingDtoReceive.startPage-1}">&laquo;</a></li> --%>
<%-- 					 							</c:if> --%>
<!-- 												페이지 넘버링 -->
<%-- 					 							<c:forEach begin="${admin_PageingDto.startPage}" end="${admin_PageingDto.endPage}" var="v"> --%>
<!-- 													<li -->
<%-- 					 									<c:if test="${admin_PageingDto.page == v }"> --%>
<!-- 					 										class="page-item active" -->
<%-- 					 									</c:if> --%>
<!-- 					 										class="page-item" -->
<!-- 					 								> -->
<%-- 					 									<a class="page-link" href="${v}">${v}</a> --%>
<!-- 					 								</li> -->
<%-- 					 							</c:forEach> --%>
<!-- 												다음 -->
<%-- 					 							<c:if test="${pagingDtoReceive.endPage < pagingDtoReceive.totalPage}"> --%>
<%-- 					 								<li class="page-item"><a class="page-link" href="${pagingDtoReceive.endPage + 1}">&raquo;</a></li> --%>
<%-- 					 							</c:if> --%>
<!-- 					 						</ul> -->
<!-- 					 					</nav> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								페이징end -->
							</div>
							<div class="col-lg-3"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
</body>
</html>