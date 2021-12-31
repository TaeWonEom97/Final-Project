/**
 *  putin 모달 창 띄우기
 */

$(function(){
   
   //beforeSend : ajax 구문 안에 추가해서 header 값으로 보내야 하는 값들을 전송(ajax 코드 안에 해당 코드가 존재해야 함)
   //ajaxSend() : ajax 호출되면 무조건 이 값을 헤더로 전송
   $(document).ajaxSend(function(e,xhr,options){
      xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
   });

   let modal = $('#newModal');
   
   // 모달 창 영역 안의 요소 가져오기
   let modalCode = modal.find("input[name='code']");
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
      },function(msg){
            alert(msg);
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