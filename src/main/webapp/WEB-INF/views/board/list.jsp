<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../includes/header2.jsp" %>
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">사내 게시판</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="main.jsp">재고관리프로그램</a></li>
						<li class="breadcrumb-item active">사내게시판</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">사내 게시판입니다. 문의하실 사항을 남겨주세요.</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 게시물 목록
						</div>
						<div class="card-body">
							<div class="dataTable-top">
								<div class="dataTable-dropdown">

									<label><select name="" id="amount" class="dataTable-selector form-control">
										<option value="5" <c:out value="${pageDto.cri.amount == 5 ? 'selected':''}"/>>5</option>
                            	   		<option value="10" <c:out value="${pageDto.cri.amount == 10 ? 'selected':''}"/>>10</option>
                            	   		<option value="15" <c:out value="${pageDto.cri.amount == 15 ? 'selected':''}"/>>15</option>
                            	   		<option value="20" <c:out value="${pageDto.cri.amount == 20 ? 'selected':''}"/>>20</option>
                            	   		<option value="25" <c:out value="${pageDto.cri.amount == 25 ? 'selected':''}"/>>25</option>
									</select> </label>
								</div>
								<button id='regBtn' type='button' class='btn btn-info'
									onclick="location.href='/board/register'">새 게시글 작성</button>
								<div class="dataTable-search">
								</div>
								   <div class="row">
		                     <!--search Form-->
		                     <form action="" class="form-inline" method="get" id="searchForm">
		                     <div class="form-group mb-2">
		                        <input type="hidden" name="pageNum"
		                           value="${pageDto.cri.pageNum}" /> <input type="hidden"
		                           name="amount" value="${pageDto.cri.amount}" /> <select
		                           name="type" input class = "custom-select" id="">
		                           <option value="">------------</option>
		                           <option value="T" <c:out value="${pageDto.cri.type == 'T'?'selected':''}"/>>제목</option>
		                           <option value="C" <c:out value="${pageDto.cri.type == 'C'?'selected':''}"/>>내용</option>
		                           <option value="W" <c:out value="${pageDto.cri.type == 'W'?'selected':''}"/>>작성자</option>
		                           <option value="TC" <c:out value="${pageDto.cri.type == 'TC'?'selected':''}"/>>제목 or 내용</option>
		                           <option value="TW" <c:out value="${pageDto.cri.type == 'TW'?'selected':''}"/>>제목 or 작성자</option>
		                           <option value="TCW" <c:out value="${pageDto.cri.type == 'TCW'?'selected':''}"/>>제목 or 내용 or 작성자</option>
		                        </select>
		                        </div>
		                        <div class="form-group mb-2">
		                        <input class="form-control" type="text" name="keyword" id="searchForm" placeholder="Search..." value='<c:out value="${pageDto.cri.keyword}"/>' />
		                        </div>
		                        <div class="form-group mb-2">
		                        <button class="btn btn-success">검색</button>
		                        </div>
		                     </form>
		                  </div>
							</div>		
							<div class = "card-body">			
							<table id="datatablesSimple" class="dataTable-table">
								<thead>
									<tr>
										<th data-sortable style = "width:7.32189%;">
										<a href = "#" class = "dataTable-sorter">
										글번호
										</a>
										</th>
										<th data-sortable style = "width:30.32189%;">
										<a href = "#" class = "dataTable-sorter">
										제목
										</a>
										</th>
										<th data-sortable style = "width:25.32189%;">
										<a href = "#" class = "dataTable-sorter">								
										작성자
										</a>
										</th>
										<th data-sortable style = "width:20.32189%;">
										<a href = "#" class = "dataTable-sorter">
										작성날짜
										</a>
										</th>
										<th data-sortable style = "width:26.32189%;">
										<a href = "#" class = "dataTable-sorter">										
										수정날짜
										</a>
										</th>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${list}">
										<tr>
											<td>${dto.bno}</td>
											<td><a href="${dto.bno}"  class="move">${dto.title}</a>
											<td>${dto.writer}</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
													value="${dto.regdate}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
													value="${dto.updatedate}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>	
						</div>
					</div>	
					<div class="row">
		               <!-- start search -->
			                <!-- start Pagination -->
	            <div class="text-center">
	               <ul class="dataTable-pagination">
	                  <c:if test="${pageDto.prev}">
	                     <li class="pageinate_button previous">
	                     <a href="${pageDto.startPage-10}">Previous</a></li>
	                  </c:if>
	                  <c:forEach var="idx" begin="${pageDto.startPage}"
	                     end="${pageDto.endPage}">
	                     <li class="pageinate_button ${pageDto.cri.pageNum==idx?'active':''}">
	                        <a href="${idx}">${idx}</a>
	                     </li>
	                  </c:forEach>
	                  <c:if test="${pageDto.next}">
	                     <li class="pageinate_button next"><a
	                        href="${pageDto.endPage+1}">Next</a></li>
	                  </c:if>
	               </ul>
	            </div>
	            <!-- end Pagination -->
	            
                  </div><!-- row close -->
				</div>		
			</main>
	<%-- 페이지 나누기를 위한 폼 --%>
			<form action="" method="get" id="actionForm">
			   <input type="hidden" name="pageNum" value="${pageDto.cri.pageNum}" />
			   <input type="hidden" name="amount" value="${pageDto.cri.amount}" />
			   <input type="hidden" name="type" value="${pageDto.cri.type}" />
			   <input type="hidden" name="keyword" value="${pageDto.cri.keyword}" />
			   <input type="hidden" name="bno" value="" />
			</form>
			<script src="/resources/js/list.js"></script>
			<%@include file="../includes/footer2.jsp" %>			