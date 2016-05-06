$(function(){
	$('#importBtn').on('click',function() {
		doImport();
	});
})

function doImport() {
	$.ajax({
		url : "services/user/doBatchImport" ,
		type : "POST" ,
		cache : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '导入成功',
					content : '批量导入用户成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				
				setTimeout(function() {
					window.location.href="services/user/manage";
				}, 3000);
			} else {
				$.confirm({
					keyboardEnabled : true,
					title : '导入失败',
					content : data.msg,
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
			}
		} 
	});
}