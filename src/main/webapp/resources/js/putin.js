/**
 *  putin.jsp 
 */

$(function(){
	// 조회를 클릭하면 조회내용 보여주기
	$("#select").click(function(e){
		e.preventDefault();
		let date1 = $("#putindate").datepicker().val();
		//alert(date1);
		
		let tbody = $(".card.mb-4 .contents");
		
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
				
				
			
			var random_id = function  () 
	{
		var id_num = Math.random().toString(9).substr(2,3);
		var id_str = Math.random().toString(36).substr(2);
		
		return id_num + id_str;
	}


	//--->create data table > start
	var tbl = '';
	tbl +='<table class="table table-hover">'

		//--->create table header > start
		tbl +='<thead>';
			tbl +='<tr>';
			tbl +='<th>제품코드</th>';
			tbl +='<th>입고수량</th>';
			tbl +='<th>입고날짜</th>';
			tbl +='<th>입고순번</th>';
			tbl +='<th>제품명</th>';
			tbl +='<th>제품가격</th>';
			tbl +='<th>공급처</th>';
			tbl +='<th>사이즈</th>';
			tbl +='<th>색상</th>';
			tbl +='</tr>';
		tbl +='</thead>';
		//--->create table header > end

		
		//--->create table body > start
		tbl +='<tbody>';

			//--->create table body rows > start
			$.each(data, function(i,item) 
			{
				
				console.log(item.itemtitle);
				
				//you can replace with your database row id
				var row_id = random_id();

				//loop through ajax row data
				tbl +='<tr row_id="'+row_id+'">';
					tbl +='<td><div class="row_data" edit_type="click" col_name="fname">'+item.code+'</div></td>';
					tbl +='<td><div class="row_data" edit_type="click" col_name="lname">'+item.insertnum+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="email">'+displayTime(item.insertdate)+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="email2">'+item.seqid+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="email3">'+item.itemDto[0].itemtitle+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="email4">'+item.itemDto[0].itemprice+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="email5">'+item.itemDto[0].supplier+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="email6">'+item.itemDto[0].itemsize+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="email7">'+item.itemDto[0].color+'</div></td>';


					//--->edit options > start
					tbl +='<td>';
					 
						tbl +='<span class="btn_edit" > <a href="#" class="btn btn-link " row_id="'+row_id+'" > Edit</a> </span>';

						//only show this button if edit button is clicked
						tbl +='<span class="btn_save"> <a href="#" class="btn btn-link"  row_id="'+row_id+'"> <i class="far fa-save"></i></a> | </span>';
						tbl +='<span class="btn_cancel"> <a href="#" class="btn btn-link" row_id="'+row_id+'"><i class="fas fa-times"></i></a> | </span>';

					tbl +='</td>';
					//--->edit options > end
					
				tbl +='</tr>';
			});

			//--->create table body rows > end

		tbl +='</tbody>';
		//--->create table body > end

	tbl +='</table>'	
	
	console.log(tbl);
	//--->create data table > end
	tbody.html(tbl);		
			
		//out put table data
	$(document).find('.tbl_user_data').html(tbl);

	$(document).find('.btn_save').hide();
	$(document).find('.btn_cancel').hide(); 


	//--->make div editable > start
	$(document).on('click', '.row_data', function(event) 
	{
		event.preventDefault(); 

		if($(this).attr('edit_type') == 'button')
		{
			return false; 
		}

		//make div editable
		$(this).closest('div').attr('contenteditable', 'true');
		//add bg css
		$(this).addClass('bg-warning').css('padding','5px');

		$(this).focus();
	})	
	//--->make div editable > end


	//--->save single field data > start
	$(document).on('focusout', '.row_data', function(event) 
	{
		event.preventDefault();

		if($(this).attr('edit_type') == 'button')
		{
			return false; 
		}

		var row_id = $(this).closest('tr').attr('row_id'); 
		
		var row_div = $(this)				
		.removeClass('bg-warning') //add bg css
		.css('padding','')

		var col_name = row_div.attr('col_name'); 
		var col_val = row_div.html(); 

		var arr = {};
		arr[col_name] = col_val;

		//use the "arr"	object for your ajax call
		$.extend(arr, {row_id:row_id});

		//out put to show
		$('.post_msg').html( '<pre class="bg-success">'+JSON.stringify(arr, null, 2) +'</pre>');
		
	})	
	//--->save single field data > end

 
	//--->button > edit > start	
	$(document).on('click', '.btn_edit', function(event) 
	{
		event.preventDefault();
		var tbl_row = $(this).closest('tr');

		var row_id = tbl_row.attr('row_id');

		tbl_row.find('.btn_save').show();
		tbl_row.find('.btn_cancel').show();

		//hide edit button
		tbl_row.find('.btn_edit').hide(); 

		//make the whole row editable
		tbl_row.find('.row_data')
		.attr('contenteditable', 'true')
		.attr('edit_type', 'button')
		.addClass('bg-warning')
		.css('padding','3px')

		//--->add the original entry > start
		tbl_row.find('.row_data').each(function(index, val) 
		{  
			//this will help in case user decided to click on cancel button
			$(this).attr('original_entry', $(this).html());
		}); 		
		//--->add the original entry > end

	});
	//--->button > edit > end


	//--->button > cancel > start	
	$(document).on('click', '.btn_cancel', function(event) 
	{
		event.preventDefault();

		var tbl_row = $(this).closest('tr');

		var row_id = tbl_row.attr('row_id');

		//hide save and cacel buttons
		tbl_row.find('.btn_save').hide();
		tbl_row.find('.btn_cancel').hide();

		//show edit button
		tbl_row.find('.btn_edit').show();

		//make the whole row editable
		tbl_row.find('.row_data')
		.attr('edit_type', 'click')
		.removeClass('bg-warning')
		.css('padding','') 

		tbl_row.find('.row_data').each(function(index, val) 
		{   
			$(this).html( $(this).attr('original_entry') ); 
		});  
	});
	//--->button > cancel > end

	
	//--->save whole row entery > start	
	$(document).on('click', '.btn_save', function(event) 
	{
		event.preventDefault();
		var tbl_row = $(this).closest('tr');

		var row_id = tbl_row.attr('row_id');

		
		//hide save and cacel buttons
		tbl_row.find('.btn_save').hide();
		tbl_row.find('.btn_cancel').hide();

		//show edit button
		tbl_row.find('.btn_edit').show();


		//make the whole row editable
		tbl_row.find('.row_data')
		.attr('edit_type', 'click')
		.removeClass('bg-warning')
		.css('padding','') 

		//--->get row data > start
		var arr = {}; 
		tbl_row.find('.row_data').each(function(index, val) 
		{   
			var col_name = $(this).attr('col_name');  
			var col_val  =  $(this).html();
			arr[col_name] = col_val;
		});
		//--->get row data > end

		//use the "arr"	object for your ajax call
		$.extend(arr, {row_id:row_id});

		//out put to show
		$('.post_msg').html( '<pre class="bg-success">'+JSON.stringify(arr, null, 2) +'</pre>')
		 

	});
	//--->save whole row entery > end


		
		
		
			// 원래 화면에 띄우던 코드
			/*let str="";
				
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
			}*/
			
			
			
			
			
			}
		}) //ajax end
	}) //select end


	
	
	
