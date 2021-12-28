/*/**
 *  stocklist.jsp
 */
//달력 기능 구현
  $(function() {
		 $("#datepicker1").datepicker();
							    });
							
	  $.datepicker.setDefaults({
							        dateFormat: 'yy-mm-dd',
							        prevText: '이전 달',
							        nextText: '다음 달',
							        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
							        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
							        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
							        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
							        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
							        showMonthAfterYear: true,
							        yearSuffix: '년'
							    });
							
							    $(function() {
							        $("#datepicker1").datepicker();
							    });


//날짜 조회
/*$(function(){
	$("#StockList").validate({
		rules:{
			search:{
				required:true;
			}
		},
		messages:{
			
		}
	})
*/
	
// 날짜를 입력하지 않으면 "날짜를 입력 해 주세요 "모달창 띄우기
/* Modal -
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
		
		
		*/
		
		
	//})
        		