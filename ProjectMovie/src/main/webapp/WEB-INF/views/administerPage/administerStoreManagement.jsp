<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="administerHeader.jsp"%>
<style>
th, td, thead {
    border: 3px solid #444444;
  }
 table.txc-table{
 	width:100;
 	table-layout:fixed;
 }
 table thead tr{
 	width:100%;
 }
</style>
	<div class="container-fluid">
		<div class="row" style="padding:20px;text-align:left;">
			<div class="col-lg-9 col-md-8 col-12">
				<div>
					<h2>매점 메뉴</h2>
				</div>
				<ul class="nav nav-tabs">
					<li><a class="nav-link active" href="#food" data-toggle="tab" id="foodTab">Food</a></li>
					<li><a class="nav-link" href="#drink" data-toggle="tab" id="drinkTab">Drink</a></li>
					<li><a class="nav-link" href="#setMenu" data-toggle="tab" id="setMenuTab">SetMenu</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="food">
						<div><h4>Food 메뉴</h4></div>
						<div class="row">
							<div class="col-md-12">
								<table class="table table-striped" border="1" >							
									<thead>
										<tr>
										<c:forEach items="${foodList}" var="foodListTh">
											<th><img style="width:370px;height:auto;" src="/foodUpload/displayFile?fileName=${foodListTh.food_image}"/></th>
										</c:forEach>
										</tr>
									</thead>
									<tbody>
										<tr>
										<c:forEach items="${foodList}" var="foodListTd">
											<td>제품명 : ${foodListTd.food_name}<br>단가 : ${foodListTd.food_price}<br>수량 :${foodListTd.food_count}</td>
										</c:forEach>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="drink">
						<div><h4>Drink 메뉴</h4></div>
						<div class="row">
							<div class="col-md-12">
								<table class="table table-striped" border="1" >
									<thead>
										<tr>
										<c:forEach items="${drinkList}" var="drinkListTh">
											<th><img style="width:290px;height:auto;" src="/foodUpload/displayFile?fileName=${drinkListTh.food_image}"/></th>
										</c:forEach>
										</tr>
									</thead>
									<tbody>
										<tr>
										<c:forEach items="${drinkList}" var="drinkListTd">
											<td>제품명 : ${drinkListTd.food_name}<br>단가 : ${drinkListTd.food_price}<br>수량 :${drinkListTd.food_count}</td>
										</c:forEach>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="setMenu">
						<div><h4>SetMenu 메뉴</h4></div>
						<div class="row">
							<div class="col-md-12">
								<table class="table table-striped" border="1" >
									<thead>
										<tr>
										<c:forEach items="${setMenuList}" var="setMenuListTh">
											<th><img style="width:290px;height:auto;" src="/foodUpload/displayFile?fileName=${setMenuListTh.food_image}"/></th>
										</c:forEach>
										</tr>
									</thead>
									<tbody>
										<tr>
										<c:forEach items="${setMenuList}" var="setMenuListTd">
											<td>제품명 : ${setMenuListTd.food_name}<br>단가 : ${setMenuListTd.food_price}<br>수량 :${setMenuListTd.food_count}</td>
										</c:forEach>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br>	
	</div>
<!-- Bootstrap core JavaScript-->
<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
	$(function(){
		var msgFoodRegist = "${msgFoodRegist}";
		if(msgFoodRegist == "success"){
			alert("상품등록 성공");
		}
		//텝을 누를때 해당 페이지로 이동하기
		$("#foodTab").click(function(){
			$("#foodTab").attr("class", "nav-link active");
			$("#drinkTab").attr("class", "nav-link");
			$("#setMenuTab").attr("class", "nav-link");
			$("#food").attr("class", "tab-pane active");
			$("#drink").attr("class", "tab-pane");
			$("#setMenu").attr("class", "tab-pane");
		});
		$("#drinkTab").click(function(){
			$("#foodTab").attr("class", "nav-link");
			$("#drinkTab").attr("class", "nav-link active");
			$("#setMenuTab").attr("class", "nav-link");
			$("#food").attr("class", "tab-pane");
			$("#drink").attr("class", "tab-pane active");
			$("#setMenu").attr("class", "tab-pane");
		});
		$("#setMenuTab").click(function(){
			$("#foodTab").attr("class", "nav-link");
			$("#drinkTab").attr("class", "nav-link");
			$("#setMenuTab").attr("class", "nav-link active");
			$("#food").attr("class", "tab-pane");
			$("#drink").attr("class", "tab-pane");
			$("#setMenu").attr("class", "tab-pane active");
		});
	});
</script>
</body>
</html>