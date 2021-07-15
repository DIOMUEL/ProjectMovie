// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart 월별 각 영화별 수익
var ctx = document.getElementById("myMonthStoreAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    datasets: [{
    	label: "영화1",
	    lineTension: 0.3,
	    backgroundColor: "rgba(78, 115, 223, 0.05)",
	    borderColor: "rgba(78, 115, 223, 1)",
	    pointRadius: 3,
	    pointBackgroundColor: "rgba(78, 115, 223, 1)",
	    pointBorderColor: "rgba(78, 115, 223, 1)",
	    pointHoverRadius: 3,
	    pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	    pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	    pointHitRadius: 10,
	    pointBorderWidth: 2,
	    data: [40000, 25000, 30000, 20000, 25000, 15000, 20000, 10000, 15000, 5000, 10000, 0],  
    },{
	    label: "영화2",
	    lineTension: 0.3,
	    backgroundColor: "rgba(223, 115, 78, 0.05)",
	    borderColor: "rgba(223, 115, 78, 1)",
	    pointRadius: 3,
	    pointBackgroundColor: "rgba(223, 115, 78, 1)",
	    pointBorderColor: "rgba(223, 115, 78, 1)",
	    pointHoverRadius: 3,
	    pointHoverBackgroundColor: "rgba(223, 115, 78, 1)",
	    pointHoverBorderColor: "rgba(223, 115, 78, 1)",
	    pointHitRadius: 10,
	    pointBorderWidth: 2,
	    data: [0, 15000, 25000, 10000, 30000, 40000, 20000, 35000, 30000, 15000, 5000, 20000],  
    },{
        label: "영화3",
        lineTension: 0.3,
        backgroundColor: "rgba(115, 115, 115, 0.05)",
        borderColor: "rgba(115, 115, 115, 1)",
        pointRadius: 3,
        pointBackgroundColor: "rgba(115, 115, 115, 1)",
        pointBorderColor: "rgba(115, 115, 115, 1)",
        pointHoverRadius: 3,
        pointHoverBackgroundColor: "rgba(115, 115, 115, 1)",
        pointHoverBorderColor: "rgba(115, 115, 115, 1)",
        pointHitRadius: 10,
        pointBorderWidth: 2,
        data: [40000, 25000, 25000, 20000, 30000, 5000, 10000, 15000, 18000, 35000, 19000, 40000],  
    }],
  },
  options: {
	  title: {
	      display: true,
	      text: '월별 영화 수익'
	  },
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 12
        },
        scaleLabel: {
            display: true,
            labelString: '월'
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return '$' + number_format(value);
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        },
        scaleLabel: {
            display: true,
            labelString: '수익'
        }
      }],
    },
    legend: {
      display: true
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
        }
      }
    }
  }
});

