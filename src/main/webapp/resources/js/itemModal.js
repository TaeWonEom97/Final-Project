/**
 * 
 */
$(function(){
   
   let modal = $('#itemModal');
   
   // 모달 창 영역 안의 요소 가져오기
   let modalitemcode = modal.find("input[name='itemcode']")
   let modalitemtitle = modal.find("input[name='itemtitle']");
   let modalitemprice = modal.find("input[name='itemprice']");
   let modalsupplier = modal.find("input[name='supplier']");
   let modalitemsize = modal.find("input[name='itemsize']");
   let modalcolor = modal.find("input[name='color']");
   let modalitemdate = modal.find("input[name='itemdate']");
   
   let modaltitle = modal.find(".modal-title");

   let modalRegisterBtn = modal.find("#modalRegisterBtn");
   let modalModifyBtn = modal.find("#modalModifyBtn");
   let modalRemoveBtn = modal.find("#modalRemoveBtn");
   let modalCloseBtn = modal.find("#modalCloseBtn");
   
   $(document).ajaxSend(function(e, xhr, options){
      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
   });
   
   
   let tr = $(this);      
   let itemcode = $(tr).find("td:first-child").text();
   
   $("#new").click(function(){
      
      // 타이틀 변경
      modaltitle.text("제품 추가");
      
      // readonly 속성 제거
      modalitemcode.attr("readonly", false);
      modalitemtitle.attr("readonly", false);
      modalitemprice.attr("readonly", false);
      modalsupplier.attr("readonly", false);
      modalitemsize.attr("readonly", false);
      modalcolor.attr("readonly", false);
      modalitemdate.attr("readonly", false);
      
      // input 안에 들어있는 value 제거
      modal.find("input").val("");
      
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


      var insertNew = {
         itemcode:modalitemcode.val(),
         itemtitle:modalitemtitle.val(),
         itemprice:modalitemprice.val(),
         supplier:modalsupplier.val(),
         itemsize:modalitemsize.val(),
         color:modalcolor.val(),
         itemdate:modalitemdate.val(),
      };
      
      itemService.add(insertNew,
         function(result){
            if(result) {
               if(result == 'success') {
                  alert("상품 등록 성공");
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
      
      let tr = $(this);      
      let itemcode = $(tr).find("td:first-child").text();
      
      
      //ajax 코드 
      
      itemService.get(itemcode, function(data){
         
         console.log(data);
         
         // 타이틀 변경
         modaltitle.text("상품 관리");
         
         // 요소 보여주기
         modalitemcode.closest("div").show();
         modalitemtitle.closest("div").show();
         modalitemprice.closest("div").show();
         modalsupplier.closest("div").show();
         modalitemsize.closest("div").show();
         modalcolor.closest("div").show();
         modalitemdate.closest("div").show();
         modalModifyBtn.show();
         modalRemoveBtn.show();
         
         // 내용 보여주기
         modalitemcode.val(data.itemcode);
         modalitemtitle.val(data.itemtitle);
         modalitemprice.val(data.itemprice);
         modalsupplier.val(data.supplier);
         modalitemsize.val(data.itemsize);
         modalcolor.val(data.color);
         modalitemdate.val(data.itemdate);
         
         // 버튼 숨기기
         modal.find("button[id = 'modalRegisterBtn']").hide();
         
         
         modal.modal('show');
      }); // 하나 가져오기 end*/
   }) // 리스트 클릭 end
   
   
   modalRemoveBtn.click(function(){
      console.log(modalitemcode.val());   
      
      itemService.remove(modalitemcode.val(),
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
      
   }) // modalRemove end
   
   modalModifyBtn.click(function(){
      
      var itemupdate = {
         itemcode:modalitemcode.val(),
         itemtitle:modalitemtitle.val(),
         itemprice:modalitemprice.val(),
         supplier:modalsupplier.val(),
         itemsize:modalitemsize.val(),
         color:modalcolor.val(),
         itemdate:modalitemdate.val()
      };
      
      console.log(itemupdate);
      
      /*let input = $(itemupdate);      
      let itemcode = $(input).find("div:first-child").text();
      */
      console.log(modalitemcode.val());
            
      itemService.update(itemupdate,
         function(data){
         console.log(data);
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