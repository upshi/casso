$(function(){
	/*导航颜色*/
	$("#navi_role").addClass('active');
	
	/*绑定失焦事件*/
	$('#cName').on('blur',checkCname);
	$('#eName').on('blur',checkEname);
	
	
	/*绑定提交按钮事件*/
	$('#submit').on('click', function(){
		//表单校验
		var pass = validate();
		return pass;
	});
})

//表单校验
function validate() {
	if(checkCname() && checkEname() ) {
		return true;
	} else {
		return false;
	}
}

function checkCname() {
	var flag = false;
	var cName = $('#cName').val();
	var originalCName = $('#cName').attr('originalCName');
	if(cName == null || $.trim(cName) == '') {
		$('#cNameGroup').removeClass('has-success');
		$('#cNameGroup').addClass('has-error');
		$('#cNameGroup .help-block').html('请输入角色中文名');
		return false;
	} 
	if(originalCName != cName) {
		$.ajax({
			url : "services/role/checkRoleCNameUnique/" + cName ,
			type : "GET" ,
			cache : false , 
			async: false,
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#cNameGroup').removeClass('has-success');
					$('#cNameGroup').addClass('has-error');
					$('#cNameGroup .help-block').html('角色中文名已存在');
				} else {
					$('#cNameGroup').removeClass('has-error');
					$('#cNameGroup').addClass('has-success');
					$('#cNameGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	} else {
		return true;
	}
	return flag;
}

function checkEname() {
	var flag = false;
	var eName = $('#eName').val();
	var originalEName = $('#eName').attr('originalEName');
	if(eName == null || $.trim(eName) == '') {
		$('#eNameGroup').removeClass('has-success');
		$('#eNameGroup').addClass('has-error');
		$('#eNameGroup .help-block').html('请输入角色英文名');
		return false;
	} else if($.trim(eName).substring(0,5) != 'ROLE_' || $.trim(eName).length < 6) {
		$('#eNameGroup').removeClass('has-success');
		$('#eNameGroup').addClass('has-error');
		$('#eNameGroup .help-block').html('角色英文名必须以"ROLE_"开头');
		return false;
	} 
	if(originalEName != eName) {
		$.ajax({
			url : "services/role/checkRoleENameUnique/" + eName ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			async: false,
			success : function(data) {
				if(data.result == "exist") {
					$('#eNameGroup').removeClass('has-success');
					$('#eNameGroup').addClass('has-error');
					$('#eNameGroup .help-block').html('角色英文名已存在');
				} else {
					$('#eNameGroup').removeClass('has-error');
					$('#eNameGroup').addClass('has-success');
					$('#eNameGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	} else {
		return true;
	}
	return flag;
}
