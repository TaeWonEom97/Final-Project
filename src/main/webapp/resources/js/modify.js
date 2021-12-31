/**
 * modify.jsp 스크립트
 */

$(function() {
	// remove, list 일 떄 전송될 Form
	let formObj = $("#actionForm");

	$("button").click(function(e) {
		e.preventDefault(); //submit막기

		// 어느 버튼에서 명령이 왔는가? 확인을 해줘야한다 
		// data-* 왓더 퍽... 이런게 있엉?
		let oper = $(this).data("oper");

		if (oper == 'modify') {
			formObj = $("form[role='form']");
			// modify 눌렀을 시 작동되도록
			
			
			
		} else if (oper == 'remove') {
			formObj.attr("action", "/board/remove").attr("method", "post");
		} else {
			formObj.attr("action", "/board/list").attr("method", "get").find("input[name='bno']").remove();
		}

		formObj.submit();
	})
	
	
	// beforeSend : ajax 추가해서 header 값으로 보내야 하는 값들을 전송(ajax 코드 안에 해당 코드가 존재해야 함)
	// ajaxSend() : ajax 호출되면 무조건 이 값을 헤더로 전송
	$(document).ajaxSend(function(e,xhr,options){
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});

	


	// 원본 이미지 창 닫기 
	$(".bigPictureWrapper").on("click", function() {
		$(".bigPicture")
			.animate({
				width: '0%',
				height: '0%'
			}, 1000);

		setTimeout(function() {
			$(".bigPictureWrapper").hide();
		}, 1000);

	})

})
function showImage(fileCallPath) {
	console.log(fileCallPath);

	// 안보였던 영역 보이기
	$(".bigPictureWrapper").css("display", "flex").show();

	$(".bigPicture").html("<img src='/display?fileName=" + fileCallPath + "'>")
		.animate({
			width: '100%',
			height: '100%'
		}, 1000);

}