<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<div class="container">
			<div class="contact-head">
				<div class="row">
					<%@ include file="../include/menu_side_bar_mypage.jsp"%>
					<div class="col-lg-8 col-12">
						<div class="form-main">
							<div class="title">
							
			<div class="jumbotron" style="background-color:rgba(0, 255, 255, 0.8)" >
			
<h2>음식 구매내역</h2>
	<br>
	<!-- Nav tabs -->
	

	<!-- Tab panes -->
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>구분</th>
						<th>상품명</th>
						<th>가격</th>
						<th>구매일자</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="messageVo" items="${list}">
					<tr>
						<td>${messageVo.msg_no}</td>
						<td></td>
						<td>${messageVo.msg_sender}</td>
						<td>${messageVo.msg_senddate}</td>
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
<%@ include file="../include/footer.jsp"%>
