/**
 * insertSell 모달 창 띄우기
 */

$(function(){
	
	let modal = $('#sellModal');
	
	// 모달 창 영역 안의 요소 가져오기
	let modalsellcode = modal.find("input[name='sellcode']");
	let modalsellnum = modal.find("input[name='sellnum']");

	let modalRegisterBtn = modal.find("#modalRegisterBtn");
	
	$("#insertSell").click(function(){
		
		modal.modal('show');
	})
	
	modalRegisterBtn.click(function(){
		
		var sellinsert = {
			sellcode:modalsellcode.val(),
			sellnum:modalsellnum.val()
		};
		
		replyService.add(sellinsert,
			function(result){
				if(result) {
					if(result == 'success') {
						alert("판매 등록 성공");
					}
					modal.find("input").val("");
					modal.modal("hide");
					showList(-1);
				}
		}); // add end
	})
})