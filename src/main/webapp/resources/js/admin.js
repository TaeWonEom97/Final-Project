/**
 * 
 */
let adminService = (function(){
	
	function remove(userid, callback, error) {
		
		$.ajax({
			url:'/admin/'+userid,
			type:'delete',
			success:function(result){
				if(callback) {
					callback(result);
				}
			},
			error:function(xhr, status, error) {
				if(error) {
					error(xhr.responseText);
				}
			}
		})
	} // remove end
	
	function update(userid, callback, error) {
		
		$.ajax({
			url:'/admin/'+userid,
			type:'put',
			contentType:'application/json',
			data:JSON.stringify(userid),
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
		remove:remove,
		update:update
	};
})();

$(function(){
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
	
})
	
	

