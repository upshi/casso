$(function() {
	$('#resetPwd').on('click', function(){
		$('#resetPwdModal').modal();
	});
	
	$('#resetPwdConfirm').on('click', function(){
		if(checkPassword()) {
			handleBeforeSubmit();
			return true;
		}
		return false;
	});
})

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#password');
	$password.val( $.base64('encode', $password.val()) );
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

function deleteUser(userUuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除用户',
		content : '此操作会删除该用户的所有信息，而且操作不可撤销，确定删除该用户？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			ajaxDelete(userUuid);
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