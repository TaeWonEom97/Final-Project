/**
 *  putin 모달 창 띄우기
 */

$(function(){
	
	let modal = $('#newModal');
	
	// 모달 창 영역 안의 요소 가져오기
	let modalCode = modal.find("input[name='code']");
	let modalSeq = modal.find("input[name='seq']");
	let modalDate = modal.find("input[name='date']");
	let modalNum = modal.find("input[name='num']");
	
	let modalRegisterBtn = modal.find("#modalRegisterBtn");
	let modalRemoveBtn = modal.find("#modalRemoveBtn");
	let modalCloseBtn = modal.find("#modalCloseBtn");
	
	$("#new").click(function(){
		
		modal.modal('show');
	})
	
	modalRegisterBtn.click(function(){
		
		var newinsert = {
			code:modalCode.val(),
			seqid:modalSeq.val(),
			insertdate:modalDate.val(),
			insertnum:modalNum.val()
			
		};
		
		replyService.add(newinsert,
			function(result){
				if(result) {
					if(result == 'success') {
						alert("입고 등록 성공");
					}
					modal.find("input").val("");
					modal.modal("hide");
					showList(-1);
				}
		}); // add end
	}) // modalRegister end
	
	$("#modalRemoveBtn").on("click", function(){
		$('.form-control')[0].reset();
		}) // modalRemoveBtn end
		
	$("#modalCloseBtn").on("click", function(){
		modal.modal('hide');
		$('.form-control')[0].reset();
		}) // modalCloseBtn end
		
	$(".close").on("click", function(){
		modal.modal('hide');
		$('.form-control')[0].reset();
	}) // close end
})