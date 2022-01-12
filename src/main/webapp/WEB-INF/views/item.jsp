<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h4 class="mt-4">제품관리</h1>
                        
                        <div class="card mb-4">
                            <div class="card-body">
                               제품관리 탭입니다.
                            </div>
                        </div>
                      
                     
                  <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                제품 관리
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품코드</th>
                                            <th>상품명</th>
                                            <th>상품 가격</th>
                                            <th>공급자</th>
                                            <th>사이즈</th>
                                            <th>색상</th>
                                            <th>제품 등록 일자</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                           <c:forEach var="dto" items="${list}">
                              <tr class="get" style = "cursor:pointer;">
                                 <td>${dto.itemcode}</td>
                                 <td>${dto.itemtitle}</td>
                                 <td>${dto.itemprice}</td>
                                 <td>${dto.supplier}</td>
                                 <td>${dto.itemsize}</td>
                                 <td>${dto.color}</td>
                                 <td>${dto.itemdate}</td>
                              </tr>
                           </c:forEach>
                        </tbody>
                                </table>
                            </div>
                        </div>
                        <div>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                         	<button type="button" class="btn btn-secondary btn-sm" id="new">추가</button>
                         </sec:authorize>
                        </div>
                    </div>
                </main>

<%-- 추가 모달 --%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<div class="modal" tabindex="-1" id="itemModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">상품 추가</h5>
      </div>
      <div class="modal-body">
        <div class="form-group">
           <label for="">상품코드</label>
         <input type="text" name="itemcode" class="form-control" placeholder="상품코드"/>
        </div>
        <div class="form-group">
           <label for="">상품명</label>
         <input type="text" name="itemtitle" class="form-control" placeholder="상품명"/>
        </div>
        <div class="form-group">
           <label for="">상품 가격</label>
           <input type="text" name="itemprice" class="form-control" placeholder="상품 가격"/>
        </div>      
        <div class="form-group">
           <label for="">공급자</label>
           <input type="text" name="supplier" class="form-control" placeholder="공급자"/>
        </div>      
        <div class="form-group">
           <label for="">사이즈</label>
           <input type="text" name="itemsize" class="form-control" placeholder="사이즈"/>
        </div>      
        <div class="form-group">
           <label for="">색상</label>
           <input type="text" name="color" class="form-control" placeholder="색상"/>
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
</sec:authorize>
<script>
   let csrfHeaderName = "${_csrf.headerName}";
   let csrfTokenValue = "${_csrf.token}";
</script>   
<script src="/resources/js/item.js"></script>
<script src="/resources/js/itemModal.js"></script>            
<%@include file="includes/footer.jsp" %>