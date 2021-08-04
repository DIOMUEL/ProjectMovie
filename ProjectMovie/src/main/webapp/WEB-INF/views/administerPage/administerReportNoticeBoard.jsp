<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="administerHeader.jsp" %>
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
										<c:forEach var="list" items="${list}">
											<tr>
												<td>${list.msg_no}</td>
												<td>
													<span
														<c:if test="${empty list.msg_opendate}">
															style="font-weight:bold"
														</c:if>
													>
													<a href="/administerPage/administerMessageReadPage?msg_no=${list.msg_no}">${list.msg_content}</a></span>
												</td>
												<td>${list.msg_sender}</td>
												<td>${list.msg_senddate}</td>
												<td>
												<c:choose>
												<c:when test="${empty list.msg_opendate}">
													읽지 않음
												</c:when>
												<c:otherwise>
													${list.msg_opendate}
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