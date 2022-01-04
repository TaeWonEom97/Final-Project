/*조회 누르면 날짜 
*
조회되는 모달창 생성*/
$(function(){
	 
let modal = $('#lookup_modal');

	$("#lookupbtn").on( "click", function() {
        
		modal.modal('show');
		
		
})	
		$("#closebtn").on("click", function(){
			 
		modal.modal('hide');
})
	
		
})

  $( function() {
    $( "#datepicker" ).datepicker();
  } );

$( function() {
    $( "#datepicker2" ).datepicker();
  } );

//날짜 조회

$(function(){
   // 조회를 클릭하면 조회내용 보여주기
   $("#select").click(function(e){
      e.preventDefault();
      let date1 = $("#datepicker").datepicker().val();
      //alert(date1);
      
      let tbody = $(".dataTable-table tbody");
      
      // type 값이 들어 있는지 확인
      // 값이 없는 경우 메시지 띄우고 돌아가기
      if(date1 === ''){
         alert('날짜를 입력해 주세요');
         return;         
      }


	
/*날짜를 입력하지 않으면 "날짜를 입력 해 주세요 "모달창 띄우기
 <!--Modal--> 
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Modal header</h3>
    </div>
    <div class="modal-body">
        <p>One fine body…</p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button class="btn btn-primary">Save changes</button>
    </div>
</div> 