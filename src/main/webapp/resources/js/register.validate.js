/**
 * register.jsp validate
 */
$(function() {

  $("#regist").validate({
    errorPlacement: function(error, element) {
      $(element)
        .closest("form")
        .find("small[id='" + element.attr("id") + "']")
        .append(error);
    },
    rules: {
      userid: {
        required: true,
        email: true,
        remote:{
			url:"/checkId",
			type:"POST",
			beforeSend:function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			data:{
				userid:function(){
					return $('#userid').val();
				}
			}
		}
      },
	  company: {
		required: true,
	  },
      password: {
        required: true,
        validPwd: true
      },
      inputPasswordConfirm: {
        required: true,
        validPwd: true,
        equalTo:"#password"
      },
    },
    messages: {
      userid: {
        remote: "아이디가 중복되었습니다.",
        required: "아이디는 필수 입력 요소입니다."
      },
      company: {
        required: "회사명는 필수 입력 요소입니다."
      },
      password: {
        required: "비밀번호는 필수 입력 요소입니다."
      },
      inputPasswordConfirm: {
        required: "비밀번호는 필수 입력 요소입니다.",
        equalTo:"이전 비밀번호와 다릅니다."
      }
    }
  });
});
$.validator.addMethod(
  "validPwd",
  function(value) {
    var regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
    return regPwd.test(value);
  },
  "비밀번호는 숫자와 영문자와 특수문자의 조합으로 8~15자리를 사용해야 합니다."
);
$.validator.addMethod(
  "email",
  function(value) {
    var regEmail = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return regEmail.test(value);
  },
  "아이디는 이메일 형식으로 작성해야 합니다."
);
