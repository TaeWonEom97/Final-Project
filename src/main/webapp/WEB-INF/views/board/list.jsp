<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../includes/header.jsp" %>
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">사내 게시판</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active">Tables</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">사내 게시판입니다.</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> LIST
						</div>
						<div class="card-body">
							<div class="dataTable-top">
								<div class="dataTable-dropdown">
									<label><select class="dataTable-selector">
											<option value="5">5</option>
											<option value="10" selected="">10</option>
											<option value="15">15</option>
											<option value="20">20</option>
											<option value="25">25</option>
									</select> entries per page</label>
								</div>
								<button id='regBtn' type='button' class='btn btn-xs pull-right'
									onclick="location.href='/board/register'">새 게시글 작성</button>
									
								<div class="dataTable-search">
									<input class="dataTable-input" placeholder="Search..."
										type="text" />
								</div>
							</div>							
							<table id="datatablesSimple" class="dataTable-table">
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성날짜</th>
										<th>수정날짜</th>
									</tr>
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
					<div class="row">
		               <!-- start search -->
			                <!-- start Pagination -->
	            <div class="text-center">
	               <ul class="pagination">
	                  <c:if test="${pageDto.prev}">
	                     <li class="paginate_button previous">
	                     <a href="${pageDto.startPage-10}">Previous</a></li>
	                  </c:if>
	                  <c:forEach var="idx" begin="${pageDto.startPage}"
	                     end="${pageDto.endPage}">
	                     <li class="pageinate_button ${pageDto.cri.pageNum==idx?'active':''}">
	                        <a href="${idx}">${idx}</a>
	                     </li>
	                  </c:forEach>
	                  <c:if test="${pageDto.next}">
	                     <li class="paginate_button next"><a
	                        href="${pageDto.endPage+1}">Next</a></li>
	                  </c:if>
	               </ul>
	            </div>
	            <!-- end Pagination -->
		                  <div class="col-md-8">
		                     <!--search Form-->
		                     <form action="" method="get" id="searchForm">
		                        <input type="hidden" name="pageNum"
		                           value="${pageDto.cri.pageNum}" /> <input type="hidden"
		                           name="amount" value="${pageDto.cri.amount}" /> <select
		                           name="type" id="">
		                           <option value="">------------</option>
		                           <option value="T" <c:out value="${pageDto.cri.type == 'T'?'selected':''}"/>>제목</option>
		                           <option value="C" <c:out value="${pageDto.cri.type == 'C'?'selected':''}"/>>내용</option>
		                           <option value="W" <c:out value="${pageDto.cri.type == 'W'?'selected':''}"/>>작성자</option>
		                           <option value="TC" <c:out value="${pageDto.cri.type == 'TC'?'selected':''}"/>>제목 or 내용</option>
		                           <option value="TW" <c:out value="${pageDto.cri.type == 'TW'?'selected':''}"/>>제목 or 작성자</option>
		                           <option value="TCW" <c:out value="${pageDto.cri.type == 'TCW'?'selected':''}"/>>제목 or 내용 or 작성자</option>
		                        </select> 
		                        <input type="text" name="keyword" id="" value='<c:out value="${pageDto.cri.keyword}"/>' />
		                        <button class="btn btn-default">Search</button>
		                     </form>
		                  </div>		                
			             <div class="col-md-2 col-md-offset-3">
		                     <!--페이지 목록 갯수 지정하는 폼-->
		                     <select name="" id="amount" class="form-control">
		                        <option value="10"
		                           <c:out value="${pageDto.cri.amount == 10?'selected':''}"/>>10</option>
		                        <option value="20"
		                           <c:out value="${pageDto.cri.amount == 20?'selected':''}"/>>20</option>
		                        <option value="30"
		                           <c:out value="${pageDto.cri.amount == 30?'selected':''}"/>>30</option>
		                        <option value="40"
		                           <c:out value="${pageDto.cri.amount == 40?'selected':''}"/>>40</option>
		                        <option value="100"
		                           <c:out value="${pageDto.cri.amount == 1000?'selected':''}"/>>100</option>
		                     </select>
	                  	</div><!-- col-md-2 -->                  	
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
<%@include file="../includes/footer.jsp" %>			