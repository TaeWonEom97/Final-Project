<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css"> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@include file="includes/header.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">재고현황 및 조회</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">재고관리 시스템</a></li>
                            <li class="breadcrumb-item active">재고현황</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                재고현황 페이지입니다. 현재 재고수량을 열람하실 수 있으며, 수정,삭제 및 조회가 가능합니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                현재 재고 수량
                            </div>
                            <div class="card-body tbl_user_data">
                                 <table id="datatablesSimple">
                                  <thead>
                                        <tr>
                                            <th>제조사</th>
                                            <th>상품명</th>
                                            <th>상품코드</th>
                                            <th>사이즈</th>
                                            <th>색상</th>
                                            <th>가격</th>
                                            <th>현재재고수량 </th>                                      
                                        </tr>
                                    </thead>    
                                     <tbody>
                                    <c:forEach var="dto" items="${list}">
                                        <tr>
                                           <td>${dto.supplier}</td>
                                           <td>${dto.itemtitle}</td> 
                                            <td>${dto.itemcode}</td>
                                             <td>${dto.itemsize}</td>
                                             <td>${dto.color }</td>                                            
                                  <td><fmt:formatNumber type="number" value="${dto.itemprice}" /></td>                                          
                                            <td>${dto.stock}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>                           
                                  </table>    
                            </div>
                        </div>
                        
                    </div>
                </main>
                 <!-- Modal -->
            <div class="modal fade" id="lookup_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">날짜 조회</h4>
                  </div>
                  <div class="modal-body">
                   <p>기간: <input type="text" id="datepicker"></p>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-success" id = "lookupbtn2">찾기</button>                  
                    <button type="button" class="btn btn-primary" id = "closebtn" data-dismiss="modal">닫기</button>
                  </div>
                </div>
              </div>
            </div>
                
                
                            <%-- sell 추가 모달 --%>
            <div class="modal" tabindex="-1" id="sellModal">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">판매 수정</h5>
                  </div>
                  <div class="modal-body">                    
                    <div class="form-group">
                       <label for="">상품 코드</label>
                       <input type="text" name="sellcode" class="form-control" placeholder="상품 코드"/>
                    </div>                               
                    <div class="form-group">
                       <label for="">재고수량</label>
                       <input type="text" name="sellnum" class="form-control" placeholder="수량"/>
                    </div>                             
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="modalModifyBtn">수정</button>                   
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="modalCloseBtn">닫기</button>
                  </div>
                </div>
              </div>
            </div>
<script src="/resources/js/sell.js"></script>
<script src="/resources/js/modal.js"></script>
<script src="/resources/js/edit.js"></script>  
<%@include file="includes/footer.jsp" %>