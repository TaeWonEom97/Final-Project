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

/*$(function(){
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
      }*/


	
