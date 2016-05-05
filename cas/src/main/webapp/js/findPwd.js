//onLoad
//倒计时时间
var wait = 60;
var hasGetCaptcha = false;
var isCaptchaRight = false;
$(function() {
	//页面加载时获取验证码按钮可以点击
	$("#telBtn").attr("disabled", false);
	
	//绑定获取验证码按钮点击事件
	$("#telBtn").click(function() {
		if(validateBasic()) {
			getSMS(this);
		}
	});
	
	//绑定确定按钮点击事件
	$("#phoneSubmit").click(function() {
		if(validateBasic()) {
			if(isCaptchaRight) {
				$('#codeGroup').removeClass('has-error');
				$('#codeGroup').addClass('has-success');
				$('#codeGroup .help-block').html('');
				//密码base64编码
				$.base64.utf8encode = true;
				var $password = $('#password');
				$password.val( $.base64('encode', $password.val()) );
				phoneSubmit();
			}
		}
		return false;
	});
	
	//绑定用户名输入框失焦事件
	$('#userName').on('blur', function(){
		checkUserName();
	});
	
	//绑定手机号输入框失焦事件
	$('#phone').on('blur', function(){
		checkPhone();
	});
	
	//绑定验证码输入框blur事件
	$("#code").blur(function(){
		if(hasGetCaptcha) {
			var code = $("#code").val();
			if($.trim(code) == "" || isNaN(code) || code.length != 6) {
				$('#codeGroup').removeClass('has-success');
				$('#codeGroup').addClass('has-error');
				$('#codeGroup .help-block').html('请输入6位短信验证码');
				return false;
			} else {
				$('#codeGroup').removeClass('has-error');
				$('#codeGroup').addClass('has-success');
				$('#codeGroup .help-block').html('');
				validateSMS(code);
			}
		}
	});
})

//点击验证码倒计时
function timeDown(o) {
	if (wait == 0) {
		o.removeAttribute("disabled");
		o.value = "获取验证码";
		wait = 60;
	} else {
		o.setAttribute("disabled", true);
		o.value = "重新发送(" + wait + ")";
		wait--;
		setTimeout(function() {
			timeDown(o)
		}, 1000)
	}
}

//前台校验基本信息
function validateBasic() {
	return checkUserName() && checkPhone();
}

function checkUserName() {
	var flag = false;
	var userName = $("#userName").val();
	if($.trim(userName) == "") {
		$('#userNameGroup').removeClass('has-success');
		$('#userNameGroup').addClass('has-error');
		$('#userNameGroup .help-block').html('请输入用户名');
		return false;
	} else {
		$.ajax({
			url : "findPwd/checkUserName" ,
			type : "POST" ,
			cache : false , 
			data : "userName=" + userName ,
			async : false ,
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#userNameGroup').removeClass('has-error');
					$('#userNameGroup').addClass('has-success');
					$('#userNameGroup .help-block').html('');
					flag = true;
				} else {
					$('#userNameGroup').removeClass('has-success');
					$('#userNameGroup').addClass('has-error');
					$('#userNameGroup .help-block').html('用户名不存在');
				}
			} 
		});
		return flag;
	}
}

function checkPhone() {
	var phone = $("#phone").val();
	var phoneRegExp = /^1[34578]\d{9}$/;
	if($.trim(phone) == "" || isNaN(phone) || phone.length != 11 || !phoneRegExp.test(phone)) {
		$('#phoneGroup').removeClass('has-success');
		$('#phoneGroup').addClass('has-error');
		$('#phoneGroup .help-block').html('请输入11位手机号');
		return false;
	} else {
		$('#phoneGroup').removeClass('has-error');
		$('#phoneGroup').addClass('has-success');
		$('#phoneGroup .help-block').html('');
		return true;
	}
}

//获取验证码
function getSMS(btn) {
	//后台验证是否用户名和手机号是否匹配,成功则调用验证码返回。
	$.ajax({
		url : "findPwd/getSMS" ,
		type : "POST" ,
		cache : false , 
		data : $("#phoneForm").serialize() ,
		dataType : "json" ,
		success : function(data) {
			if(data.result == "true") {
				timeDown(btn);
				hasGetCaptcha = true;
				$('#phoneGroup').removeClass('has-error');
				$('#phoneGroup').addClass('has-success');
				$('#phoneGroup .help-block').html('');
			} else {
				$('#phoneGroup').removeClass('has-success');
				$('#phoneGroup').addClass('has-error');
				$('#phoneGroup .help-block').html(data.errorInfo);
			}
		} 
	}) ;
}

//校验验证码是否正确
function validateSMS(code) {
	$.ajax({
		url : "findPwd/validateSMS" ,
		type : "POST" ,
		cache : false , 
		data : "code=" + code ,
		dataType : "json" ,
		success : function(data) {
			if(data.result == "true") {
				$('#codeGroup').removeClass('has-error');
				$('#codeGroup').addClass('has-success');
				$('#codeGroup .help-block').html('');
				isCaptchaRight = true;
			} else {
				$('#codeGroup').removeClass('has-success');
				$('#codeGroup').addClass('has-error');
				$('#codeGroup .help-block').html(data.errorInfo);
				isCaptchaRight = false;
			}
		} 
	});
}

//执行修改密码动作
function phoneSubmit() {
	$.ajax({
		url : "findPwd/resetPwdByPhone" ,
		type : "POST" ,
		cache : false , 
		data : $("#phoneForm").serialize() ,
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '操作成功',
					content : '密码修改成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href="/cas";
			} else {
				$.confirm({
					keyboardEnabled : true,
					title : '操作失败',
					content : data.msg,
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
			}
		} 
	});
}
