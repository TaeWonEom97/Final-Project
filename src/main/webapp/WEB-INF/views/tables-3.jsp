<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">재고 수정 및 조회</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">재고관리 시스템</a></li>
                            <li class="breadcrumb-item active">재고수정 및 조회</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                               재고 수량을 조회, 수정하시거나 삭제하실 수 있습니다. 
                               
                            </div>
                            </div>
				 					
				 					<button id="testBtn" class="btn">모달 테스트</button>
						  <!-- 회원가입 확인 Modal-->
							<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button class="close" type="button" data-dismiss="modal" aria-label="Close">
												<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											</button>
											<h3 class="modal-title" id="exampleModalLabel">모달테스트</h5>
										</div>
										<div class="modal-body">내용 입력 !!</div>
										<div class="modal-footer">
											<a class="btn" id="modalY" href="#">예</a>
											<button class="btn" type="button" data-dismiss="modal">아니요</button>
										</div>
									</div>
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
                                        <tr><!-- 더미데이터 넣기 -->
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
                        <div>
                           <button type="button" class="btn btn-success" id="insertSell">수정</button>
                           <button type="button" class="btn btn-info" id = "lookup" >조회</button>
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
				        <div class="form-group">
				           <label for="">거래처 ID</label>
				         <input type="text" name="selluser" class="form-control" placeholder="거래처 ID"/>
				        </div>
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
				        <button type="button" class="btn btn-warning" id="modalModifyBtn">수정</button>
				        <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
				        <button type="button" class="btn btn-primary" data-dismiss="modal" id="modalCloseBtn">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
<%@include file="includes/footer.jsp" %>
