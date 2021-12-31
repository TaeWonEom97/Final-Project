<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header2.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Modify Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="" method="post" role="form">
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name="bno"
							readonly="readonly" value="${dto.bno}">
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title"
							value="${dto.title}">
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" rows="3" name="content">${dto.content}</textarea>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer"
							readonly="readonly" value="${dto.writer}">
					</div>
					<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
					<button type="submit" data-oper='list' class="btn btn-info">List</button>
				</form>
			</div>
		</div>
	</div>
</div>
<!--첨부파일 영역 -->
<!-- <div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fa-files-o"></i>파일 첨부</div>
			<div class="panel-body">
			<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" id="" multuple />
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div> -->	

<%-- remove와 list를 위한 폼--%>
<form action="" id="actionForm">
	<input type="hidden" name="pageNum" value="${cri.pageNum}" /> 
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
   <input type="hidden" name="keyword" value="${cri.keyword}" /> 
	<input type="hidden" name="bno" value="${dto.bno}" />
</form>
<%-- 스크립트 --%>
<script>
	   // 현재 글번호 가져오기
	   let bno = ${dto.bno}; // 다음 페이지(read.js)에서 데이터를 부를 때 이 데이터 값을 가져올 수가 없기때문에 jsp에서 담고 보내는 형식
   
		//ajax 동작 시 헤더 값에 포함해서 보낼 csrf 토큰 값 설정
		let csrfHeaderName = "${_csrf.headerName}";
		let csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/modify.js"></script>
<%@include file="../includes/footer2.jsp"%>











