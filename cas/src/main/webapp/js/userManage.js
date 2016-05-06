$(function() {
	$('#batchImportBtn').on('click', function(){
		$('#batchImportModal').modal();
		return false;
	});
	
	$('#batchImportConfirm').on('click', function(){
		return checkFile();
	});
	
	//上传文件组件
	$("#input-id").fileinput({
		language : 'zh', 
		allowedFileExtensions : [ 'xls' ] ,
		overwriteInitial : false,
		maxFileSize : 100,
		maxFilesCount : 1,
		showRemove : false ,
		showPreview : false ,
		showUpload : false ,
		slugCallback : function(filename) {
			return filename.replace('(', '_').replace(']', '_');
		}
	});
})

function deleteUser(userUuid, url) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除用户',
		content : '此操作会删除该用户的所有信息，而且操作不可撤销，确定删除该用户？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			ajaxDelete(userUuid,url);
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
				window.location.href = url;
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

function checkFile() {
	if($('#input-id').fileinput('getFileStack').length == 0){
		$('#fileGroup').removeClass('has-success');
		$('#fileGroup').addClass('has-error');
		$('#fileGroup .help-block').html('请选择Excel文件');
		return false;
	} else {
		$('#fileGroup').removeClass('has-error');
		$('#fileGroup').addClass('has-success');
		$('#fileGroup .help-block').html('');
		return true;
	}
}