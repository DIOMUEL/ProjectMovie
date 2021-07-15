<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<script src="/resources/administerPage/js/demo/chart-area-myGenreAreaChart.js"></script>
		<script src="/resources/administerPage/js/demo/chart-area-myMovieAreaChart.js"></script>
		<script src="/resources/administerPage/js/demo/chart-area-myMonthAreaChart.js"></script>
		<script src="/resources/administerPage/js/demo/chart-area-myWeekAreaChart.js"></script>
		<script src="/resources/administerPage/js/demo/chart-area-myDaysAreaChart.js"></script>
		<script src="/resources/administerPage/js/demo/chart-pie-demo.js"> </script>	
		<script>
			$(document).ready(function(){
				$("#myTotal").click(function(){
					$("#myTotalAreaChart").attr("style", "");
					$("#myGenreAreaChart").attr("style", "display:none");
					$("#myMovieAreaChart").attr("style", "display:none");
					$("#myMonthAreaChart").attr("style", "display:none");
					$("#myWeekAreaChart").attr("style", "display:none");
					$("#myDaysAreaChart").attr("style", "display:none");
				});
				$("#myGenre").click(function(){
					$("#myTotalAreaChart").attr("style", "display:none");	
					$("#myGenreAreaChart").attr("style", "");
					$("#myMovieAreaChart").attr("style", "display:none");
					$("#myMonthAreaChart").attr("style", "display:none");
					$("#myWeekAreaChart").attr("style", "display:none");
					$("#myDaysAreaChart").attr("style", "display:none");
				});
				$("#myMovie").click(function(){
					$("#myTotalAreaChart").attr("style", "display:none");	
					$("#myGenreAreaChart").attr("style", "display:none");
					$("#myMovieAreaChart").attr("style", "");
					$("#myMonthAreaChart").attr("style", "display:none");
					$("#myWeekAreaChart").attr("style", "display:none");
					$("#myDaysAreaChart").attr("style", "display:none");
				});
				$("#myMonth").click(function(){
					$("#myTotalAreaChart").attr("style", "display:none");	
					$("#myGenreAreaChart").attr("style", "display:none");
					$("#myMovieAreaChart").attr("style", "display:none");
					$("#myMonthAreaChart").attr("style", "");
					$("#myWeekAreaChart").attr("style", "display:none");
					$("#myDaysAreaChart").attr("style", "display:none");
				});
				$("#myWeek").click(function(){
					$("#myTotalAreaChart").attr("style", "display:none");	
					$("#myGenreAreaChart").attr("style", "display:none");
					$("#myMovieAreaChart").attr("style", "display:none");
					$("#myMonthAreaChart").attr("style", "display:none");
					$("#myWeekAreaChart").attr("style", "");
					$("#myDaysAreaChart").attr("style", "display:none");
				});
				$("#myDays").click(function(){
					$("#myTotalAreaChart").attr("style", "display:none");	
					$("#myGenreAreaChart").attr("style", "display:none");
					$("#myMovieAreaChart").attr("style", "display:none");
					$("#myMonthAreaChart").attr("style", "display:none");
					$("#myWeekAreaChart").attr("style", "display:none");
					$("#myDaysAreaChart").attr("style", "");
				});
			});
		</script>
	</body>
</html>