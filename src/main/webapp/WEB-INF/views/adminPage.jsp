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
                           <td>${dto.password}</td>
                           <td>${dto.userid}</td>
                           <td>${dto.authList.auth}</td>
                           <td><button type="button" class="btn btn-success"
                                 id="btn_edit">권한부여</button></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </main>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>
   <script src="/resources/js/scripts.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"></script>
   <script src="/resources/js/datatables-simple-demo.js"></script>
   <%@include file="includes/footer.jsp"%>