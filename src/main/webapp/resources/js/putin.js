/**
 *  putin.jsp 
 */

$(function(){
	// 조회를 클릭하면 조회내용 보여주기
	$("#select").click(function(e){
		e.preventDefault();
		let date1 = $("#putindate").datepicker().val();
		//alert(date1);
		
		//let tbody = $(".card.mb-4 .contents");
		let tbody = $(".panel-body .contents");
		
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
			$.each(data, function(i,item,val) 
			{
				//you can replace with your database row id
				var row_id = random_id();

				//loop through ajax row data
				tbl +='<tr row_id="'+row_id+'">';
					tbl +='<td><div class="row_data" edit_type="click" col_name="code">'+item.code+'</div></td>';
					tbl +='<td><div class="row_data" edit_type="click" col_name="insertnum">'+item.insertnum+'</div></td>';
					tbl +='<td><div class="row_data" edit_type="click" col_name="insertdate">'+displayTime(item.insertdate)+'</div></td>';
					tbl +='<td><div class="row_data" edit_type="click" col_name="seqid">'+item.seqid+'</div></td>';
					tbl +='<td><div class="row_data" edit_type="click" col_name="itemtitle">'+item.itemDto[0].itemtitle+'</div></td>';
					tbl +='<td><div class="row_data" edit_type="click" col_name="itemprice">'+item.itemDto[0].itemprice+'</div></td>';
					tbl +='<td><div class="row_data" edit_type="click" col_name="supplier">'+item.itemDto[0].supplier+'</div></td>';
					tbl +='<td><div class="row_data" edit_type="click" col_name="itemsize">'+item.itemDto[0].itemsize+'</div></td>';
					tbl +='<td><div class="row_data" edit_type="click" col_name="color">'+item.itemDto[0].color+'</div></td>';


					//--->edit options > start
					tbl +='<td>';
					 
						tbl +='<span class="btn_edit" > <a href="#" class="btn btn-link " row_id="'+row_id+'" > Edit</a> </span>';

						//only show this button if edit button is clicked
						tbl +='<span class="btn_save"> <button id="btn_save" type="button" class="btn btn-secondary btn-sm"  row_id="'+row_id+'"> <i class="far fa-save"></i></button> | </span>';
						tbl +='<span class="btn_cancel"> <button id="btn_cancel" type="button" class="btn btn-secondary btn-sm" row_id="'+row_id+'"><i class="fas fa-times"></i></button> | </span>';

					tbl +='</td>';
					//--->edit options > end
					
				tbl +='</tr>';

			});

			//--->create table body rows > end

		tbl +='</tbody>';
		//--->create table body > end

	tbl +='</table>'	
	
	//console.log(tbl);
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
		tbl_row.find('row_data')
		.attr('contenteditable', 'true')
		.attr('edit_type', 'button')
		.addClass('bg-warning')
		.css('padding','3px')

		//--->add the original entry > start
		tbl_row.find('.row_data').each(function(i, val) 
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

		tbl_row.find('.row_data').each(function(i, val) 
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
		tbl_row.find('.row_data').each(function(i, val) 
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
			
		//console.log(arr);
		//let itemcode = tbl_row.find('td:nth-child(1)').text();
		let amount = tbl_row.find('td:nth-child(2)').text();
		//let insertdate = tbl_row.find('td:nth-child(3)').text();
		let seqid = tbl_row.find('td:nth-child(4)').text();
		/*let itemtitle = tbl_row.find('td:nth-child(5)').text();
		let itemprice = tbl_row.find('td:nth-child(6)').text();
		let supplier = tbl_row.find('td:nth-child(7)').text();
		let size = tbl_row.find('td:nth-child(8)').text();
		let color = tbl_row.find('td:nth-child(9)').text();*/
		
		console.log(amount+"   "+seqid);
		
		let putinupdate={
			//itemcode:itemcode,
			insertnum:amount,
			//insertdate:insertdate,
			seqid:seqid,
			//itemtitle:itemtitle,
			//itemprice:itemprice,
			//supplier:supplier,
			//size:size,
			//color:color
		}
		console.log(putinupdate.seqid);
		
		putinService.update(putinupdate,
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

	});
	
	//--->save whole row entery > end
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