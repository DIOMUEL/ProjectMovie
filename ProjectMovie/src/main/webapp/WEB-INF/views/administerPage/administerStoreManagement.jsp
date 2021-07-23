<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="administerHeader.jsp"%>
<style>
th, td, tbody {
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
	<div class="container">
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
<!-- 음식탭 -->					
						<div><h4>Food 메뉴</h4></div>
						<div><h6>팝콘</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty foodList101}">
										<tbody>
											<tr>
									          	<th><img style="width:500px;height:500px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>		
									<c:forEach items="${foodList101}" var="foodList101">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${foodList101.food_image}"/></th>
									          	<th>제품명 : ${foodList101.food_name}<br>단가 : ${foodList101.food_price}<br>수량 :${foodList101.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div>
						<div><h6>핫도그류</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty foodList102}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>		
									<c:forEach items="${foodList102}" var="foodList102">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${foodList102.food_image}"/></th>
									          	<th>제품명 : ${foodList102.food_name}<br>단가 : ${foodList102.food_price}<br>수량 :${foodList102.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div>
						<div><h6>건어물류</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty foodList103}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>		
									<c:forEach items="${foodList103}" var="foodList103">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${foodList103.food_image}"/></th>
									          	<th>제품명 : ${foodList103.food_name}<br>단가 : ${foodList103.food_price}<br>수량 :${foodList103.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div><div><h6>치킨류</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty foodList104}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>	
									<c:forEach items="${foodList104}" var="foodList104">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${foodList104.food_image}"/></th>
									          	<th>제품명 : ${foodList104.food_name}<br>단가 : ${foodList104.food_price}<br>수량 :${foodList104.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div><div><h6>튀김류</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty foodList105}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>		
									<c:forEach items="${foodList105}" var="foodList105">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${foodList105.food_image}"/></th>
									          	<th>제품명 : ${foodList105.food_name}<br>단가 : ${foodList105.food_price}<br>수량 :${foodList105.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div><div><h6>기타류</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty foodList106}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>		
									<c:forEach items="${foodList106}" var="foodList106">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${foodList106.food_image}"/></th>
									          	<th>제품명 : ${foodList106.food_name}<br>단가 : ${foodList106.food_price}<br>수량 :${foodList106.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div>
					</div>
<!-- 음료탭 -->
					<div class="tab-pane" id="drink">
						<div><h4>Drink 메뉴</h4></div>
						<div><h6>탄산</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty drinkList201}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>		
									<c:forEach items="${drinkList201}" var="drinkList201">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${drinkList201.food_image}"/></th>
									          	<th>제품명 : ${drinkList201.food_name}<br>단가 : ${drinkList201.food_price}<br>수량 :${drinkList201.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div>
						<div><h6>생과일</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty drinkList202}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>		
									<c:forEach items="${drinkList202}" var="drinkList202">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${drinkList202.food_image}"/></th>
									          	<th>제품명 : ${drinkList202.food_name}<br>단가 : ${drinkList202.food_price}<br>수량 :${drinkList202.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div>
						<div><h6>커피</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty drinkList203}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>		
									<c:forEach items="${drinkList203}" var="drinkList203">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${drinkList203.food_image}"/></th>
									          	<th>제품명 : ${drinkList203.food_name}<br>단가 : ${drinkList203.food_price}<br>수량 :${drinkList203.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div>
						<div><h6>기타</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty drinkList204}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>	
									<c:forEach items="${drinkList204}" var="drinkList204">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${drinkList204.food_image}"/></th>
									          	<th>제품명 : ${drinkList204.food_name}<br>단가 : ${drinkList204.food_price}<br>수량 :${drinkList204.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div>
					</div>
					<div class="tab-pane" id="setMenu">
						<div><h4>SetMenu 메뉴</h4></div>
						<div><h6>세트</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty setMenuList301}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>		
									<c:forEach items="${setMenuList301}" var="setMenuList301">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${setMenuList301.food_image}"/></th>
									          	<th>제품명 : ${setMenuList301.food_name}<br>단가 : ${setMenuList301.food_price}<br>수량 :${setMenuList301.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
								</table>
							</div>	
						</div>
						<div><h6>기타</h6></div>
						<div class="row">
							<div style="width:80%;float:left">
								<table class="table table-striped" border="1" >
									<c:if test="${empty setMenuList302}">
										<tbody>
											<tr>
									          	<th><img style="width:370px;height:370px;" src=".././resources/administerPage/img/404.jpg"/></th>
									        </tr>
									    </tbody>
									</c:if>		
									<c:forEach items="${setMenuList302}" var="setMenuList302">
										<tbody>
											<tr>
									          	<th rowspan="2"><img style="width:370px;height:370px;" src="/foodUpload/displayFile?fileName=${setMenuList302.food_image}"/></th>
									          	<th>제품명 : ${setMenuList302.food_name}<br>단가 : ${setMenuList302.food_price}<br>수량 :${setMenuList302.food_count}</th>
									        </tr>
								       		<tr>
								      			<td>
								      				<button type="button" class="btn btn-primary">제품명수정</button><br>
								      				<button type="button" class="btn btn-primary">단가수정</button><br>
								      				<button type="button" class="btn btn-primary">수량수정</button><br>
								      				<button type="button" class="btn btn-secondary">삭제</button>
								      			</td>
								        	</tr>
								        </tbody>
							        </c:forEach>
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