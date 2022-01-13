/**
 * insertSell 모달 창 띄우기
 */

$(function(){
   
   let modal = $('#sellModal');
   
   // 모달 창 영역 안의 요소 가져오기
   let modalsellid = modal.find("input[name='sellid']");
   let modalsellcode = modal.find("input[name='sellcode']");
   let modalitemtitle = modal.find("input[name='itemtitle']");
   let modalsellnum = modal.find("input[name='sellnum']");
   let modalitemprice = modal.find("input[name='itemprice']");
   let modalsupplier = modal.find("input[name='supplier']");
   let modalselldate = modal.find("input[name='selldate']");
   
   let modaltitle = modal.find(".modal-title");

   let modalRegisterBtn = modal.find("#modalRegisterBtn");
   let modalModifyBtn = modal.find("#modalModifyBtn");
   let modalRemoveBtn = modal.find("#modalRemoveBtn");
   let modalCloseBtn = modal.find("#modalCloseBtn");
   
   $(document).ajaxSend(function(e, xhr, options){
      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
   });
   
   $("#insertSell").click(function(){
      
      // 타이틀 변경
      modaltitle.text("판매 추가");
      
      // readonly 속성 제거
      modalsellcode.attr("readonly", false);
      modalitemtitle.attr("readonly", false);
      modalitemprice.attr("readonly", false);
      modalsupplier.attr("readonly", false);
      modalselldate.attr("readonly", false);
      
      // input 안에 들어있는 value 제거
      modal.find("input").val("");
      
      // 필요없는 요소 숨기기
      modalitemtitle.closest("div").hide();
      modalitemprice.closest("div").hide();
      modalsupplier.closest("div").hide();
      modalselldate.closest("div").hide();
      
      // 수정, 삭제 버튼 숨기기
      modal.find("button[id = 'modalModifyBtn']").hide();
      modal.find("button[id = 'modalRemoveBtn']").hide();
      
      // 등록 버튼 보여주기
      modalRegisterBtn.show();
      
      modal.modal('show');
   }) // 추가버튼 클릭 end
   
   modalCloseBtn.click(function(){
      modal.modal("hide");
   }) // 종료버튼 end
   
   modalRegisterBtn.click(function(){

      var sellinsert = {
         selluser:modalselluser.val(),
         sellcode:modalsellcode.val(),
         sellnum:modalsellnum.val()
      };
      
      sellService.add(sellinsert,
         function(result){
            if(result) {
               if(result == 'success') {
                  alert("판매 등록 성공");
               }
               modal.find("input").val("");
               location.reload();
               modal.modal("hide");
               }
            }, function(msg) {
               alert(msg);
            
      }); // add end
   }) // 등록버튼 end
   
   $(".get").on("click", function(){
      
      let sellid = $(this).attr('href');
      
      sellService.get(sellid, function(data){
         
         // 타이틀 변경
         modaltitle.text("판매 관리");
         
         // 요소 보여주기
         modalsellcode.closest("div").show();
         modalitemtitle.closest("div").show();
         modalitemprice.closest("div").show();
         modalsupplier.closest("div").show();
         modalselldate.closest("div").show();
         modalModifyBtn.show();
         modalRemoveBtn.show();
         
         // 내용 보여주기
         modalsellid.val(data.sellid);
         modalsellcode.val(data.sellcode).attr("readonly", true);
         modalitemtitle.val(data.itemDto.itemtitle).attr("readonly", true);
         modalsellnum.val(data.sellnum);
         modalitemprice.val(data.itemDto.itemprice).attr("readonly", true);
         modalsupplier.val(data.itemDto.supplier).attr("readonly", true);
         modalselldate.val(data.selldate).attr("readonly", true);
         
         // 버튼 숨기기
         modal.find("button[id = 'modalRegisterBtn']").hide();
         
         
         modal.modal('show');
      }); // 하나 가져오기 end
   }) // 리스트 클릭 end
   
   modalRemoveBtn.click(function(){
      
      sellService.remove(modalsellid.val(),
         function(result){
            if(result == "success") {
               alert("삭제 성공");
            }
            location.reload();
            modal.modal("hide");
         },
         function(msg){
            alert(msg);
         }
      ); // remove end
   })
   
   modalModifyBtn.click(function(){
      
      var sellupdate = {
         sellid:modalsellid.val(),
         sellnum:modalsellnum.val()
      };
            
      sellService.update(sellupdate,
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