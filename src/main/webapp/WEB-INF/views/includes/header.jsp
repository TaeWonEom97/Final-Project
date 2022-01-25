<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>재고 관리 프로그램</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="/resources/css/styles.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<style>
   .text-white{
      margin-top: 10px;
   }
</style>
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
         <li class="nav-item dropdown"><a
            class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
            role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
               class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end"
               aria-labelledby="navbarDropdown">
               <sec:authorize access="isAnonymous()">
                  <li><a class="dropdown-item" href="/register">Register</a></li>
                  <li><a class="dropdown-item" href="/forgotPwd">ForgotPassword</a></li>
                  <li><hr class="dropdown-divider" /></li>
                  <li><a class="dropdown-item" href="/login">Login</a></li>
               </sec:authorize>
               <sec:authorize access="isAuthenticated()">
                  <li><a class="dropdown-item" href="/changePwd">ChangePassword</a></li>
                  <li><a class="dropdown-item" href="/logoutForm">Logout</a></li>
               </sec:authorize>
               </ul>
            </li>
            <sec:authorize access="isAuthenticated()" >
               <li class="text-white"><sec:authentication property="name" />님 안녕하세요</li>
            </sec:authorize>
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
                     <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <a class="nav-link" href="/item">제품관리</a>
                     </sec:authorize>
                        <a class="nav-link" href="/putin">입고관리</a>
                        <a class="nav-link" href="/sellPage">판매관리</a>
                        <a class="nav-link" href="/stock">재고현황 및 조회</a>
                     </nav>
                  </div>
                  <div class="sb-sidenav-menu-heading">Account</div>
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
                     aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                     <nav class="sb-sidenav-menu-nested nav">
                        <sec:authorize access="isAnonymous()">
                           <a class="nav-link" href="/login">로그인</a>
                           <a class="nav-link" href="/register">신규등록</a>
                           <a class="nav-link" href="/forgotPwd">비밀번호 찾기</a>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                           <a class="nav-link" href="/changePwd">비밀번호 변경</a>
                           <a class="nav-link" href="/logoutForm">로그아웃</a>
                        </sec:authorize>
                     </nav>
                  </div>
                   <a class="nav-link" href="/board/list">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-table"></i>
                     </div> 게시판                
                  </a>
                  <sec:authorize access="hasRole('ROLE_ADMIN')">
                   <div class="sb-sidenav-menu-heading">관리자메뉴</div>
                  <a class="nav-link" href="/adminPage">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-chart-area"></i>
                     </div> 사용자 관리
                  </a>
                  <a class="nav-link" href="/client">
                     <div class="sb-nav-link-icon">
                        <i class="fas fa-chart-area"></i>
                     </div> 거래처 관리
                  </a>
                  </sec:authorize>
               </div>
            </div>
                    <div class="sb-sidenav-footer">
                        <div class="text align">welcome :)</div>
                    </div>
                </nav>
            </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>