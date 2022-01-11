<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="includes/header3.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h4 class="mt-4">입고 관리</h1>
                        
                        <div class="card mb-4">
                            <div class="card-body">
                               입고관리탭입니다. 신규 입고 등록, 삭제와 입고 내역 조회가 가능합니다. 
                            </div>
                        </div>
                      
                      <button type="button" class="btn btn-secondary btn-sm" id="new">신규</button>
                      <button type="button" class="btn btn-secondary btn-sm" id="select">조회</button>
                        
                        <div class="container">
                    <div class="row">
                      <div class="col">
                      <label>입고일자</label>
                         <input type="text" id="putindate" placeholder="날짜를 입력해주세요">
                      <script>
                          $(function () {
                             $.datepicker.setDefaults($.datepicker.regional['ko']);
                              $("#putindate").datepicker({dateFormat:'yy-mm-dd'});
                          });
                      </script>

                    </div>
                
				 <div class="panel panel-default">
					  <div class="panel-heading"><b> <i class="fas fa-table me-1"></i> 입고 관리 </b> 
                               
                  	  </div>

						
					  <div class="panel-body contents">
						
						<div class="tbl_user_data"></div>
					
					  </div>
					
					</div>

                </main>
   <%-- 신규 입고내역 작성 폼 --%>
   <div class="modal" tabindex="-1" id="newModal">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
           <h5 class="modal-title">신규 
           입고 내역 등록</h5>
         </div>
         <div class="modal-body">
           <div class="form-group">
              <label for="">제품 코드</label>
              <input type="text" name="code" class="form-control" value=""/>
           </div>
           <div class="form-group">
              <label for="">입고 수량</label>
              <input type="text" name="num" class="form-control" value=""/>
           </div>        
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" id="modalRegisterBtn">등록</button>
           <button type="button" class="btn btn-secondary" data-dismiss="modal" id="modalCloseBtn">종료</button>
         </div>
       </div>
     </div>
   </div>

<script>
   let csrfHeaderName = "${_csrf.headerName}";
   let csrfTokenValue = "${_csrf.token}";
</script>         
    <script src="/resources/js/putin.js"></script>
    <script src="/resources/js/newmodal.js"></script>

    <script src="/resources/js/module.js"></script> 		
<%@include file="includes/footer.jsp" %>
