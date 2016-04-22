$(function(){
	
	$('#submit').on('click', function(){
		//表单校验
		var pass = validate();
		if(pass) {
			return true;
		}
		return false;
	});
	
	//年龄的select
	var age = $('#age-select').attr('age');
	for(var i=0; i<100; i++) {
		if(i == age) {
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
