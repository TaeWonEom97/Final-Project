<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header2.jsp"%>
<main>
<div class="container-fluid px-4">
<div class="row">
                <div class="col-lg-12">
                   <div class="panel panel-default">
                        <div class="panel-heading">
                           Board Register Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                         <form action="" method="post" role="form">
                            <div class="form-group">
                               <label>Title</label>
                               <input class="form-control" name="title">                            
                            </div>  
                            <div class="form-group">
                               <label>Content</label>
                               <textarea class="form-control" rows="3" name="content"></textarea>                           
                            </div> 
                            <div class="form-group">
                               <label>Writer</label>
                               <input class="form-control" name="writer" value='<sec:authentication property="principal.username"/>' readonly>                            
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-default">Submit</button>                       
                            <button type="reset" class="btn btn-default">reset</button>                       
                         </form>
                      </div>
                   </div>
                </div>
            </div>
<script>
   //ajax 동작 시 헤더 값에 포함해서 보낼 csrf 토큰 값 설정
   let csrfHeaderName = "${_csrf.headerName}";
   let csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/upload.js"></script>
<%@include file="../includes/footer2.jsp"%>
</div>
</main>
