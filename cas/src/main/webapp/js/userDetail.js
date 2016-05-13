$(function() {
	
	$('#navi_user_manage').addClass('active');
	
	//打开重置密码模态框按钮点击事件
	$('#resetPwd').on('click', function(){
		$('#password').val('');
		$('#resetPwdModal').modal();
	});
	
	//打开修改照片模态框按钮点击事件
	$('#updatePhoto').on('click', function(){
		$('#updatePhotoModal').modal();
	});
	
	//确认重置密码按钮点击事件
	$('#resetPwdConfirm').on('click', function(){
		if(checkPassword()) {
			handleBeforeSubmit();
			ajaxResetPwd();
		}
	});
	
	//确认修改照片按钮点击事件
	$('#updatePhotoConfirm').on('click', function(){
		return checkPhoto();
	});
	
	//锁定用户按钮点击事件
	$('#lock').on('click', function(){
		var uuid = $(this).attr('uuid');
		$.confirm({
			keyboardEnabled : true,
			title : '锁定用户',
			content : '锁定后的用户不能登录该平台，确定锁定吗？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				userState(uuid,1);
			}
		});
	});
	
	//解冻用户按钮点击事件
	$('#unlock').on('click', function(){
		var uuid = $(this).attr('uuid');
		$.confirm({
			keyboardEnabled : true,
			title : '解锁用户',
			content : '解锁后的用户可以正常使用该平台，确定解锁吗？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				userState(uuid,2);
			}
		});
	});
})

function userState(uuid,state) {
	$.ajax({
		url : "services/user/updateState", 
		type : "POST",
		cache : false,
		dataType : "json",
		data : {'uuid' : uuid, 'state' : state},
		success : function(data) {
			if (data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '操作成功',
					content : '状态更改成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href = 'services/user/detail/' + uuid;
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
		url : "services/user/resetPwd", 
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
					content : '重置密码成功！',
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

function deleteUser(uuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除用户',
		content : '此操作会将该用户的状态变为已删除,将无法再使用本系统,确认删除？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			userState(uuid,0);
		}
	});
}

function ajaxDelete(userUuid, url) {
	$.ajax({
		url : "services/user/delete/" + userUuid,
		type : "GET",
		cache : false,
		dataType : "json",
		success : function(data) {
			if (data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '删除成功',
					content : '删除用户成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href = 'services/user/manage';
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