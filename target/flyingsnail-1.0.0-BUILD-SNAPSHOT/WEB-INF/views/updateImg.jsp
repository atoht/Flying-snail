<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="resources/bootstrap-fileinput-master/css/fileinput.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
<%@include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/views/common/navbar.jsp" %> 
<div class="container-fluid">
<div class="row col-md-10 col-md-offset-1">
<form enctype="multipart/form-data">
    <hr>
    <div class="form-group">
        <div class="file-loading">
            <label>Preview File Icon</label>
            <input id="file-3" type="file" name="imgFile" data-ref="imgUrl" multiple>
            <input type="hidden" id="imgUrl" name="imgUrl">
        </div>
    </div>
</form>
</div>
</div>
			    
<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="resources/jquery.min.js"><\/script>')</script>
    <script src="resources/bootstrap-4.3.1/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap-fileinput-master/js/fileinput.min.js"></script>
	<script type="text/javascript" src="resources/bootstrap-fileinput-master/js/locales/zh.js"></script>
	<script src="resources/bootstrap-fileinput-master/themes/fas/theme.min.js" type="text/javascript"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="resources/bootstrap-3.3.7-dist/assets/js/ie10-viewport-bug-workaround.js"></script>
    
<script type="text/javascript">

$("#file-3").fileinput({
		uploadUrl:"uploadFile",
        showUpload : true,
        uploadClass: "btn btn-primary",//设置上传按钮样式
        showRemove : false,
        language : '<spring:message code="language"/>',
//         maxImageHeight:67,
        allowedPreviewTypes : [ 'image' ],
        allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
        maxFileSize : 10000,
	    theme: 'fas',
	    showCaption: true,
	    dropZoneEnabled : true,//`预览
	    validateInitialCount : true,
// 	    previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
// 	    browseClass: "btn btn-primary btn-lg",
// 	    fileType: "any",
// 	    overwriteInitial: false,
// 	    initialPreviewAsData: true,
	    maxFileCount:10,
	    enctype:'multipart/form-data',
});


//异步上传返回结果处理
    $('#file-3').on('fileerror', function(event, data, msg) {
        console.log("fileerror");
        console.log(data);
    });
    //异步上传返回结果处理
    $("#file-3").on("fileuploaded", function(event, data, previewId, index) {
        console.log("fileuploaded");
        $('#' + previewId).attr('fileid', data.response.url);
    });
    //上传前
    $('#file-3').on('filepreupload', function(event, data, previewId, index) {
        console.log("filepreupload");
    });
    $('#file-3').on('filesuccessremove', function(event, id) {
    if(!confirm('<spring:message code="deleteImg.mess"/>')){  
                    return false;  
    } 
	var imgUrl = $('#' + id).attr('fileid');
                console.log("--------------------");
                console.log($('#' + id).attr('fileid'));
       $.ajax({
		    type: "POST",
		    url: "deleteImg",
		    data: {imgURL: imgUrl},
		    dataType: "json",
		    success: function(data){ }
		});
});
</script>
</body>
</html>