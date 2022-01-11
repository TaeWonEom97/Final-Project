<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Register - SB Admin</title>
	<link rel="stylesheet" href="/resources/css/styles.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
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
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원 등록</h3></div>
                                    <div class="card-body">
                                        <form id="regist" method="post" action="/register">
                                            <div class="row mb-3">
                                                <div class="form-floating mb-3">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="company" name="company" type="text" placeholder="회사명"/>
	                                                    <label for="company" class="col-form-label">회사명</label>
                                                        <small id="company" class="text-info"></small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userid" name="userid" type="email" placeholder="아이디"/>
	                                            <label for="userid" class="col-form-label">아이디(이메일 형식)</label>
                                                <small id="userid" class="text-info"></small>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="password" name="password" type="password" placeholder="비밀번호"/>
	                                                    <label for="password" class="col-form-label">비밀번호</label>
                                                        <small id="password" class="text-info"></small>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPasswordConfirm" name="inputPasswordConfirm" type="password" placeholder="비밀번호 확인"/>
	                                                    <label for="inputPasswordConfirm" class="col-form-label">비밀번호 확인</label>
                                                        <small id="inputPasswordConfirm" class="text-info"></small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-center align-items-center justify-content-between mt-4 mb-0">
                                                <button type="submit" class="btn btn-primary ">회원가입</button>
                                            </div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="/login">로그인으로 이동</a></div>
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
<script>
	// ajax 동작시 헤더 값에 포함해서 보낼 csrf 토큰 값 설정
	let csrfHeaderName = "${_csrf.headerName}";
	let csrfTokenValue = "${_csrf.token}";
</script>
	<!-- validation 사용자 작성 코드 삽입-->
	<script src="/resources/js/register.validate.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="/resources/js/scripts.js"></script>
    </body>
</html>