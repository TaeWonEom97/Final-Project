<%@ page language="java" contentType="text/html; charset=UTF-8"

   pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>
<div id="layoutSidenav_content">
   <main>
      <div class="container-fluid px-4">
         <h1 class="mt-4">거래처 관리</h1>
         <div class="card mb-4">
            <div class="card-body">거래처 관리 페이지입니다.</div>
         </div>
         <div class="card mb-4">
            <div class="card-header">
               <i class="fas fa-table me-1"></i> 거래처 목록
            </div>
            <div class="card-body tbl_user_data">
               <table id="datatablesSimple">
                  <thead>
                     <button type="button" class="btn btn-secondary btn-sm" id="newcl">신규</button>
                     <tr>
                        <th>거래처코드</th>
                        <th>거래처명</th>
                        <th>사업자등록번호</th>
                        <th>대표자</th>
                        <th>전화번호</th>
                        <th>담당자</th>
                        <th>비고</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="dto" items="${list}">
                     <tr class="get" style = "cursor:pointer;" href="${dto.clcode}">
                           <td>${dto.clcode}</td>
                           <td>${dto.clname}</td>
                           <td>${dto.clregnum}</td>
                           <td>${dto.clrepre}</td>
                           <td>${dto.clcellnum}</td>
                           <td>${dto.clemp}</td>
                           <td></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </main>
   <%-- client 추가 모달 --%>
<div class="modal" tabindex="-1" id="clientModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">판매 추가</h5>
      </div>
      <div class="modal-body">
        <div class="form-group">
           <label for="">거래처코드</label>
           <input type="text" name="clcode" class="form-control" placeholder="상품 코드"/>
        </div>      
        <div class="form-group">
           <label for="">거래처</label>
           <input type="text" name="clname" class="form-control" placeholder="상품명"/>
        </div>      
        <div class="form-group">
           <label for="">사업자등록번호</label>
           <input type="text" name="clregnum" class="form-control" placeholder="수량"/>
        </div>      
        <div class="form-group">
           <label for="">대표자</label>
           <input type="text" name="clrepre" class="form-control" placeholder="가격"/>
        </div>      
        <div class="form-group">
           <label for="">전화번호</label>
           <input type="text" name="clcellnum" class="form-control" placeholder="제조사"/>
        </div>      
        <div class="form-group">
           <label for="">담당자</label>
           <input type="text" name="clemp" class="form-control" placeholder="판매일"/>
        </div>      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="modalRegisterBtn">추가</button>
        <button type="button" class="btn btn-warning" id="modalModifyBtn">수정</button>
        <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="modalCloseBtn">취소</button>
      </div>
    </div>
  </div>
</div>
<script>
   let csrfHeaderName = "${_csrf.headerName}";
   let csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/client.js"></script>
<script src="/resources/js/client2.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>
   <script src="/resources/js/scripts.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"></script>
   <script src="/resources/js/datatables-simple-demo.js"></script>
   <%@include file="includes/footer.jsp"%>