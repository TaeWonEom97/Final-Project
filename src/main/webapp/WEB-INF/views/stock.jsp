<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">재고현황 및 조회</h1>
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
                                            <th>카테고리</th>                                   
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
                                            <td>${dto.goods_cate}</td>
                                        </tr>
                                        </c:forEach>
                                        <div align="left">
                  <form action="/excel/download" method="get">
                     <button type="submit" class="btn btn-excel btn-sm">Excel</button>
                  </form>
                  </div>
                                    </tbody>                           
                                  </table>    
                            </div>
                        </div>                        
                    </div>
                </main>                              
      <%@include file="includes/footer.jsp" %>