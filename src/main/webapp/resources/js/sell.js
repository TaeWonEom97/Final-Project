/**
 * 
 */
let sellService = (function(){
	
	function add(sellinsert, callback, error) {
		console.log("add method 실행");
		
		$.ajax({
			url:'/insertSell',
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
	
	function get(sellid, callback) {
			
		$.ajax({
			url:'/'+sellid,
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(sellid),
			success:function(data) {
				if(callback) {
					callback(data);
				}	
			}
		})
	} // get end
	
	function remove(sellid, callback, error) {
		
		$.ajax({
			url:'/'+sellid,
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
	
	function update(sellupdate, callback, error) {
		
		$.ajax({
			url:'/sellid',
			type:'put',
			contentType:'application/json',
			data:JSON.stringify(sellupdate),
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