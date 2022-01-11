/**
 * reply 관련된 스크립트
 */

// 자바스크립트 모듈화
let putinService = (function(){
	
	function add(newinsert,callback,error){
		console.log("add method 실행");		
		
		$.ajax({
			url:'/putinnew',
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(newinsert),
			success:function(result){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr,status,err){
				error(err);
			}			
		})	
	}//add end


	function get(code, callback) {
		$.ajax({
			url:'/'+code,
			type:'get',
			contentType:'application/json',
			data:JSON.stringify(code),
			success:function(data) {
				if(callback) {
					callback(data);
				}	
			}
		})
	} // get end
	
	
	function remove(putinremove,callback,error){
		$.ajax({
			url:'/putin/'+putinremove.code,
			type: 'delete', 
			contentType:'application/json',
			data:JSON.stringify(putinremove),
			success:function(result){
				if(callback){
					callback(result);					
				}
			},
			error:function(xhr,status,err){
				if(error){
					error(xhr.responseText);
				}
			}
		})	
	}//remove end
	
	function update(putinupdate, callback, error) {
		
		$.ajax({
			url:'/putin/'+putinupdate.seqid,
			type:'post',
			contentType:'application/json',
			data:JSON.stringify(putinupdate),
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
	

	
	function displayTime(timeValue){
		
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		
		var str ="";
		
		if(gap < (1000 * 60 * 60 * 24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return[(hh>9?'':'0')+hh,':',(mi>9?'':'0')+mi,':',(ss>9?'':'0')+ss].join('');
		}else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;
			var dd = dateObj.getDate();
			
			return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');
			
		}
		
		
	}//displayTime end
	
	
	return {
		add:add,
		get:get,
		remove:remove,
		update:update,
		displayTime:displayTime
		};
	
})();


