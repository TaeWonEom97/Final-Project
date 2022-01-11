<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="includes/header.jsp" %>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
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
                                        재고 차트
                                    </div>
                                     <div>

									<div>
										<canvas id="canvas4" height="50%" width="99%"></canvas>
							
									</div>
							
								</div>
							
								<script
									src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
							
								<script
									src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
							
								<script>
									var chartLabels = [];
							
									var chartData = [];
							
									$.getJSON("allsellList", function(data) {
										
										console.log(data);
							
										$.each(data, function(inx, obj) {
							
											chartLabels.push(obj.goods_cate);
							
											chartData.push(obj.stock);
							
										});
							
										createChart();
							
										console.log("create Chart")
							
									});
							
									var lineChartData = {
							
										labels : chartLabels,
										
										datasets : [
							
										{
							
											label : "재고 현황",
							
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
							
										var ctx = document.getElementById("canvas4").getContext("2d");
							
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
                                        월별 재고차트
                                        
                                    </div>
                                    
                                    <div style="width: 80%">
										<div style="width: 80%">
										<div>
										<div>

													<canvas id="canvas5" height="63%" width="80%"></canvas>
										
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
										var chartLabels3 = [];
										
										var chartData3 = [];
										
										$.getJSON("allsellbarList", function(data) {
											
											console.log(data);
								
											$.each(data, function(inx, obj3) {
								
												// chartLabels3.push("Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec");
												chartLabels3.push("1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월");
												//만약 다른 월에도 데이터가 있다면 obj3.stock.each로 루프를 돌려서 값을 넣어줍니다.
												chartData3.push(obj3.stock,40,10,30,90,30,50,10,40,10,15,5);
								
											});
								
											createChart3();
								
											console.log("create Chart")
								
										});
										var lineChartData3 = {
												
												labels : chartLabels3,
									
												datasets: [{
													label : "월별 재고현황",
										            data: chartData3, //컨트롤러에서 모델로 받아온다.
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
										function createChart3() {
											
											var ctx = document.getElementById("canvas5").getContext('2d');
								
											var myChart = new Chart(ctx, {
								
												data : lineChartData3,
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
					</div>
   </main>
<%@include file="includes/footer.jsp" %>