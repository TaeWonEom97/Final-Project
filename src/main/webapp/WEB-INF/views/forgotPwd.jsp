<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Password Reset - SB Admin</title>
    <link rel="stylesheet" href="/resources/css/styles.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
 <body class="bg-primary">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
       <!-- Navbar Brand-->
       <a class="navbar-brand ps-3" href="/"><i class="fas fa-home"></i>  재고관리프로그램</a>
       <!-- Sidebar Toggle-->
       <!-- <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button> -->
       <!-- Navbar-->
       <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
           <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
               <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                   <sec:authorize access="isAnonymous()">              
                      <li><a class="dropdown-item" href="/register">Register</a></li>
                      <li><a class="dropdown-item" href="/forgotPwd">ForgotPassword</a></li>
                      <li><hr class="dropdown-divider" /></li>
                      <li><a class="dropdown-item" href="/login">Login</a></li>     
                    </sec:authorize>
                   <sec:authorize access="isAuthenticated()" >
                   <li><a class="dropdown-item" href="/changePwd">ChangePassword</a></li>           
                   <li><a class="dropdown-item" href="/logoutForm">Logout</a></li>           
                </sec:authorize>               
               </ul>
           </li>
       </ul>
   </nav>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">임시 비밀번호 발급</h3></div>
                                    <div class="card-body">
                                        <div class="small mb-3 text-muted">아이디랑 회사명을 입력해서 임시 비밀번호를 새로 발급합니다.</div>
                                        <form action="/forgotPwd" method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userid" name="userid" type="email" placeholder="아이디 입력" />
                                                <label for="userid">아이디(이메일 형식)</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="company" name="company" type="text" placeholder="회사명 입력" />
                                                <label for="company">회사명</label>
                                            </div>
											<c:choose>
												<c:when test="${msg eq '성공'}"><script>alert("이메일 발송 완료\n로그인 페이지로 이동");window.location="/login";</script></c:when>
												<c:when test="${msg eq '실패'}"><script>alert("아이디나 회사명을 확인해 주세요.");</script></c:when>
											</c:choose>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            	<a class="text-lg-start text-center" href="/login">로그인 화면으로 이동</a>
                                                <button type="submit" class="btn btn-primary">임시 비밀번호 발급</button>
                                            </div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </form>
                                    </div>
                                    <div class="text-center card-footer small py-3">
                                        <a class="text-lg-end" href="/register">회원가입</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
    </body>
</html>