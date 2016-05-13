$(function(){
	$('#submit').on('click', function(){
		var selected = $('#multi_select option:selected');
		if(selected.length > 0) {
			submit();
		} else {
			$.confirm({
				keyboardEnabled : true,
				title : '提醒',
				content : '请选择用户！',
				confirmButtonClass : 'btn-info',
				cancelButtonClass : 'btn-danger',
				autoClose : 'confirm|3000'
			});
		}
		return false;
	});
});

function submit() {
	$.ajax({
		url : "services/role/allocateUser" ,
		type : "POST" ,
		cache : false , 
		data : $('#userForm').serialize() ,
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '操作成功',
					content : '分配用户成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				setTimeout(function() {
					window.location.reload(true);
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
