$(function() {
	$('#updateInfo').on('click', function(){
		$('#updateModal').modal();
	});
	
	//打开重置密码模态框按钮点击事件
	$('.resetPwd').on('click', function(){
		$('#password').val('');
		$('#resetPwdModal').modal();
		return false;
	});
	
	//打开修改照片模态框按钮点击事件
	$('#updatePhoto').on('click', function(){
		$('#updatePhotoModal').modal();
	});
	
	//原密码失去焦点事件
	$('#oldPassword').on('blur', function(){
		var oldPwd = $(this).val();
		if(oldPwd == '') {
			$('#oldPasswordGroup').removeClass('has-success');
			$('#oldPasswordGroup').addClass('has-error');
			$('#oldPasswordGroup .help-block').html('原密码不正确');
			return false;
		}
		ajaxValidatePwd();
	});
	
	//确认重置密码按钮点击事件
	$('#resetPwdConfirm').on('click', function(){
		if(ajaxValidatePwd() && checkPassword()) {
			handleBeforeSubmit();
			ajaxResetPwd();
		}
	});
	
	//确认修改照片按钮点击事件
	$('#updatePhotoConfirm').on('click', function(){
		return checkPhoto();
	});
	
})

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#password');
	$password.val( $.base64('encode', $password.val()) );
}

function ajaxResetPwd() {
	var uuid = $('#password').attr('uuid');
	var password = $('#password').val();
	$.ajax({
		url : "self/resetPwd", 
		type : "POST",
		cache : false,
		dataType : "json",
		data : {'uuid' : uuid, 'password' : password},
		success : function(data) {
			$('#resetPwdModal').modal('hide');
			if (data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '操作成功',
					content : '密码修改成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
			} else {
				$.confirm({
					keyboardEnabled : true,
					title : '操作失败',
					content : data.result,
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
			}
		}
	});
}


function ajaxValidatePwd() {
	$.base64.utf8encode = true;
	var encodedPwd = $.base64('encode', $('#oldPassword').val());
	var uuid = $('#oldPassword').attr('uuid');
	var flag = false;
	$.ajax({
		url : "self/validatePwd", 
		type : "POST",
		cache : false,
		async : false,
		dataType : "json",
		data : {'uuid' : uuid, 'password' : encodedPwd},
		success : function(data) {
			if (data.result == "false") {
				$('#oldPasswordGroup').removeClass('has-success');
				$('#oldPasswordGroup').addClass('has-error');
				$('#oldPasswordGroup .help-block').html('原密码不正确');
			} else {
				$('#oldPasswordGroup').removeClass('has-error');
				$('#oldPasswordGroup').addClass('has-success');
				$('#oldPasswordGroup .help-block').html('');
				flag = true;
			}
		}
	});
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

function checkPhoto() {
	if($('#input-id').fileinput('getFileStack').length == 0){
		$('#photoGroup').removeClass('has-success');
		$('#photoGroup').addClass('has-error');
		$('#photoGroup .help-block').html('请选择照片');
		return false;
	} else {
		$('#photoGroup').removeClass('has-error');
		$('#photoGroup').addClass('has-success');
		$('#photoGroup .help-block').html('');
		return true;
	}
}

