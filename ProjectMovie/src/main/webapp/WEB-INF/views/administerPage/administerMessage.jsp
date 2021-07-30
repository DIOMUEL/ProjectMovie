<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="administerHeader.jsp" %>
<script>
$(document).ready(function() {
	$("#send").hide();
	$("#receive").show();
	$("#self").hide();
// 	$(".pagination > li > a").click(function(e) {
// 		e.preventDefault(); // 페이지 이동 막기
// 		var page = $(this).attr("href");
// 		var frmPaging = $("#frmPaging");
// 		frmPaging.find("[name=page]").val(page);
// 		frmPaging.submit();
	
// 	});
	$(".receive").click(function() {
		$("#send").hide();
		$("#receive").show();
		$("#self").hide();
	});
	
	$(".send").click(function() {
		$("#send").show();
		$("#receive").hide();
		$("#self").hide();
	})
	
	$(".self").click(function() {
		$("#send").hide();
		$("#receive").hide();
		$("#self").show();
	})

// 	$(".a_title").click(function(e) {
// 		e.preventDefault(); // prevent:막다, 방지하다, default: 기본
		
// 		var msg_no = $(this).attr("data-msg_no"); // 489
// 		$("#frmPaging > input[name=msg_no]").val(msg_no);
// 		$("#frmPaging").attr("action", "/mypage/message_send");
// 		$("#frmPaging").submit();
// 	});

})

</script>
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
													<a href="/noticeMessage/messageRead?msg_no=${noticeSendMessageVo.msg_no}">${noticeSendMessageVo.msg_content}</a></span>
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
							</div>
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
													<a href="/noticeMessage/messageRead?msg_no=${noticeReceiveMessageVo.msg_no}">${noticeReceiveMessageVo.msg_content}</a></span>
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
													<a href="/noticeMessage/messageRead?msg_no=${noticeSelfMessageVo.msg_no}">${noticeSelfMessageVo.msg_content}</a></span>
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