<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">판매관리</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                무엇이 팔렸는지 보여주는 페이지
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                판매 내역
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품코드</th>
                                            <th>상품명</th>
                                            <th>사이즈</th>
                                            <th>색상</th>
                                            <th>수량</th>
                                            <th>가격</th>
                                            <th>합계</th>
                                            <th>제조사</th>
                                            <th>판매일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                           <c:forEach var="dto" items="${list}">
							  <sec:authorize access="hasRole('ROLE_ADMIN')">
							  	<tr class="get" style = "cursor:pointer;" href="${dto.sellid}">
							  </sec:authorize>
							  	 <input type="hidden" name="sellid" value="${dto.sellid}"/>
                                 <td>${dto.sellcode}</td>
                                 <td>${dto.itemDto.itemtitle}</td>
                                 <td>${dto.itemDto.itemsize}</td>
                                 <td>${dto.itemDto.color}</td>
                                 <td>${dto.sellnum}</td>
                                 <td><fmt:formatNumber type="number" value="${dto.itemDto.itemprice}" /></td>
                                 <td><fmt:formatNumber type="number" value="${(dto.itemDto.itemprice) * (dto.sellnum)}" /></td>
                                 <td>${dto.itemDto.supplier}</td>
                                 <td>${dto.selldate}</td>
                              </tr>
                           </c:forEach>
                          <div align="left">
		                  <form action="/sell/exceldown" method="get">
		                     <button type="submit" class="btn btn-success">Excel Download</button>
		                  </form>
		                  </div>
                        </tbody>
                                </table>
                            </div>
                        </div>
                        <div>
                           <sec:authorize access="hasRole('ROLE_ADMIN')">
                           		<button type="button" class="btn btn-success" id="insertSell">추가</button>
                           </sec:authorize>
                        </div>
                    </div>
                </main>
                
<%-- sell 추가 모달 --%>
<div class="modal" tabindex="-1" id="sellModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">판매 추가</h5>
      </div>
      <div class="modal-body">
         <input type="hidden" name="sellid" value="" readonly="readonly" />
        <div class="form-group">
           <label for="">상품 코드</label>
           <input type="text" name="sellcode" class="form-control" placeholder="상품 코드"/>
        </div>      
        <div class="form-group">
           <label for="">상품명</label>
           <input type="text" name="itemtitle" class="form-control" placeholder="상품명"/>
        </div>      
        <div class="form-group">
           <label for="">수량</label>
           <input type="text" name="sellnum" class="form-control" placeholder="수량"/>
        </div>      
        <div class="form-group">
           <label for="">가격</label>
           <input type="text" name="itemprice" class="form-control" placeholder="가격"/>
        </div>      
        <div class="form-group">
           <label for="">제조사</label>
           <input type="text" name="supplier" class="form-control" placeholder="제조사"/>
        </div>      
        <div class="form-group">
           <label for="">판매일</label>
           <input type="text" name="selldate" class="form-control" placeholder="판매일"/>
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
<script src="/resources/js/sell.js"></script>
<script src="/resources/js/modal.js"></script>
<%@include file="includes/footer.jsp" %>