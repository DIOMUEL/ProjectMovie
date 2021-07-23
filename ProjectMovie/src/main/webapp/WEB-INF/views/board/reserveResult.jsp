<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserve Check Page</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<link rel="stylesheet" href="resources/css/detail.css">
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnMyBook').click(function() {
			location.href = "mybook?g_id=${id}";
		});
		$('#btnhome').click(function() {
			location.href = "/board/mainPage";
		});
	});
</script>
</head>
<body>
	<h1>${id}님의 상품 예매가 완료되었습니다.</h1>
	<table>
		<tr>
			<th>영화이름</th>
			<th>지역</th>
			<th>상영관</th>
			<th>좌석</th>
			<th>시간</th>
			<th>식사류</th>
			<th>결제금액</th>
		</tr>
		<tr>
			<td>영화관</td>
			<td><c:choose>
					<c:when test="${complete.l_code eq 'Seoul' }">서울</c:when>
					<c:when test="${complete.l_code eq 'Busan' }">부산</c:when>
					<c:when test="${complete.l_code eq 'Daegu' }">대구</c:when>
					<c:when test="${complete.l_code eq 'Incheon' }">인천</c:when>
					<c:when test="${complete.l_code eq 'Daejeon' }">대전</c:when>
					<c:when test="${complete.l_code eq 'Gwangju' }">광주</c:when>
					<c:when test="${complete.l_code eq 'Ulsan' }">울산</c:when>
					<c:when test="${complete.l_code eq 'Sejong' }">세종</c:when>
					<c:when test="${complete.l_code eq 'Jeju' }">제주</c:when>
					<c:otherwise> ... </c:otherwise>
				</c:choose>(${complete.l_code })</td>
			<td>${complete.o_sdate }</td>
			<td>${complete.start }~${complete.end }<br>(${complete.time })</td>
			<td>${complete.m_name }</td>
			<td><c:choose>
					<c:when test="${complete.grade eq 'B' }">Bed(침대석)</c:when>
					<c:when test="${complete.grade eq 'C' }">Cupple(커플석)</c:when>
					<c:when test="${complete.grade eq 'E' }">Economy(일반석)</c:when>
				</c:choose></td>
			<td><fmt:formatNumber value="${complete.pay }" pattern="#,###" />KRW</td>
		</tr>
	</table>
	<br>
	<br>
	<input type="button" value="나의예약정보" id="btnMyBook">
	<input type="button" value="확인" id="btnhome">
</body>
</html>