<!-- 영화 예약 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% System.out.print(request.getParameter("num")); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Reserve Page</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900'" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnReserve').click(function() {
			var result = confirm('정말 예약하시겠습니까?');
			if (result) {
				$("form:first").submit();
			}
		});
		$('#btnReturn').click(function() {
			var result = confirm('메인 페이지로 돌아갑니다.');
			if(result)	{
				location.replace("/board/mainPage");
			}
		});
	});	
	</script>
</head>
<body
	style="text-align: center; font-family: 'Noto Sans KR', sans-serif;">
	<br>
	<br>
	<div align="center">
		<img class="brand-logo-light" src="resources/images/bomair_logo.png" style="width: 510px; height: 100px">
		<table rules="none" style="background-color: #7cc67c">
			<tr>
				
			</tr>
		</table>
		<br> &nbsp;
		<table>
		<tr>
			
		</tr>
			<!-- 영화예약 -->
			<c:forEach var="a" items="${movieinfo }">
				<c:set var="dr">${fn:substring(m.movie_name,4,5) % 2}</c:set>
				<c:if test="${dr eq 1}">
					<tr>
						
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<br>
		<div>
			<br>
			<table>
					
			</table>
		</div>
		<br> <br> <b style="color: red">▷예매 표를 불법적으로 유통 시 법적인 처벌을 받을 수 있습니다.</b><br>
		<div>
			<br>
			<pre>
			▣ 유의사항
			☞ 상품 주문시 다시 한 번 확인 해주시기 바랍니다.
			☞ 주문한  상품을 하루 전까지 환불이 가능합니다.
			☞ 극장 선택시 장소 확인 후에 예매 바랍니다.
			</pre>
		</div>
	</div>
	<form action="complete" method="post">
		<input type="hidden" name="l_code" value="${moviebean.l_code }">
		<input type="hidden" name="o_sdate" value="${moviebean.o_sdate }">
		<input type="hidden" name="people" value="${moviebean.people }">
		<input type="hidden" name="pay"> <input type="hidden" name="start">
		<input type="hidden" name="end"> <input type="hidden" name="time"> <input type="hidden" name="a_name">
		<input type="hidden" name="grade"> <input type="hidden" name="maxT" value="${num+1}"> 
		<input type="hidden" name="g_id" value="${id}">
	</form>
	<input type="button" id="btnReserve" value="예약하기">
	<a href="goindex">
	<input type="button" id="btnReturn" value="취소">
	</a>
</body>
</html>