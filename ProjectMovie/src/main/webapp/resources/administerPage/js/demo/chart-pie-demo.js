// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var label_rate20 = (document.getElementById("label_rate20")).value;
var label_rate30 = (document.getElementById("label_rate30")).value;
var label_rate40 = (document.getElementById("label_rate40")).value;
var label_rate50 = (document.getElementById("label_rate50")).value;
var label_rate60 = (document.getElementById("label_rate60")).value;

var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: [ "20대 이하", "30대", "40대", "50대", "60대 이상"],
    datasets: [{
      data: [label_rate20, label_rate30, label_rate40, label_rate50, label_rate60],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc','#f6c23e', '#e74a3b'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#D7DF01', '#B40404'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
