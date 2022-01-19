<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">사용자 관리</h1>
			<div class="card mb-4">
				<div class="card-body">사용자 관리 페이지입니다.</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 사용자 목록
				</div>
				<div class="card-body tbl_user_data">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>사용자명</th>
								<th>직급</th>
								<th>아이디(메일)</th>
								<th>권한</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.company}</td>
									<td>팀장</td>
									<td>${dto.userid}</td>
									<c:choose>
										<c:when test="${empty dto.authList}"><td></td></c:when>
										<c:otherwise><td><c:forEach var="authority" items="${dto.authList}"> ${authority.auth} </c:forEach></td></c:otherwise>
									</c:choose>
									<td><c:url var="changeRoleUrl" value="/admin/${dto.userid}" />
										<a href="${ changeRoleUrl }/admin" class="btn <c:if test="${dto.hasRole('ADMIN')}">btn-primary</c:if>">관리자</a>
				                        <a href="${ changeRoleUrl }/user" class="btn <c:if test="${dto.hasRole('USER')}">btn-primary</c:if>">사용자</a>
				                    </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
<script>
   let csrfHeaderName = "${_csrf.headerName}";
   let csrfTokenValue = "${_csrf.token}";
</script>
<%@include file="includes/footer.jsp"%>