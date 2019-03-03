<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="resources/bootstrap-4.3.1/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="resources/bootstrap-fileinput-master/css/fileinput.min.css" />


<link rel="stylesheet" href="resources/tapmodo-Jcrop-1902fbc/demos/demo_files/main.css" type="text/css" />
<link rel="stylesheet" href="resources/tapmodo-Jcrop-1902fbc/demos/demo_files/demos.css" type="text/css" />
<link rel="stylesheet" href="resources/tapmodo-Jcrop-1902fbc/css/jquery.Jcrop.min.css" type="text/css" />
<style type="text/css">
  .optdual { position: relative; }
  .optdual .offset { position: absolute; left: 18em; }
  .optlist label { width: 16em; display: block; }
  #dl_links { margin-top: .5em; }
.column {
  float: left;
  width: 33.33%;
}
.rotate-6 {
 /*transform: rotate(90deg);原代码*/
 transform: rotate(270deg);
}

</style>

</head>
<body>

<div class="container">
<!-- <div class="row"> -->
<!-- <div class="span12"> -->
<div class="jc-demo-box">
<!-- <div class="row"> -->
<div class="page-header">
<h1><spring:message code="image.title"/></h1>
</div>
<!-- </div> -->
<div class="row">
<div class="col-md-4">

  <img src="resources/images/photo-1542834759-197152b49c42.jpg" id="target" class="rounded img-responsive center-block " style="width:100%; "/>
</div>
<div class="col-md-6">
  <div style="margin: .8em 0 .5em;">
    <span class="requiresjcrop">
      <button id="setSelect" class="btn btn-mini">setSelect</button>
      <button id="animateTo" class="btn btn-mini">animateTo</button>
      <button id="release" class="btn btn-mini">Release</button>
      <button id="disable" class="btn btn-mini">Disable</button>
    </span>
    <button id="enable" class="btn btn-mini" style="display:none;">Re-Enable</button>
    <button id="unhook" class="btn btn-mini">Destroy!</button>
    <button id="rehook" class="btn btn-mini" style="display:none;">Attach Jcrop</button>
  </div>

  <fieldset class="optdual requiresjcrop">
    <legend>Option Toggles</legend>
    <div class="optlist offset">
      <label><input type="checkbox" id="ar_lock" />Aspect ratio</label>
      <label><input type="checkbox" id="size_lock" />minSize/maxSize setting</label>
    </div>
    <div class="optlist">
      <label><input type="checkbox" id="can_click" />Allow new selections</label>
      <label><input type="checkbox" id="can_move" />Selection can be moved</label>
      <label><input type="checkbox" id="can_size" />Resizable selection</label>
    </div>
  </fieldset>

  <fieldset class="requiresjcrop" style="margin: .5em 0;">
    <legend>Change Image</legend>
<%--     <form enctype="multipart/form-data" method="POST"> --%>
      <input id="file-3" type="file" name="imgFile" multiple />
<%--       </form> --%>
  </fieldset>
</div>





<!-- </div> -->
</div>
</div>
<!-- </div> -->
</div>

<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="resources/jquery-3.3.1.min.js"></script>
    <script src="resources/bootstrap-4.3.1/dist/js/bootstrap.min.js"></script>
    <script src="resources/tapmodo-Jcrop-1902fbc/js/jquery.Jcrop.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap-fileinput-master/js/fileinput.min.js"></script>
	<script type="text/javascript" src="resources/bootstrap-fileinput-master/js/locales/zh.js"></script>
	<script type="text/javascript" src="resources/JavaScript-Load-Image-master/js/load-image.all.min.js"></script>
	<script type="text/javascript" src="resources/exif-js-master/exif.js"></script>

<script type="text/javascript">
var tailorInfo = "";
var jcrop_api = null;
var orientationInfo = null;
var allMetaData;
var isWin;
var isMac;
var isUnix;
var isLinux;
$(function () {
	var isWin = (navigator.platform == "Win32") || (navigator.platform == "Windows"); 
	var isMac = (navigator.platform == "Mac68K") || (navigator.platform == "MacPPC") || (navigator.platform == "Macintosh") || (navigator.platform == "MacIntel");
	var isUnix = (navigator.platform == "X11");
	var isLinux = (String(navigator.platform).indexOf("Linux") > -1); 
    var _this = this;
	var fileUp = new FileUpload();
	fileUp.Init();
	var input = $('#file-3');
	 //同步上传返回结果处理
    $("#file-3").on("filepreupload", function(event, data, previewId, index) {

//         $('#cut-img').attr('src', data.response.url);
    });
    $("#file-3").on('change', function (event) {
   		console.info(event);
      	var imgOrientation = input[0].files[0];
      	try {
	      	EXIF.getData(imgOrientation, function() {
	      		//获取图片方向
	      		orientationInfo = EXIF.getTag(this, "Orientation");
	      	 	allMetaData = EXIF.getAllTags(this);
			});
        } catch(err) {
        	return;
        }
   	    var preview = document.querySelector('#target');
  	    var file = document.querySelector('input[type=file]').files[0];
        var img = $('#target');
    	img.removeAttr("style"); 
     	img.removeClass();
     	img.css( "width", "100%" );
       	img.addClass("rounded img-responsive center-block ");
         var reader = new FileReader();
         reader.onload = function (e) {
         	if( isWin || isMac || isUnix || isLinux) {
	    		loadImage(
  	  	        reader.result,
  	  	        function (img) {
  	  	          preview.src = img.toDataURL("image/jpeg");
  	  	        },
  	  	        {
  	  	            orientation: true,
  	  	            maxHeight: 300,
  	  	            canvas: true
  	  	        }
 	  	    	);
			img.removeAttr('src');
            	}else {
         		img.attr('src', this.result);
         	}
              img.Jcrop({
                  setSelect: [0, 0, 260, 290],
                  handleSize: 10,
                  aspectRatio: 9/16,
                  bgFade: false,
                  createDragbars:['n','s','e','w'],
                  createBorders:['n','s','e','w'],
                  drawBorders: true,
                  trackDocument: true,
                  bgColor: 'black',
                  bgOpacity: 0.3,
                  onSelect: updateCords
              }, function () {
                  jcrop_api = this;
               	jcrop_api.animateTo([0,0,400,300]);
               	console.log(jcrop_api.tellSelect());
               	
              });
         };
 	  	  if (file) {
 	  	    reader.readAsDataURL(file);
 	  	  }
        if (jcrop_api != undefined) {
        	jcrop_api.destroy();
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
// 		        uploadClass: "btn btn-primary",//设置上传按钮样式
		        showRemove : false,
		        uploadAsync: false,
		        language : '<spring:message code="language"/>',
		        allowedPreviewTypes : [ 'image' ],
		        allowedFileExtensions : [ 'jpg', 'jpeg', 'png', 'gif', 'HEIF' ],
		        maxFileSize : 10000,
			    showCaption: true,
			    showCancel: false,//取消按钮
			    dropZoneEnabled : true,//`预览
			    browseOnZoneClick: true,
			    validateInitialCount : true,
			    showCaption: false,//是否显示标题
		        showPreview: false,//隐藏预览
		        dropZoneEnabled: true,//是否显示拖拽区域
			    maxFileCount:1,
			    enctype:'multipart/form-data',
			    uploadExtraData: function () {
                    return { "tailorInfo": tailorInfo
                    		, "orientation": orientationInfo}
                }
		});
	}
	return objectFile;
}

</script>
</body>
</html>

