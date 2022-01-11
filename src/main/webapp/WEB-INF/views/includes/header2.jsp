<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link
   href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
   rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/styles.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
   crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<body class="sb-nav-fixed">
   <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="/">재고관리프로그램</a>
      <!-- Sidebar Toggle-->
      <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
         id="sidebarToggle" href="#!">
         <i class="fas fa-bars"></i>
      </button>
      <!-- Navbar-->
      <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
      <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
         <sec:authorize access="isAnonymous()" >                     
                           <li><a class="dropdown-item" href="#!">Settings</a></li>
                           <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                           <li><hr class="dropdown-divider" /></li>
                           <li><a class="dropdown-item" href="/login">Login</a></li>     
                         </sec:authorize>
                           
                        <sec:authorize access="isAuthenticated()" >
	                       <li><a class="dropdown-item" href="/changePwd">ChangePassword</a></li>           
	                       <li><a class="dropdown-item" href="/logoutForm">Logout</a></li>           
	                    </sec:authorize>
            </ul></li>
      </ul>
   </nav>
   <div id="layoutSidenav">
      <div id="layoutSidenav_nav">
         <nav class="sb-sidenav accordion sb-sidenav-dark"
            id="sidenavAccordion">
            <div class="sb-sidenav-menu">
               <div class="nav">
                  <div class="sb-sidenav-menu-heading">Core</div>
                  <a class="nav-link" href="/">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-tachometer-alt"></i>
                     </div> 메인으로
                  </a>
                  <div class="sb-sidenav-menu-heading">Interface</div>
                  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                     data-bs-target="#collapseLayouts" aria-expanded="false"
                     aria-controls="collapseLayouts">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-columns"></i>
                     </div> 재고관리시스템
                     <div class="sb-sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                     </div>
                  </a>
                  <div class="collapse" id="collapseLayouts"
                     aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                     <nav class="sb-sidenav-menu-nested nav">
                     
                        <a class="nav-link" href="/item">제품관리</a>
                        <a class="nav-link" href="/putin">입고관리</a>
                        <a class="nav-link" href="/sellPage">판매관리</a>
                        <a class="nav-link" href="/tables-4">재고현황 및 조회</a>
                     </nav>
                     
                  </div>
                  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                     data-bs-target="#collapsePages" aria-expanded="false"
                     aria-controls="collapsePages">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-book-open"></i>
                     </div> 계정관리
                     <div class="sb-sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                     </div>
                  </a>
                  
                  
                  <div class="collapse" id="collapsePages"
                     aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                     <nav class="sb-sidenav-menu-nested nav accordion"
                        id="sidenavAccordionPages">
                        
                       <div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <sec:authorize access="isAnonymous()" >   
	                                    <a class="nav-link" href="/login">로그인</a>
	                                    <a class="nav-link" href="/register">신규등록</a>
	                                    <a class="nav-link" href="/forgotPwd">비밀번호 찾기</a>
                                     </sec:authorize>
			                         <sec:authorize access="isAuthenticated()" >
			                         	<a class="nav-link" href="/changePwd">비밀번호 변경</a>
			                         	<a class="nav-link" href="/logoutForm">로그아웃</a>
			                         </sec:authorize>
                           </nav>
                        </div>

                     </nav>
                  </div>
                  <div class="sb-sidenav-menu-heading">Addons</div>
                  <a class="nav-link" href="charts.html">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-chart-area"></i>
                     </div> 보고서
                  </a> <a class="nav-link" href="/board/list">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-table"></i>
                     </div> 게시판
                     
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