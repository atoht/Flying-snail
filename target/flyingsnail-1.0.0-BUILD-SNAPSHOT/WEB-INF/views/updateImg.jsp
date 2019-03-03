<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="resources/tapmodo-Jcrop-1902fbc/css/jquery.Jcrop.min.css" />
<link type="text/css" rel="stylesheet" href="resources/bootstrap-fileinput-master/css/fileinput.min.css" />
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous"> -->
<%@include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/views/common/navbar.jsp" %> 
<div class="container-fluid">
<!-- <div class="row "> -->
<form enctype="multipart/form-data">
    <hr>
    <div class="form-group">
<!--         <div class="file-loading"> -->
        	<div class="col-md-6" style="width: 300px;">
                        <img id="cut-img" class="thumbnail" style="width: 300px;height:300px;" src="resources/images/zimages (5).jpg"><br />
                    </div>
                    <div class="col-md-5">
                        <input id="file-3" type="file" name="imgFile" data-ref="imgUrl" multiple class="file-loading" />
                        </div>
<!--             <input id="file-3" type="file" name="imgFile" data-ref="imgUrl" multiple> -->
            <input type="hidden" id="imgUrl" name="imgUrl">
<!--         </div> -->
    </div>
</form>
<!-- </div> -->
</div>
			    
<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="resources/jquery-3.3.1.min.js"></script>
<!--     <script>window.jQuery || document.write('<script src="resources/jquery.min.js"><\/script>')</script> -->
    <script src="resources/bootstrap-4.3.1/dist/js/bootstrap.min.js"></script>
<!--     <script src="resources/template-web.js"></script> -->
    <script src="resources/tapmodo-Jcrop-1902fbc/js/jquery.Jcrop.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap-fileinput-master/js/fileinput.min.js"></script>
	<script type="text/javascript" src="resources/bootstrap-fileinput-master/js/locales/zh.js"></script>
<!-- 	<script src="resources/bootstrap-fileinput-master/themes/fas/theme.min.js" type="text/javascript"></script> -->
	
<script type="text/javascript">

</script>    
<script type="text/javascript">
var tailorInfo = "";
$(function () { 
	var jcorp = null;
    var _this = this;
	var fileUp = new FileUpload();
	fileUp.Init();
	var input = $('#file-3');
	 //同步上传返回结果处理
    $("#file-3").on("filepreupload", function(event, data, previewId, index) {

//         $('#cut-img').attr('src', data.response.url);
    });
	$("#file-3").on('change', function (event, data, previewId, index) {
        var img = $('#cut-img');
        if (input[0].files && input[0].files[0]) {
            var reader = new FileReader();
            reader.readAsDataURL(input[0].files[0]);
            reader.onload = function (e) {
                img.removeAttr('src');
                img.attr('src', e.target.result);
                img.Jcrop({
                    setSelect: [0, 0, 260, 290],
                    handleSize: 10,
                    aspectRatio: 1,//选框宽高比
                    bgFade: false,
                    bgColor: 'black',
                    bgOpacity: 0.3,
                    onSelect: updateCords
                }, function () {
                    jcorp = this;
                });
            };
            console.log(Jcrop.tellSelect());
            if (jcorp != undefined) {
                jcorp.destroy();
            }
        }	
	});
	function updateCords(obj) {
        tailorInfo = JSON.stringify({ "PictureWidth": $('.jcrop-holder').css('width'), "PictureHeight": $('.jcrop-holder').css('height'), "CoordinateX": obj.x, "CoordinateY": obj.y, "CoordinateWidth": obj.w, "CoordinateHeight": obj.h });
        console.log(tailorInfo);
        
    }
});

function FileUpload() {
	var objectFile = new Object();
	objectFile.Init = function() {
		$("#file-3").fileinput({
				uploadUrl:"uploadFile",
		        showUpload : true,
		        uploadClass: "btn btn-primary",//设置上传按钮样式
		        showRemove : false,
		        uploadAsync: false,
		        language : '<spring:message code="language"/>',
		        allowedPreviewTypes : [ 'image' ],
		        allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
		        maxFileSize : 10000,
			    showCaption: true,
			    dropZoneEnabled : true,//`预览
			    validateInitialCount : true,
			    showCaption: false,//是否显示标题
		        showPreview: false,//隐藏预览
		        dropZoneEnabled: false,//是否显示拖拽区域
			    maxFileCount:1,
			    enctype:'multipart/form-data',
			    uploadExtraData: function () {
                    return { "tailorInfo": tailorInfo }
                }
		});
	}
	return objectFile;
}


//异步上传返回结果处理
    $('#file-3').on('fileerror', function(event, data, msg) {
        console.log("fileerror");
        console.log(data);
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