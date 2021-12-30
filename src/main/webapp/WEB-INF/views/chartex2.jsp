<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 60%">

		<div>

			<canvas id="canvas" height="100%" width="40%"></canvas>

		</div>

	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

	<script>
		var myLineChart = {
			labels : [],
			dataSets : [],
			render : function() {
				new Chart($("#myBarChart"), {
					type : 'bar',
					data : {
						labels : myLineChart.labels,
						datasets : [ {
							label : "매출액",
							lineTension : 0.3,
							backgroundColor : "rgba(2,117,216,0.2)",
							borderColor : "rgba(2,117,216,1)",
							pointRadius : 5,
							pointBackgroundColor : "rgba(2,117,216,1)",
							pointBorderColor : "rgba(255,255,255,0.8)",
							pointHoverRadius : 5,
							pointHoverBackgroundColor : "rgba(2,117,216,1)",
							pointHitRadius : 50,
							pointBorderWidth : 2,
							data : myLineChart.dataSets,
						} ],
					},
					options : {
						responsive : true,
						scales : {
							xAxes : [ {
								time : {
									unit : 'month'
								},
								gridLines : {
									display : false
								},
								ticks : {
									maxTicksLimit : 7
								}
							} ],
							yAxes : [ {
								/*          y값에 따라 최소, 최대치 표시를 자동으로 설정하기 위해 주석처리
								              ticks: {
								              min: 0,
								              max: 40000,
								              maxTicksLimit: 5
								            },*/
								gridLines : {
									color : "rgba(0, 0, 0, .125)",
								}
							} ],
						},
						legend : {
							display : false
						}
					}
				});
			},
			showData : function() {
				labels = [];
				dataSets = [];
				$.ajax({
					type : 'GET',
					url : 'monthly-sales/2020',
					contentType : 'application/json',
					//dataType 정의
					dataType : 'json',
					//요청결과가 성공일 경우
					success : function(data) {
						//console.log(data);
						$.each(data, function(index, obj) {
							myLineChart.labels.push(obj.selldate);
							myLineChart.dataSets.push(obj.sellnum);
						});
						myLineChart.render();
					},
					//요청결과가 실패일 경우
					error : function(xhr, status, error) {
					}
				});
			}
		};

		myLineChart.showData();
	</script>




</body>

</html>