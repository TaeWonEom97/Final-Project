<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/styles.css" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">재고관리프로그램</a>
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
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
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
						<a class="nav-link" href="index.html">
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
								<a class="nav-link" href="/views/tables">입고관리</a> <a
									class="nav-link" href="/views/tables2">판매관리</a> <a
									class="nav-link" href="/views/tables3">판매내역조회</a> <a
									class="nav-link" href="/views/tables4">재고현황</a>
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
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>

							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 기능추가예정
						</a> <a class="nav-link" href="board">
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
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">사내 게시판</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active">Tables</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">사내 게시판입니다.</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> LIST
						</div>
						<div class="card-body">
							<div class="dataTable-top">
								<div class="dataTable-dropdown">
									<label><select class="dataTable-selector">
											<option value="5">5</option>
											<option value="10" selected="">10</option>
											<option value="15">15</option>
											<option value="20">20</option>
											<option value="25">25</option>
									</select> </label>
								</div>
								<button id='regBtn' type='button' class='btn btn-xs pull-right'
									onclick="location.href='/board/register'">새 게시글 작성</button>
									
								<div class="dataTable-search">
									<input class="dataTable-input" placeholder="Search..."
										type="text" />
								</div>
							</div>
							<table id="datatablesSimple" class="dataTable-table">
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성날짜</th>
										<th>수정날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${list}">
										<tr>
											<td>${dto.bno}</td>
											<td><a href="${dto.bno}" class="move">${dto.title}</a>[${dto.replycnt}]</td>
											<td>${dto.writer}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
													value="${dto.regdate}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
													value="${dto.updatedate}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
			<div class="row">
               <!-- start search -->
               <div class="col-md-12">
                  <div class="col-md-8">
                     <!--search Form-->
                     <form action="" method="get" id="searchForm">
                        <input type="hidden" name="pageNum"
                           value="${pageDto.cri.pageNum}" /> <input type="hidden"
                           name="amount" value="${pageDto.cri.amount}" /> <select
                           name="type" id="">
                           <option value="">------------</option>
                           <option value="T" <c:out value="${pageDto.cri.type == 'T'?'selected':''}"/>>제목</option>
                           <option value="C" <c:out value="${pageDto.cri.type == 'C'?'selected':''}"/>>내용</option>
                           <option value="W" <c:out value="${pageDto.cri.type == 'W'?'selected':''}"/>>작성자</option>
                           <option value="TC" <c:out value="${pageDto.cri.type == 'TC'?'selected':''}"/>>제목 or 내용</option>
                           <option value="TW" <c:out value="${pageDto.cri.type == 'TW'?'selected':''}"/>>제목 or 작성자</option>
                           <option value="TCW" <c:out value="${pageDto.cri.type == 'TCW'?'selected':''}"/>>제목 or 내용 or 작성자</option>
                        </select> 
                        <input type="text" name="keyword" id="" value='<c:out value="${pageDto.cri.keyword}"/>' />
                        <button class="btn btn-default">Search</button>
                     </form>

                  </div>
                  <div class="col-md-2 col-md-offset-2">
                     <!--페이지 목록 갯수 지정하는 폼-->
                     <select name="" id="amount" class="form-control">
                        <option value="10"
                           <c:out value="${pageDto.cri.amount == 10?'selected':''}"/>>10</option>
                        <option value="20"
                           <c:out value="${pageDto.cri.amount == 20?'selected':''}"/>>20</option>
                        <option value="30"
                           <c:out value="${pageDto.cri.amount == 30?'selected':''}"/>>30</option>
                        <option value="40"
                           <c:out value="${pageDto.cri.amount == 40?'selected':''}"/>>40</option>
                     </select>
                  </div>
               </div>
            </div>
            <!-- end search -->
            <!-- start Pagination -->
            <div class="text-center">
               <ul class="pagination">
                  <c:if test="${pageDto.prev}">
                     <li class="paginate_button previous">
                     <a href="${pageDto.startPage-10}">Previous</a></li>
                  </c:if>
                  <c:forEach var="idx" begin="${pageDto.startPage}"
                     end="${pageDto.endPage}">
                     <li class="pageinate_button ${pageDto.cri.pageNum==idx?'active':''}">
                        <a href="${idx}">${idx}</a>
                     </li>
                  </c:forEach>
                  <c:if test="${pageDto.next}">
                     <li class="paginate_button next"><a
                        href="${pageDto.endPage+1}">Next</a></li>
                  </c:if>
               </ul>
            </div>
            <!-- end Pagination -->
         </div>
         <!-- end panel-body -->
      </div>
      <!-- end panel -->
   </div>
</div>
<!-- /.row -->
<%-- 페이지 나누기를 위한 폼 --%>
<form action="" method="get" id="actionForm">
   <input type="hidden" name="pageNum" value="${pageDto.cri.pageNum}" />
   <input type="hidden" name="amount" value="${pageDto.cri.amount}" />
   <input type="hidden" name="type" value="${pageDto.cri.type}" />
   <input type="hidden" name="keyword" value="${pageDto.cri.keyword}" />
   <input type="hidden" name="bno" value="" />
</form>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>	
		</div>
	</div>	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	
		<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	  <script src="/resources/js/scripts.js"></script>
	<script src="/resources/js/list.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script>
		let result = '${result}'
	</script>
</body>
</html>