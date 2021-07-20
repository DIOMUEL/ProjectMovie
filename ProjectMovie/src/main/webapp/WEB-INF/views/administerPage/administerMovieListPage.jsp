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
		<section>
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
								<div style="background-color:#f6f7fb; padding:20px; border-bottom:1px solid #ddd;">
									<h4 class="title" >영화관리_영화조회</h4>
								</div>	
								<!--  검색 -->
								<div style="padding:20px;text-align:right;">	
									<div class="single-shorter" style="vertical-align:middle;">
											<label>검색 :</label>
											<select id="searchSelect" name=searchType>
												<option value="movie_name"
												<c:if test="${admin_PageingDto.searchType == 'movie_name'}">selected</c:if>
												>영화명</option>
												<option value="movie_genre"
												<c:if test="${admin_PageingDto.searchType == 'movie_genre'}">selected</c:if>
												>영화장르</option>
												<option value="movie_grade"
												<c:if test="${admin_PageingDto.searchType == 'movie_grade'}">selected</c:if>
												>영화등급</option>
											</select>
										</div>

									<input type="text" id="keyword" value="${admin_PageingDto.keyword}" name="keyword"/>
									<button type="button" class="btn btn-primary" id="btnSearch">검색</button>
									<button type="button" class="btn btn-primary" id="btnList">목록</button>
								</div>	
								<!--  검색 끝 -->
								<!--  페이지별 내용 -->
								<table class="table" style="text-align:center;height:auto;" id="movie_table">
									<thead>
										<tr>
											<th style="width:70px;">순서</th>
											<th style="width:120px;">영화이미지</th>
											<th>영화명</th>
											<th style="width:100px;">영화장르</th>
											<th style="width:100px;">영화등급</th>
											<th style="width:130px;">개봉일</th>
										</tr>
									</thead>
									<tbody style="vertical-align:middle;table-layout:fixed;">
									<!--  영화정보 조회 -->
									<c:forEach var="movieVo" items="${movieVo}">
										<tr style="height:50px;vertical-align:middle;">
											<td style="height:100px;vertical-align:middle;">${movieVo.movie_num}</td>
											<td><img style="width:75px;height:auto;" src="/upload/displayFile?fileName=${movieVo.movie_main_image}"/></td>
											<td style="vertical-align:middle;"><a href="/administerPage/administerMovieSelectByMovie?movie_code=${movieVo.movie_code}" class="movie_name">${movieVo.movie_name}</a></td>
											<td style="vertical-align:middle;">${movieVo.movie_genre}</td>
											<td style="vertical-align:middle;">${movieVo.movie_grade}</td>
											<td style="vertical-align:middle;">${movieVo.movie_open_date}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row" style="height:100px;">
						</div>
						
						<!--페이징-->
						<div class="row">
							<div class="col-md-5">
							</div>
							<div class="col-md-7">
								<nav>
			 						<ul class="pagination">
										<!-- 이전 -->
			 							<c:if test="${admin_PageingDto.startPage != 1}">
			 								<li class="page-item"><a class="page-link" href="${admin_PageingDto.startPage-1}">&laquo;</a></li>
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
			 							<c:if test="${admin_PageingDto.endPage < admin_PageingDto.totalPage}">
			 								<li class="page-item"><a class="page-link" href="${admin_PageingDto.endPage + 1}">&raquo;</a></li>
			 							</c:if>
			 						</ul>
			 					</nav>
							</div>
						</div>
						<!--페이징end-->
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