/*	$("#datatablesSimple").on("click", function(){
		let modal2 = $("#newModal2");
		
		// 모달 창 영역 안의 요소 가져오기
		let modalcode = modal2.find("input[name='code']")
		let modalnum = modal2.find("input[name='num']");
		let modalinsertdate = modal2.find("input[name='insertdate']");
		let modalseqid = modal2.find("input[name='seqid']");
		let modalitemtitle = modal2.find("input[name='itemtitle']");
		let modalitemprice = modal2.find("input[name='itmeprice']");
		let modalsize = modal2.find("input[name='size']");
		let modalcolor = modal2.find("input[name='color']");
		
		let modalModifyBtn2 = modal2.find("#modalModifyBtn2");
		let modalRemoveBtn2 = modal2.find("#modalRemoveBtn2");
		let modalCloseBtn2 = modal2.find("#modalCloseBtn2");
			
		let code = $(this).attr('href');

		putinService.get(code, function(data){
			
			// 요소 보여주기
			modalcode.closest("div").show();
			modalnum.closest("div").show();
			modalinsertdate.closest("div").show();
			modalitemprice.closest("div").show();
			modalseqid.closest("div").show();
			modalitemtitle.closest("div").show();
			modalitemprice.closest("div").show();
			modalsize.closest("div").show();
			modalcolor.closest("div").show();
			
			modalModifyBtn2.show();
			modalRemoveBtn2.show();
			modalCloseBtn2.show();
		
			modal2.modal('show');
		});
		
	}) //delete 클릭 end*/
	
	
	
		
}) // 첫 function

	
	
function displayTime(timeValue){	
	
	var dateObj = new Date(timeValue);
	
	var yy = dateObj.getFullYear();
	var mm = dateObj.getMonth()+1;
	var dd = dateObj.getDate();
	
	return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');			
	
}//displayTime end