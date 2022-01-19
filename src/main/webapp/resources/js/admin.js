/**
 * 
 */
let adminService = (function(){
	
	function get(userid, callback) {
			
		$.ajax({
			url:'/admin/'+userid,
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(userid),
			success:function(data) {
				if(callback) {
					callback(data);
				}	
			}
		})
	} // get end
	
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
	
	function add(sellinsert, callback, error) {
		console.log("add method 실행");
		
		$.ajax({
			url:'/sell/insertSell',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(sellinsert),
			success:function(result) {
				if(callback) {
					callback(result);
				}
			},
			error:function(xhr, status, error) {
				error(err);
			}
		})
	} // add end
	
	return {
		remove:remove,
		add:add,
		get:get
	};
})();

$(function(){
	$("#btn_admin").click(function(e){
		e.preventDefault();
		
	})
})
	
	

