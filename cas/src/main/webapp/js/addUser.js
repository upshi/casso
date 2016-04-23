$(function(){
	
	$('#userName').on('blur',checkUserName);
	$('#name').on('blur',checkName);
	$('#password').on('blur',checkPassword);
	$('#idNo').on('blur',checkIdNo);
	$('#phone').on('blur',checkPhone);
	$('#email').on('blur',checkEmail);
	
	$('#submit').on('click', function(){
		//表单校验
		var pass = validate();
		if(pass) {
			handleBeforeSubmit();
			return true;
		}
		return false;
	});
	
	//年龄的select
	for(var i=0; i<100; i++) {
		if(i == 20) {
			$('#age-select').append('<option value="' + i + '" selected>' + i + '</option>');
		} else {
			$('#age-select').append('<option value="' + i + '">' + i + '</option>');
		}
	}
});

//表单校验
function validate() {
	if(checkUserName() && checkPassword() &&
	   checkName() && checkIdNo() && checkPhone() &&
	   checkEmail()) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#password');
	$password.val( $.base64('encode', $password.val()) );
}

function checkUserName() {
	var flag = false;
	var userName = $('#userName').val();
	if(userName == null || $.trim(userName) == '') {
		$('#userNameGroup').removeClass('has-success');
		$('#userNameGroup').addClass('has-error');
		$('#userNameGroup .help-block').html('请输入用户名');
		return false;
	} else {
		$.ajax({
			url : "services/user/checkUserNameUnique/" + userName ,
			type : "GET" ,
			cache : false , 
			async: false,
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#userNameGroup').removeClass('has-success');
					$('#userNameGroup').addClass('has-error');
					$('#userNameGroup .help-block').html('用户名已存在');
				} else {
					$('#userNameGroup').removeClass('has-error');
					$('#userNameGroup').addClass('has-success');
					$('#userNameGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}
	return flag;
}

function checkPassword() {
	var password = $('#password').val();
	if(password == null || $.trim(password).length < 6) {
		$('#passwordGroup').removeClass('has-success');
		$('#passwordGroup').addClass('has-error');
		$('#passwordGroup .help-block').html('请输入至少6位密码');
		return false;
	} else {
		$('#passwordGroup').removeClass('has-error');
		$('#passwordGroup').addClass('has-success');
		$('#passwordGroup .help-block').html('');
		return true;
	}
}

function checkName() {
	var name = $('#name').val();
	if(name == null || $.trim(name) == '') {
		$('#nameGroup').removeClass('has-success');
		$('#nameGroup').addClass('has-error');
		$('#nameGroup .help-block').html('请输入姓名');
		return false;
	} else {
		$('#nameGroup').removeClass('has-error');
		$('#nameGroup').addClass('has-success');
		$('#nameGroup .help-block').html('');
		return true;
	}
}

function checkIdNo() {
	var idNo = $('#idNo').val();
	if(idNo != null && $.trim(idNo) != '') {
		var re = /^[1-9]\d{16}[\d|x]$/i;
		if(!re.test(idNo)) {
			$('#idNoGroup').removeClass('has-success');
			$('#idNoGroup').addClass('has-error');
			$('#idNoGroup .help-block').html('您输入的身份证号格式不正确');
			return false;
		} else {
			$('#idNoGroup').removeClass('has-error');
			$('#idNoGroup').addClass('has-success');
			$('#idNoGroup .help-block').html('');
			return true;
		}
	} else {
		$('#idNoGroup').removeClass('has-error');
		$('#idNoGroup .help-block').html('');
		return true;
	}
}

function checkPhone() {
	var phone = $('#phone').val();
	if(phone != null && $.trim(phone) != '') {
		var re = /^1[3|4|5|7|8]\d{9}$/i;
		if(!re.test(phone)) {
			$('#phoneGroup').removeClass('has-success');
			$('#phoneGroup').addClass('has-error');
			$('#phoneGroup .help-block').html('您输入的手机号格式不正确');
			return false;
		} else {
			$('#phoneGroup').removeClass('has-error');
			$('#phoneGroup').addClass('has-success');
			$('#phoneGroup .help-block').html('');
			return true;
		}
	} else {
		$('#phoneGroup').removeClass('has-error');
		$('#phoneGroup .help-block').html('');
		return true;
	}
}

function checkEmail() {
	var email = $('#email').val();
	if(email != null && $.trim(email) != '') {
		var re = /^[\w+]*@[\w+\.]+\w+$/i;
		if(!re.test(email)) {
			$('#emailGroup').removeClass('has-success');
			$('#emailGroup').addClass('has-error');
			$('#emailGroup .help-block').html('您输入的邮箱格式不正确');
			return false;
		} else {
			$('#emailGroup').removeClass('has-error');
			$('#emailGroup').addClass('has-success');
			$('#emailGroup .help-block').html('');
			return true;
		}
	} else {
		$('#emailGroup').removeClass('has-error');
		$('#emailGroup .help-block').html('');
		return true;
	}
}