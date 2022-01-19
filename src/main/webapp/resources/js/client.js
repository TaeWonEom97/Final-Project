/**
 * insertSell 모달 창 띄우기
 */

$(function(){
   
   let modal = $('#clientModal');
   
   // 모달 창 영역 안의 요소 가져오기
   let modalclcode = modal.find("input[name='clcode']");
   let modalclname = modal.find("input[name='clname']");
   let modalclregnum = modal.find("input[name='clregnum']");
   let modalclrepre = modal.find("input[name='clrepre']");
   let modalclcellnum = modal.find("input[name='clcellnum']");
   let modalclemp = modal.find("input[name='clemp']");
   
   let modaltitle = modal.find(".modal-title");

   let modalRegisterBtn = modal.find("#modalRegisterBtn");
   let modalModifyBtn = modal.find("#modalModifyBtn");
   let modalRemoveBtn = modal.find("#modalRemoveBtn");
   let modalCloseBtn = modal.find("#modalCloseBtn");
   
   $(document).ajaxSend(function(e, xhr, options){
      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
   });
   
   $("#newcl").click(function(){
      
      // 타이틀 변경
      modaltitle.text("거래처 추가");
      
      // readonly 속성 제거
      modalclname.attr("readonly", false);
      modalclregnum.attr("readonly", false);
      modalclrepre.attr("readonly", false);
      modalclcellnum.attr("readonly", false);
      modalclemp.attr("readonly", false);
      
      // input 안에 들어있는 value 제거
      modal.find("input").val("");
      
      // 필요없는 요소 숨기기
      /*modalitemtitle.closest("div").hide();
      modalitemprice.closest("div").hide();
      modalsupplier.closest("div").hide();
      modalselldate.closest("div").hide();*/
      
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

      var clientinsert = {
         clname:modalclname.val(),
         clcode:modalclcode.val(),
         clregnum:modalclregnum.val(),
         clrepre:modalclrepre.val(),
         clcellnum:modalclcellnum.val(),
         clemp:modalclemp.val()
      };
      
      clientService.add(clientinsert,
         function(result){
            if(result) {
               if(result == 'success') {
                  alert("거래처 등록 성공");
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
      
      let clcode = $(this).attr('href');
      
      clientService.get(clcode, function(data){
         
         // 타이틀 변경
         modaltitle.text("거래처 관리");
         
         // 요소 보여주기
         modalModifyBtn.show();
         modalRemoveBtn.show();
         
         // 내용 보여주기
         modalclname.val(data.clname);
         modalclcode.val(data.clcode).attr("readonly", true);
         modalclregnum.val(data.clregnum);
         modalclrepre.val(data.clrepre);
         modalclcellnum.val(data.clcellnum);
         modalclemp.val(data.clemp);
         
         // 버튼 숨기기
         modal.find("button[id = 'modalRegisterBtn']").hide();
         
         
         modal.modal('show');
      }); // 하나 가져오기 end
   }) // 리스트 클릭 end
   
   modalRemoveBtn.click(function(){
      
      clientService.remove(modalclcode.val(),
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
      
      var clupdate = {
         clcode:modalclcode.val(),
         clname:modalclname.val(),
         clregnum:modalclregnum.val(),
         clrepre:modalclrepre.val(),
         clcellnum:modalclcellnum.val(),
         clemp:modalclemp.val()
      };
            
      clientService.update(clupdate,
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