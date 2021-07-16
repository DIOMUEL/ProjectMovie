<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../administerHeader.jsp" %>
	<title>영화 총 수익 차트</title>
		<div class="row">
			<!-- Area Chart -->
			<div class="col-xl-8 col-lg-7">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">영화 배급및 수요량</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
						</div>
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
		<script src="/resources/administerPage/js/demo/chart-area-myTotalAreaChart.js"></script>
	</body>
</html>		