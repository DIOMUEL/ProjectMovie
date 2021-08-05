<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="administerHeader.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on("click",".btnDeleteReport",function(){
		var q = confirm("삭제하시겠습니까?");
		if(q == true){
			var rpt_no = $(this).attr("data-rpt_no");
			var url = "/administerPage/administerReportDeleteRun";
				var sendData = {
					"rpt_no" : rpt_no
			};
			$.get(url, sendData, function(rData){
					//console.log("rData: "+rData);
				if (rData == "success") {
					alert("삭제 완료.");
				};
			});
		};
	});
});
</script>

<section class="page-section bg-light">
	<div class="container">
		<div class="contact-head">
			<div class="row">
				<div class="col-lg-10 col-12">
					<div class="form-main" style="background-color:lightgreen">
						<div class="title">
							<div class="jumbotron" style="background-color:black;">
								<h2 style="color: white;">게시판 신고함</h2>
								<br>
							</div>
							<div class="row" id="receive">
								<div class="col-md-12">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>NO.</th>
												<th>신고내용</th>
												<th>보낸사람</th>
												<th>보낸날짜</th>
												<th>읽은날짜</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="list" items="${list}">
											<tr>
												<td>${list.rpt_no}</td>
												<td>
													<span
														<c:if test="${empty list.rpt_opendate}">
															style="font-weight:bold"
														</c:if>
													>
													<a href="/noticeBoard/noticeBoardContentPage?b_no=${list.b_no}">${list.rpt_content}</a></span>
												</td>
												<td>${list.rpt_sender}</td>
												<td>${list.rpt_senddate}</td>
												<td>
												<c:choose>
												<c:when test="${empty list.rpt_opendate}">
													읽지 않음
												</c:when>
												<c:otherwise>
													${list.rpt_opendate}
												</c:otherwise>
												</c:choose>
												</td>
												<td><a class="btn-danger btnDeleteReport" style="color:white;" data-rpt_no="${list.rpt_no}">삭제</a></td>
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