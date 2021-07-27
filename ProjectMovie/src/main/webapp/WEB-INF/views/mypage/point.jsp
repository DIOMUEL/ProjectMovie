<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	var value = "4500";
		if(value > 0 ){
			$("#rankimg").attr("src","/resources/Rankimg/bronze.png");
		}
		if(value > 10000){
			$("#rankimg").attr("src","/resources/Rankimg/silver.png");
		}
		if(value > 50000){
			$("#rankimg").attr("src","/resources/Rankimg/gold.png");
		}
		if(value > 100000){
			$("#rankimg").attr("src","/resources/Rankimg/platinum.png");
		}
		if(value > 500000){
			$("#rankimg").attr("src","/resources/Rankimg/diamond.png");
		};
		
		console.log(value);
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
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-6">
										<div class="jumbotron">
											<h4>0 P</h4>
											<p>현재 포인트</p>
										</div>
									</div>
									<div class="col-md-6">
										<img alt="..."
											src="/resources/Rankimg/diamond.png" id="rankimg" />
									</div>
								</div>
							</div>
							<div class="jumbotron"
								style="background-color:black;">

								<h2 style="color: white;">포인트 확인</h2>
								<br>
								<!-- Nav tabs -->
								<ul class="nav nav-tabs">

									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#menu1">포인트</a></li>
								</ul>

								<!-- Tab panes -->
								<div class="row">
									<div class="col-md-12">
										<table class="table" style="color: white;">
											<thead>
												<tr>
													<th>일자</th>
													<th>구분</th>
													<th>내용</th>
													<th></th>
													<th>포인트</th>
												</tr>
											</thead>
											<tbody>

												<tr>
													<td>${messageVo.msg_no}</td>
													<td></td>
													<td>${messageVo.msg_sender}</td>
													<td>${messageVo.msg_senddate}</td>

													<td></td>
												</tr>

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
</section>
<%@ include file="../include/footer.jsp"%>