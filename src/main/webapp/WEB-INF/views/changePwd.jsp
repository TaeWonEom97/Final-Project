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
    <title>Password Change - SB Admin</title>
    <link rel="stylesheet" href="/resources/css/styles.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<title>Insert title here</title>
</head>
<body class="bg-primary"  style="--bs-bg-opacity: .5;">
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
                   <li><a class="dropdown-item" href="/changePwd">비밀번호 변경</a></li>           
                   <li><a class="dropdown-item" href="/logoutForm">로그아웃</a></li>           
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 변경</h3></div>
                                    <div class="card-body">
                                        <div class="small mb-3 text-muted">현재 비밀번호를 새로운 비밀번호로 변경합니다.</div>
                                        <form id="regist" action="" method="post" role="form">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="password" name="password" type="password" placeholder="현재 비밀번호 입력" />
                                                <label for="userid">현재 비밀번호</label>
                                                <small id="password" class="text-info"></small>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="new_password" name="new_password" type="password" placeholder="변경할 비밀번호 입력" />
                                                <label for="new_password">새 비밀번호</label>
                                                <small id="new_password" class="text-info"></small>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="corfirm_password" name="corfirm_password" type="password" placeholder="변경할 비밀번호 확인" />
                                                <label for="corfirm_password">새 비밀번호 확인</label>
                                                <small id="corfirm_password" class="text-info"></small>
                                            </div>
                                            <c:choose>
												<c:when test="${msg eq '성공'}"><script>alert("비밀번호 변경 완료\n다시 로그인 해주세요.");window.location="/login";</script></c:when>
												<c:when test="${msg eq '실패'}"><script>alert("입력한 비밀번호를 확인해 주세요.");</script></c:when>
											</c:choose>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            	<a class="text-lg-end text-center" href="/forgotPwd">비밀번호 찾기로 이동</a>
                                                <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                                            </div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </form>
                                    </div>
                                    <div class="text-center card-footer small py-3">
                                        <a href="/login">로그인 화면으로 이동</a>
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
			let csrfHeaderName = "${_csrf.headerName}";
			let csrfTokenValue = "${_csrf.token}";
		</script>
		<!-- validation 사용자 작성 코드 삽입-->
		<script src="/resources/js/changePwd.validate.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
    </body>
</html>