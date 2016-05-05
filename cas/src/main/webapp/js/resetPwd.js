$(function() {
	
	//绑定用户名输入框失焦事件
	$('#userName').on('blur', function(){
		checkUserName();
	});
	
	//绑定密码输入框失焦事件
	$('#password').on('blur', function(){
		checkPassword();
	});
	
	//绑定确定按钮点击事件
	$("#submit").click(function() {
		if(validateBasic()) {
			//密码base64编码
			$.base64.utf8encode = true;
			var $password = $('#password');
			$password.val( $.base64('encode', $password.val()) );
			
			submit();
		}
		return false;
	});
	
	
})

//前台校验基本信息
function validateBasic() {
	return checkUserName() && checkPassword();
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
			url : "findPwd/checkUserNameByEmail" ,
			type : "POST" ,
			cache : false , 
			data : "userName=" + userName ,
			async : false ,
			dataType : "json" ,
			success : function(data) {
				if(data.result == "true") {
					$('#userNameGroup').removeClass('has-error');
					$('#userNameGroup').addClass('has-success');
					$('#userNameGroup .help-block').html('');
					flag = true;
				} else {
					$('#userNameGroup').removeClass('has-success');
					$('#userNameGroup').addClass('has-error');
					$('#userNameGroup .help-block').html('用户名不正确');
				}
			} 
		});
		return flag;
	}
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

//执行修改密码动作
function submit() {
	$.ajax({
		url : "findPwd/resetPwdByEmail" ,
		type : "POST" ,
		cache : false , 
		data : $("#form").serialize() ,
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '操作成功',
					content : '密码重置成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				setTimeout(function() {
					window.location.href="login";
				}, 3000);
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
