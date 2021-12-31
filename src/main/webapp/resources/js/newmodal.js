/**
 *  putin 모달 창 띄우기
 */

$(function(){
   
   let modal = $('#newModal');
   
   // 모달 창 영역 안의 요소 가져오기
   let modalCode = modal.find("input[name='code']");
   let modalNum = modal.find("input[name='num']");
   
   let modalRegisterBtn = modal.find("#modalRegisterBtn");
   let modalModifyBtn = modal.find("#modalModifyBtn");
   let modalRemoveBtn = modal.find("#modalRemoveBtn");
   let modalCloseBtn = modal.find("#modalCloseBtn");
   
   $(document).ajaxSend(function(e,xhr,options){
      xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
   });

   $("#new").click(function(){
      
      modal.modal('show');
   }) // new 추가버튼 클릭 end
   
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

   modalRegisterBtn.click(function(){
      
      var newinsert = {
         code:modalCode.val(),
         insertnum:modalNum.val()
         
      };
   
      putinService.add(newinsert,
         function(result){
            if(result) {
               if(result == 'success') {
                  alert("입고 등록 성공");
               }
               modal.find("input").val("");
               modal.modal("hide");
               // showList(-1);
               }
      		},function(msg){
            alert(msg);

     }); // add end
  }) // modalRegister end

	
	$(".get").on("click", function(){
		
		let code = $(this).attr('href');
		
		putinService.get(code, function(data){
			
			// 타이틀 변경
			modaltitle.text("입고 관리");
			
			// 요소 보여주기
			modalCode.closest("div").show();
			modalNum.closest("div").show();

			modalModifyBtn.show();
			modalRemoveBtn.show();
			
			// 내용 보여주기
			modalCode.val(data.code);
			modalNum.val(data.insertnum).attr("readonly", true);
			modalsellnum.val(data.insertdate);
			modalitemprice.val(data.itemDto.itemtitle).attr("readonly", true);
			modalsupplier.val(data.itemDto.itemprice).attr("readonly", true);
			modalsupplier.val(data.itemDto.supplier).attr("readonly", true);
			modalsupplier.val(data.itemDto.itemsize).attr("readonly", true);
			modalsupplier.val(data.itemDto.color).attr("readonly", true);
			
			// 버튼 숨기기
			modal.find("button[id = 'modalRegisterBtn']").hide();
			
			
			modal.modal('show');
		}); // 하나 가져오기 end
	}) // 리스트 클릭 end

		modalModifyBtn.click(function(){

			var update = {
				code:modalCode.val(),
				insertnum:modalNum.val()
			};
					
			putinService.update(update,
				function(data){
					if(data == "success") {
						alert("수정성공");
					}
					location.reload();
					modal.modal("hide");
				},
				function(msg){
					alert(msg);
				}
			); // update end
})
})