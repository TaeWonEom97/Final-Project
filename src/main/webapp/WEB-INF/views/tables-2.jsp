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
                                            <th>거래처</th>
                                            <th>상품코드</th>
                                            <th>상품명</th>
                                            <th>수량</th>
                                            <th>가격</th>
                                            <th>합계</th>
                                            <th>제조사</th>
                                            <th>판매일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									<c:forEach var="dto" items="${list}">
										<tr>
											<td>${dto.customerDto.company}</td>
											<td>${dto.sellcode}</td>
											<td>${dto.itemDto.itemtitle}</td>
											<td>${dto.sellnum}</td>
											<td>${dto.itemDto.itemprice}</td>
											<td>${(dto.itemDto.itemprice) * (dto.sellnum)}</td>
											<td>${dto.itemDto.supplier}</td>
											<td>${dto.selldate}</td>
										</tr>
									</c:forEach>
								</tbody>
                                </table>
                            </div>
                        </div>
		                  <div>
		                     <button type="button" class="btn btn-success" id="insertSell">추가</button>
		                  </div>
                    </div>
                </main>
                
<%-- sell 추가 모달 --%>
<div class="modal" tabindex="-1" id="sellModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title">판매 추가</h5>
      </div>
      <div class="modal-body">
        <div class="form-group">
        	<label for="">상품 코드</label>
			<input type="text" name="sellcode" class="form-control" placeholder="상품 코드"/>
        </div>
        <div class="form-group">
        	<label for="">수량</label>
        	<input type="text" name="sellnum" class="form-control" placeholder="수량"/>
        </div>      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="modalRegisterBtn">추가</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="modalCloseBtn">종료</button>
      </div>
    </div>
  </div>
</div>
<script src="/resources/js/sell.js"></script>
<%@include file="includes/footer.jsp" %>