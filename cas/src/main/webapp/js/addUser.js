$(function(){
	
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
	return true;
	/*
	if(checkUsername() && checkPassword() && checkName() ) {
		return true;
	} else {
		return false;
	}
	*/
}

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#password');
	$password.val( $.base64('encode', $password.val()) );
}