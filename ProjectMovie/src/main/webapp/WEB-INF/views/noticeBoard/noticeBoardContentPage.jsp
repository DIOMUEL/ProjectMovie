<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<title>Insert title here</title>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">

				<div class="mb-3">
					<!--   <label for="exampleFormControlInput1" class="form-label">Email address</label> -->
					<input type="text" class="form-control"
						id="exampleFormControlInput1">
				</div>
				<div class="mb-3">
					<!--   <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label> -->
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
				<a type="button" class="btn btn-seccess" id="btnList" href="/board/noticeBoardPage">목록</a>
				<a type="button" class="btn btn-warning" id="btnList" href="/board/noticeBoardPage">수정</a>
				<a type="button" class="btn btn-danger" id="btnList" href="/board/noticeBoardPage">삭제</a>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</div>





<%@ include file="../include/footer.jsp"%>