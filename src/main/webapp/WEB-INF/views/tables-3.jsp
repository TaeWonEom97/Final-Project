<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">판매내역조회</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                판매내역 조회하는 페이지
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                판매내역조회
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>판매일</th>
                                            <th>상품코드</th>
                                            <th>상품명</th>
                                            <th>구매자</th>
                                            <th>수량</th>
                                            <th>가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>2011/12/22</td>
                                            <td>P005001</td>
                                            <td>가방</td>
                                            <td>bagCompany</td>
                                            <td>120</td>
                                            <td>36,000,000</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
<%@include file="includes/footer.jsp" %>