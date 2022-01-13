<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
 <%@include file="../includes/header2.jsp" %>
 
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">사내 게시판</h1>
		<div class="panel panel-default">
         <div class="panel-heading"></div>
         <!-- /.panel-heading -->
         <div class="panel-body">
            <form action="" role="form">
               <div class="form-group">
                  <label>게시판 번호</label> <input class="form-control" name="bno"
                     readonly="readonly" value="${dto.bno}">
               </div>
               <div class="form-group">
                  <label>제목</label> <input class="form-control" name="title"
                     readonly="readonly" value="${dto.title}">
               </div>
               <div class="form-group">
                  <label>문의 내용</label>
                  <textarea class="form-control" rows="3" name="content"
                     readonly="readonly">${dto.content}</textarea>
               </div>
               <div class="form-group">
                  <label>작성자</label> <input class="form-control" name="writer"
                     readonly="readonly" value="${dto.writer}">
               </div>
               <button type="button" class="btn btn-default">수정</button>
               <button type="reset" class="btn btn-info">목록</button>
            </form>
         </div>
      </div>
   	
  <%-- 댓글 리스트 --%>            
<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">
            <i class="fa fa-comments fa-fw"></i>
            답변
            <sec:authorize access="isAuthenticated()">  
               <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글 달기</button>
            </sec:authorize>
          </div>
         <div class="panel-body">
            <ul class="chat">
               <li class="left clearfix" data-rno='1'>
                  <div>
                     <div class="header">
                        <strong class="primary-font">user00</strong>
                        <small class="pull-right text-muted">2021-06-15 14:25</small>
                        <p>Good Job!!</p>
                     </div>
                  </div>
               </li>
            </ul>
         </div>
         <!-- 댓글 페이지 나누기 -->
         <div class="panel-footer">
         
         </div>
      </div><!-- panel-default close -->
   </div><!-- col-lg-12 close -->
</div><!-- row close -->  
      <!-- panel-default close -->
   </div>
   <!-- col-lg-12 close -->
   <%-- 댓글 작성 폼 --%>
<div class="modal" tabindex="-1" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title">Reply</h5>
      </div>
      <div class="modal-body">
        <div class="form-group">
           <label for="">댓글 내용</label>
           <input type="text" name="reply" class="form-control" value="댓글내용"/>
        </div>
        <div class="form-group">
           <label for="">작성자</label>
           <input type="text" name="replyer" class="form-control" value="작성자"/>
        </div>
        <div class="form-group">
           <label for="">작성일</label>
           <input type="text" name="replyDate" class="form-control" value="작성일"/>
        </div>        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="modalRegisterBtn">등록</button>
        <button type="button" class="btn btn-warning" id="modalModifyBtn">수정</button>
        <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="modalCloseBtn">종료</button>
      </div>
    </div>
  </div>
</div>
</main>
<%-- 페이지를 나누기 위한 폼 --%>
<form action="" id="actionForm">
   <input type="hidden" name="pageNum" value="${cri.pageNum}" /> <input
      type="hidden" name="amount" value="${cri.amount}" /> <input
      type="hidden" name="type" value="${cri.type}" /> <input type="hidden"
      name="keyword" value="${cri.keyword}" /> <input type="hidden"
      name="bno" value="${dto.bno}" />
</form>

<script>
   // 현재 글번호 가져오기
   let bno = ${dto.bno}; // 다음 페이지(read.js)에서 데이터를 부를 때 이 데이터 값을 가져올 수가 없기때문에 jsp에서 담고 보내는 형식
   
   //ajax 동작 시 헤더 값에 포함해서 보낼 csrf 토큰 값 설정
   let csrfHeaderName = "${_csrf.headerName}";
   let csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/reply.js"></script>
<script src="/resources/js/read.js"></script>
<%@include file="../includes/footer2.jsp" %>			