$(function(){
	
	//上传图片组件
	$("#input-id").fileinput({
		language : 'zh', 
		allowedFileExtensions : [ 'jpg', 'png', 'jpeg' ] ,
		overwriteInitial : false,
		maxFileSize : 100,
		maxFilesCount : 1,
		showRemove : false ,
		showUpload : false ,
		slugCallback : function(filename) {
			return filename.replace('(', '_').replace(']', '_');
		}
	});
})





