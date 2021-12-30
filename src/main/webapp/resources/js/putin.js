/**
 *  putin.jsp 
 */

$(function(){
	// 조회를 클릭하면 조회내용 보여주기
	$("#select").click(function(e){
		e.preventDefault();
		let date1 = $("#putindate").datepicker().val();
		//alert(date1);
		
		let tbody = $(".dataTable-table tbody");
		
		// type 값이 들어 있는지 확인
		// 값이 없는 경우 메시지 띄우고 돌아가기
		if(date1 === ''){
			alert('날짜를 입력해 주세요');
			return;			
		}
		
		$.ajax({
			url:'putin',
			type:'post',
			data:{
				insertDate:date1
			},
			success:function(data){
				console.log(data);
			
			let str="";
				
			for(var i=0,len=data.length||0;i<len;i++){
				str += "<tr>";	
				str += "<td>"+data[i].code+"</td>";
				str += "<td>"+data[i].insertnum+"</td>";
				str += "<td>"+displayTime(data[i].insertdate)+"</td>";
				str += "<td>"+data[i].seqid+"</td>";
				str += "<td>"+data[i].itemDto[0].itemtitle+"</td>";
				str += "<td>"+data[i].itemDto[0].itemprice+"</td>";
				str += "<td>"+data[i].itemDto[0].supplier+"</td>";
				str += "<td>"+data[i].itemDto[0].itemsize+"</td>";
				str += "<td>"+data[i].itemDto[0].color+"</td>";
				str += "</tr>";	
			}
			tbody.html(str);
			}
		}) //ajax end

	}) //select end
		
}) // 첫 function
	
	
	
function displayTime(timeValue){	
	
	var dateObj = new Date(timeValue);
	
	var yy = dateObj.getFullYear();
	var mm = dateObj.getMonth()+1;
	var dd = dateObj.getDate();
	
	return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');			
	
}//displayTime end