<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
										<div>

													<canvas id="canvas2" height="63%" width="80%"></canvas>
										
												</div>
										 
											</div>
											<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
										
											<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
											
											<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
											
											<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
											<script
											src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
							
											<script
												src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
										<script>
										var chartLabels2 = [];
										
										var chartData2 = [];
										
										$.getJSON("OutcomeList", function(data) {
											
											console.log(data);
								
											$.each(data, function(inx, obj2) {
								
												chartLabels2.push("Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec");
								
												chartData2.push(obj2.sellnum);
								
											});
								
											createChart2();
								
											console.log("create Chart")
								
										});
										var lineChartData2 = {
												
												labels : chartLabels2,
									
												datasets: [{
										            data: chartdata2, //컨트롤러에서 모델로 받아온다.
										            backgroundColor: [
										                'rgba(255, 99, 132, 0.2)',
										                'rgba(54, 162, 235, 0.2)'
										
										            ],
										            borderColor: [
										                'rgba(255,99,132,1)',
										                'rgba(54, 162, 235, 1)'
										
										            ],
										            borderWidth: 1
										        }
										        ]
									
											}
										function createChart2() {
											
											var ctx = document.getElementById("canvas2").getContext('2d');
								
											var myChart = new Chart(ctx, {
								
												data : lineChartData2,
												type: 'bar',
												options : {
								
													scales : {
								
														yAxes : [ {
								
															ticks : {
								
																beginAtZero : true
								
															}
								
														} ]
								
													}
								
												}
								
											})
								
										}
										
										</script>	
</body>
</html>