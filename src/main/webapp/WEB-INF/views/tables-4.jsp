<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">재고현황</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">재고관리 시스템</a></li>
                            <li class="breadcrumb-item active">재고현황</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                재고현황 페이지입니다. 현재 재고수량을 보실 수 있습니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                현재 재고 수량
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                  <thead>
                                        <tr>
                                            <th>매장명</th>
                                            <th>제조사</th>
                                            <th>상품명</th>
                                            <th>사이즈</th>
                                            <th>판매수량</th>
                                            <th>현재재고수량</th>
                                            <th>판매일</th>
                                            <th>총판매금액</th>
                                        </tr>
                                    </thead>    
                                     <tbody>
                                    <c:forEach var="dto" items="${list}">
                                        <tr>
                                           <td>${dto.stockcode}</td>
                                            <%-- <td>${dto.supplier}</td> --%>
                                            <td>${dto.stockid}</td>
                                            <%-- <td>${dto.itemsize}</td>
                                            <td>${dto.insertnum}</td> --%>
                                            <td>${dto.stocknum}</td>
                                            <%-- <td>${dto.selldate}</td>
                                            <td>${dto.itemprice}</td> --%>
                                        </tr>
                                        </c:forEach>
                                    </tbody>                           
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
<%@include file="includes/footer.jsp" %>
