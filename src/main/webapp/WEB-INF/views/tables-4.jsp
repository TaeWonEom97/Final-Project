<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>


<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
         <!-- 수정 삭제 -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="/resources/css/styles.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="/resources/css/styles.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">재고관리프로그램</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                메인으로
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                							재고관리시스템
                                <div class="sb-sidenav-collapse-ar"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/tables-1">입고관리</a>
                                    <a class="nav-link" href="/tables-2">판매관리</a>
                                    <a class="nav-link" href="/tables-4">재고현황 및 조회</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                계정관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">                                   
                                            <a class="nav-link" href="login.html">로그인</a>
                                            <a class="nav-link" href="register.html">신규등록</a>
                                            <a class="nav-link" href="password.html">비밀번호찾기</a>
                                        </nav>                                                                         
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                               보고서
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                게시판
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">재고현황 및 조회</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">재고관리 시스템</a></li>
                            <li class="breadcrumb-item active">재고현황</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                재고현황 페이지입니다. 현재 재고수량을 열람하실 수 있으며, 수정,삭제 및 조회가 가능합니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                현재 재고 수량
                            </div>
                            <div class="card-body tbl_user_data">
                                 <table id="datatablesSimple">
                                  <thead>
                                        <tr>
                                            <th>제조사</th>
                                            <th>상품명</th>
                                            <th>상품코드</th>
                                            <th>사이즈</th>
                                            <th>색상</th>
                                            <th>가격</th>
                                            <th>현재재고수량 </th>                                      
                                        </tr>
                                    </thead>    
                                     <tbody>
                                    <c:forEach var="dto" items="${list}">
                                        <tr>
                                           <td>${dto.supplier}</td>
                                           <td>${dto.itemtitle}</td> 
                                            <td>${dto.itemcode}</td>
                                             <td>${dto.itemsize}</td>
                                             <td>${dto.color }</td>                                            
											 <td><fmt:formatNumber type="number" value="${dto.itemprice}" /></td>                                          
                                            <td>${dto.stock}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>                           
                                  </table>    
                            </div>
                        </div>
                        
                    </div>
                </main>
                 <!-- Modal -->
				<div class="modal fade" id="lookup_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h4 class="modal-title" id="myModalLabel">날짜 조회</h4>
				      </div>
				      <div class="modal-body">
				       <p>기간: <input type="text" id="datepicker"></p>
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-success" id = "lookupbtn2">찾기</button>				      
				        <button type="button" class="btn btn-primary" id = "closebtn" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
                
                
				                <%-- sell 추가 모달 --%>
				<div class="modal" tabindex="-1" id="sellModal">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">판매 수정</h5>
				      </div>
				      <div class="modal-body">				        
				        <div class="form-group">
				           <label for="">상품 코드</label>
				           <input type="text" name="sellcode" class="form-control" placeholder="상품 코드"/>
				        </div>      				             
				        <div class="form-group">
				           <label for="">재고수량</label>
				           <input type="text" name="sellnum" class="form-control" placeholder="수량"/>
				        </div>      				           
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-warning" id="modalModifyBtn">수정</button>				       
				        <button type="button" class="btn btn-primary" data-dismiss="modal" id="modalCloseBtn">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
                
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
         <script src="/resources/js/sell.js"></script>
		<script src="/resources/js/modal.js"></script>
		<script src="/resources/js/edit.js"></script>  
    </body>
</html>
