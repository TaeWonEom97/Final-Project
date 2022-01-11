/**
 * item 관련 js
 */
let itemService = (function(){
   
   $(document).ajaxSend(function(e, xhr, options){
      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
   });
   
   
   function add(insertItem, callback, error) {
      console.log("add method 실행");
      
      $.ajax({
         url:'/insertItem',
         type:'post',
         contentType:'application/json',
         data:JSON.stringify(insertItem),
         success:function(result) {
            if(callback) {
               callback(result);
            }
         },
         error:function(xhr, status, error) {
            alert("중복된 상품 코드입니다.");
         }
      })
   } // add end
   
   
   function get(itemcode, callback) {
         
      $.ajax({
         url:'/item/'+itemcode,
         type:'get',
         contentType:'application/json',
         data:JSON.stringify(itemcode),
         success:function(data) {
            if(callback) {
               callback(data);
            }   
         }
      })
   } // get end
   
   function remove(itemcode, callback, error) {
      
      $.ajax({
         url:'/item/'+itemcode,
         type:'delete',
         contentType:'application/json',
         data:JSON.stringify(itemcode),
         success:function(result){
            if(callback) {
               callback(result);
            }
         },
         error:function(xhr, status, error) {
            if(error) {
               alert("삭제할 수 없는 상품입니다.");
            }
         }
      })
   } // remove end
   
   function update(itemupdate, callback, error) {
      
      
      $.ajax({
         url:'/item/'+itemupdate.itemcode,
         type:'put',
         contentType:'application/json',
         data:JSON.stringify(itemupdate),
         success:function(data){
            if(callback) {
               callback(data);
            }
         },
         error:function(xhr, status, error) {
            if(error) {
               error(xhr.responseText);
            }
         }
      })
   } // update end
   
   return {
      add:add,
      get:get,
      remove:remove,
      update:update
   };
})();