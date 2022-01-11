<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <link rel="stylesheet" href="/resources/css/styles.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
         <!-- 달력 -->
      <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
      
      <style>
         div.col{
         padding: 5px;
         }
      </style>

    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">재고 관리 프로그램</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        
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
                            <div class="sb-sidenav-menu-heading">MAIN</div>
                            <a class="nav-link" href="/">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                메인으로
                            </a>
                            <div class="sb-sidenav-menu-heading">SYSTEM</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                재고관리시스템
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                               <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/putin">입고관리</a>
                                    <a class="nav-link" href="/tables-2">판매관리</a>
                                    <a class="nav-link" href="/tables-3">판매내역조회</a>
                                    <a class="nav-link" href="/tables-4">재고현황</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                계정관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">ETC</div>
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
                        Administer
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h4 class="mt-4">입고 관리</h1>
                        
                        <div class="card mb-4">
                            <div class="card-body">
                               입고관리탭입니다. 신규 입고 등록, 삭제와 입고 내역 조회가 가능합니다. 
                            </div>
                        </div>
                      
                      <button type="button" class="btn btn-secondary btn-sm" id="new">신규</button>
                      <button type="button" class="btn btn-secondary btn-sm" id="select">조회</button>
                        
                        <div class="container">
                    <div class="row">
                      <div class="col">
                      <label>입고일자</label>
                         <input type="text" id="putindate" placeholder="날짜를 입력해주세요">
                      <script>
                          $(function () {
                             $.datepicker.setDefaults($.datepicker.regional['ko']);
                              $("#putindate").datepicker({dateFormat:'yy-mm-dd'});
                          });
                      </script>

                    </div>
                
             <div class="panel panel-default">
                 <div class="panel-heading"><b> <i class="fas fa-table me-1"></i>
                                입고 관리 </b> 
                                
                             <div>
                          <h5>Excel Download</h5>
                          <form action="/excelDown" method="get">
                              <button type="submit">Excel</button>
                          </form>
                    <form id="form1" name="form1">
						<input type="file" id="fileInput" name="fileInput">
						<button type="button" onclick="doExcelUploadProcess()">엑셀업로드 작업</button>
				</form>
             </div>
           </div>

                  
                  
                 <div class="panel-body contents">
                  
                  <div class="tbl_user_data"></div>
               
                 </div>
               
               </div>
                </main>
   <%-- 신규 입고내역 작성 폼 --%>
   <div class="modal" tabindex="-1" id="newModal">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
           <h5 class="modal-title">신규 
           입고 내역 등록</h5>
         </div>
         <div class="modal-body">
           <div class="form-group">
              <label for="">제품 코드</label>
              <input type="text" name="code" class="form-control" value=""/>
           </div>
           <div class="form-group">
              <label for="">입고 수량</label>
              <input type="text" name="num" class="form-control" value=""/>
           </div>        
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" id="modalRegisterBtn">등록</button>
           <button type="button" class="btn btn-secondary" data-dismiss="modal" id="modalCloseBtn">종료</button>
         </div>
       </div>
     </div>
   </div>

<script>
   let csrfHeaderName = "${_csrf.headerName}";
   let csrfTokenValue = "${_csrf.token}";
</script>         
    <script src="/resources/js/putin.js"></script>
    <script src="/resources/js/newmodal.js"></script>
    <script src="/resources/js/module.js"></script> 		
<%@include file="includes/footer.jsp" %>