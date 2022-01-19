/**
 * 
 */

let clientService = (function(){
		//	추가하기	
	function add(clientinsert, callback, error) {
		console.log("add method 실행");
		
		$.ajax({
			url:'/client/insertClient',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(clientinsert),
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
	// 한줄 눌렀을때 내용 가져오기
	function get(clcode, callback) {
			
		$.ajax({
			url:'/client/'+clcode,
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(clcode),
			success:function(data) {
				if(callback) {
					callback(data);
				}	
			}
		})
	} // get end
	// 삭제하기
	function remove(clcode, callback, error) {
		
		$.ajax({
			url:'/client/'+clcode,
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
	// 수정하기
	function update(clupdate, callback, error) {
		
		$.ajax({
			url:'/client/clcode',
			type:'put',
			contentType:'application/json',
			data:JSON.stringify(clupdate),
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