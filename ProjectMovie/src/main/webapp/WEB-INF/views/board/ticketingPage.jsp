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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900'"
	rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnReserve').click(function() {
			var result = confirm('정말 예약하시겠습니까?');
			if (result) {
				//$('input[name=count]').attr('value', count);
				$("form:first").submit();
				//alert($('input[name=maxT]').val());
			} else {
				location.replace("/board/mainPage");
			}
		});
	});

	function gogo(start, end, time, m_name, grade) {
		$('input[name=start]').attr('value', start);
		$('input[name=end]').attr('value', end);
		$('input[name=time]').attr('value', time);
		$('input[name=a_name]').attr('value', m_name);
		$('input[name=grade]').attr('value', grade);
		//alert($('input[name=a_name]').val());
		aa();
	}

	function aa() {
		var movie_price = $(":input:radio[name=radioTxt]:checked").val() * $
		{
			moviebean.people
		};
		//alert(numberWithCommas(movie_price));
		var movie_price1 = numberWithCommas(movie_price) + " KRW"
		//alert(movie_price);
		$('#mp').text(movie_price1);

		var gong = $
		{
			moviebean.people * 15000
		};
		var gong1 = numberWithCommas(gong) + " KRW";
		$('#gong').text(gong1);

		var you = $
		{
			moviebean.people * 12000
		}
		var you1 = numberWithCommas(you) + " KRW";
		$('#you').text(you1);

		var tot = movie_price + gong + you;
		var tot1 = numberWithCommas(tot) + " KRW";
		$('#tot').text(tot1);

		$('input[name=pay]').attr('value', tot);
	}
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
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
				<td>&nbsp;&nbsp;영화 예매&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</td>
				<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;지역 선택 ▶ <c:choose>
						<c:when test="${moviebean.l_code eq 'Seoul' }">서울</c:when>
						<c:when test="${moviebean.l_code eq 'Busan' }">부산</c:when>
						<c:when test="${moviebean.l_code eq 'Daegu' }">대구</c:when>
						<c:when test="${moviebean.l_code eq 'Incheon' }">인천</c:when>
						<c:when test="${moviebean.l_code eq 'Daejeon' }">대전</c:when>
						<c:when test="${moviebean.l_code eq 'Gwangju' }">광주</c:when>
						<c:when test="${moviebean.l_code eq 'Ulsan' }">울산</c:when>
						<c:when test="${moviebean.l_code eq 'Sejong' }">세종</c:when>
						<c:when test="${moviebean.l_code eq 'Jeju' }">제주</c:when>
						<c:otherwise> ... </c:otherwise>
					</c:choose> (${moviebean.l_code })&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td>${moviebean.o_sdate}</td>
			</tr>
		</table>
		<br> &nbsp;
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
			<!-- 영화예약 -->
			<c:forEach var="a" items="${movieinfo }">
				<c:set var="dr">${fn:substring(m.movie_name,4,5) % 2}</c:set>
				<c:if test="${dr eq 1 }">
					<tr>
						<fmt:parseDate var="date_d" value="${m.o_stime }" pattern="HH:mm" />
						<fmt:parseNumber var="date_n" value="${date_d.time + 32400000}"
							integerOnly="true" />
						<fmt:parseNumber var="date_s" value="${m.o_soyo * 60000}"
							integerOnly="true" />
						<fmt:parseNumber var="format_hh"
							value="${(date_n + date_s)/3600000}" integerOnly="true" />
						<fmt:parseNumber var="format_mm"
							value="${(date_n + date_s)%3600000/60000}" integerOnly="true" />
						<c:choose>
							<c:when test="${format_hh >= 24}">
								<fmt:parseNumber var="soyo_hh" value="${m.o_soyo / 60}"
									integerOnly="true" />
								<c:set var="alive"
									value="${m.o_stime } ~ ${format_hh - 24}:${format_mm } (+1일) <br> (소요시간 : ${soyo_hh }시간 ${m.o_soyo % 60}분)" />
								<c:set var="alive_time"
									value="${format_hh - 24}:${format_mm } (+1일)"></c:set>
							</c:when>
							<c:otherwise>
								<fmt:parseNumber var="soyo_hh" value="${m.o_soyo / 60}"
									integerOnly="true" />
								<c:set var="alive"
									value="${m.o_stime } ~ ${format_hh}:${format_mm } <br> (소요시간 : ${soyo_hh }시간 ${m.o_soyo % 60}분)" />
								<c:set var="alive_time" value="${format_hh }:${format_mm }"></c:set>
							</c:otherwise>
						</c:choose>
						<c:set var="soyo_time" value="${soyo_hh }시간 ${m.o_soyo % 60}분"></c:set>
						<td><input type="radio" name="radioTxt" value="${m.o_price }"
							onclick="javascript:gogo('${m.o_stime }','${alive_time }','${soyo_time }','${m.movie_name }','E')">
						<fmt:formatNumber value="${m.o_price }" pattern="#,###" /> KRW</td>
						<td><input type="radio" name="radioTxt"
							value="${m.o_price + m.o_price * 0.2 }"
							onclick="javascript:gogo('${m.o_stime }','${alive_time }','${soyo_time }','${m.movie_name }','B')">
						<fmt:formatNumber value="${m.o_price + m.o_price * 0.2 }"
								pattern="#,###" /> KRW</td>
						<td><input type="radio" name="radioTxt"
							value="${m.o_price + m.o_price * 0.9 }"
							onclick="javascript:gogo('${m.o_stime }','${alive_time }','${soyo_time }','${m.movie_name }','F')">
						<fmt:formatNumber value="${m.o_price + m.o_price * 0.9 }"
								pattern="#,###" /> KRW</td>
						<td>${alive }</td>
						<td>${m.movie_name}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<br>
		<div>
			<br>
			<table>
				<tr>
					<td colspan="4" style="text-align: left">성인</td>
					<td style="text-align: right">${moviebean.people}명</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: left">영화 가격</td>
					<td style="text-align: right" id="mp"></td>
				</tr>
				<tr>
					<td>예상 결제 금액 :</td>
					<td colspan="4" style="text-align: right; color: blue" id="tot"></td>
				</tr>
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
	<a href="goindex"><input type="button" id="redirect:/index.jsp" value="취소"></a>
</body>
</html>