<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="administerHeader.jsp" %>
<style>
.movie_title:hover {
	color:red;
}
.page-item {
	float:left;
}
.page-link {
	width:30px;
	float:left;
}
</style>
<body>
<form id="frmPaging" action="/administerPage/administerMovieListPage" method="get">
	<input type="hidden" name="page" value="${admin_PageingDto.page}"/>
	<input type="hidden" name="perPage" value="${admin_PageingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${admin_PageingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${admin_PageingDto.keyword}"/>
	<input type="hidden" name="movie_num"/>
</form>
	<section class="product-area shop-sidebar shop section" style="padding-top: 10px;">
		<div class="container" style="padding: 0px;">
			<div class="row">
				<div class="col-lg-9 col-md-8 col-12">
					<div class="row">
						<div class="col-12">
							<div style="background-color: #f6f7fb; padding: 20px; border-bottom: 1px solid #ddd; margin-bottom: 20px;">
								<h4 class="title">영화관 관리_지역 조회</h4>
							</div>
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<table class="table">
											<thead>
												<tr>
													<th>지역</th>
													<th>수정</th>
													<th>삭제</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${area_list}" var="AreaVo">
												<tr>
													<td>${AreaVo.area_name}</td>
													<td><a href="/sgh/admin/areaModfiyForm?area_no=${AreaVo.area_no}" class="btn-primary" style="color: white;">수정</a></td>
													<td><a href="/sgh/admin/areaDeleteRun?area_no=${AreaVo.area_no}" class="btn-danger" style="color: white;">삭제</a></td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
		<!-- Bootstrap core JavaScript-->
		<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
		<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
		<script>
		$(function () {
			var msgRegist = "${msgRegist}";
			if(msgRegist == "success"){
				alert("등록 성공");
			}
			var msgDelete = "${msgDelete}";
			if(msgDelete == "success"){
				alert("삭제 성공");
			}
			$("#btnSearch").click(function (e) {
				e.preventDefault();
				var searchType = $("select[name=searchType]").val();
				var keyword = $("#keyword").val();
				if (keyword == "" || keyword == null) {
					alert("검색어를 입력해주세요.");
					$("#keyword").focus();
					return false;
				}
				$("#frmPaging > input[name=searchType]").val(searchType);
				$("#frmPaging > input[name=keyword]").val(keyword);
				$("#frmPaging > input[name=perPage]").val("5");
				$("#frmPaging").submit();
			});
			
			
			// 페이지 번호
			$("a.page-link").click(function(e) {
				e.preventDefault(); //막기
				var page = $(this).attr("href").trim();
				$("#frmPaging > input[name=page]").val(page);
				$("#frmPaging > input[name=perPage]").val("5");
				$("#frmPaging").submit();
			});
			
			// 목록으로 이동
			$("#btnList").click(function () {
				location.href="/administerPage/administerMovieListPage";
			});
			
			// searchType이 movie_grade 일 때 placeholeder 넣어주기
			$("#searchSelect").change(function () {
				$("#keyword").val("");
				$("#keyword").attr("placeholder", "");
				var searchType = $("#searchSelect option:selected").val();
				if(searchType =="movie_grade") {
					$("#keyword").attr("placeholder", "all/12/15/19");
				}
			});
			
		});
		</script>
	</body>
</html>