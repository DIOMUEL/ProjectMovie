<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
	
<div class="container" style="background-image: url('.././resources/images/cinemaFront.jpg'); background-repeat : no-repeat; background-size : cover;">
<br>
<br>
<br>
<br>
<br>
<br>
	<div class="row align-items-center">
	<br>
		<div class="col-lg-3"></div>
		<div class="col-lg-6 my-3 my-lg-0" style="background-color:rgba(0, 255, 255, 0.5)">		
		<br>
			<div class="jumbotron" style="background-color:rgba(0, 255, 255, 0.8)" >
			
<h2>받은쪽지목록함</h2>
	<br>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#home">보낸쪽지함</a></li>
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#menu1">받은 쪽지함</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="row">
		<div class="col-md-12">
			<table class="table">
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
				<c:forEach var="messageVo" items="${list}">
					<tr>
						<td>${messageVo.msg_no}</td>
						<td>
						<span
						
						<c:if test="${empty messageVo.msg_opendate}">
							style="font-weight:bold"
						</c:if>
						>
						<a href="/message/messageRead?msg_no=${messageVo.msg_no}">	${messageVo.msg_content}</a>
						
						</span>
						
						</td>
						<td>${messageVo.msg_sender}</td>
						<td>${messageVo.msg_senddate}</td>
						
						<td>
						<c:choose>
						<c:when test="${empty messageVo.msg_opendate}">
							읽지 않음
						</c:when>
						<c:otherwise>
							${messageVo.msg_opendate}
						</c:otherwise>
						
						</c:choose>
						</td>
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
<br>
<br>
<br>
<br>
<br>
<br>
</div>
</div>
<%@ include file="../include/footer.jsp"%>
