<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="includes/header2.jsp" %>
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
                                        <a class="small text-white stretched-link" href="/main2">View Chart</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">입고 차트</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Chart</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">재고현황 차트</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Chart</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
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
                     
                                 chartLabels.push(obj.selldate);
                     
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
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>

   </main>
<%@include file="includes/footer2.jsp" %>