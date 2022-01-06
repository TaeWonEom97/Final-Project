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
            alert("제품 코드를 확인하세요");

     }); // add end
  }) // modalRegister end

		
})