<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="administerChartHeader.jsp" %>
	<title>영화 총 수익 차트</title>
		<div class="row">
			<!-- Area Chart -->
			<div class="col-xl-12 col-lg-10" style="align-self:center">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">영화 배급및 수요량</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area">
							<canvas class="chart-change" id="myTotalAreaChart"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript-->
		<script src="/resources/administerPage/vendor/jquery/jquery.min.js"></script>
		<script src="/resources/administerPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="/resources/administerPage/vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="/resources/administerPage/js/sb-admin-2.min.js"></script>
		<!-- Page level plugins -->
		<script src="/resources/administerPage/vendor/chart.js/Chart.min.js"></script>
		<!-- Page level custom scripts -->
		<script src="/resources/administerPage/js/demo/chart-area-myTotalAreaChart.js"></script>	
	</body>
</html>		