<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="includes/header.jsp" %>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
                        <h1 class="mt-4">차트현황</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">입고,판매, 재고의 차트를 보실 수 있습니다.</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">판매 차트</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/main">View Chart</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">입고 차트</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/insertmain">View Chart</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">재고현황 차트</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/allmain">View Chart</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <!-- 차트 -->
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        판매 차트
                                    </div>
                                    
                                   
                                     <div>

									<div>
										<canvas id="canvas" height="50%" width="99%"></canvas>
							
									</div>
							
								</div>
							
								<script
									src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
							
								<script
									src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
							
								<script>
									var chartLabels = [];
							
									var chartData = [];
							
									$.getJSON("incomeList", function(data) {
										
										console.log(data);
							
										$.each(data, function(inx, obj) {
							
											chartLabels.push(displayTime(obj.selldate));
							
											chartData.push(obj.sellnum);
							
										});
							
										createChart();
							
										console.log("create Chart")
							
									});
							
									var lineChartData = {
							
										labels : chartLabels,
										
										datasets : [
							
										{
							
											label : "일별 판매",
							
											backgroundColor:"#bfdaf9",
							                borderColor: "#80b6f4",
							                pointBorderColor: "#80b6f4",
							                pointBackgroundColor: "#80b6f4",
							                pointHoverBackgroundColor: "#80b6f4",
							                pointHoverBorderColor: "#80b6f4",
							
											data : chartData
							
										}
							
										]
							
									}
							
									function createChart() {
							
										var ctx = document.getElementById("canvas").getContext("2d");
							
										LineChartDemo = Chart.Line(ctx, {
							
											data : lineChartData,
							
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

                                </div>
                            </div>
                         
                            
                            
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        월별 차트
                                        
                                    </div>
                                    
                                    <div style="width: 80%">
										<div style="width: 80%">
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
												//만약 다른 월에도 데이터가 있다면 obj2.sellnum.each로 루프를 돌려서 값을 넣어줍니다.
												chartData2.push(40,60,70,80,90,60,10,40,0,0,0,obj2.sellnum);
								
											});
								
											createChart2();
								
											console.log("create Chart")
								
										});
										var lineChartData2 = {
												
												labels : chartLabels2,
									
												datasets: [{
													label : "월별 판매",
										            data: chartData2, //컨트롤러에서 모델로 받아온다.
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
                                		</div>
                            		</div>
                        
								</div>
							</div>
				
                                      
   </main>
<script>
 function displayTime(timeValue){	
		
		var dateObj = new Date(timeValue);
		
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth()+1;
		var dd = dateObj.getDate();
		
		return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');			
		
	}//displayTime end
 </script>  
<%@include file="includes/footer.jsp" %>

