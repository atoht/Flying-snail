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
<%-- <%@include file="/WEB-INF/views/common/head.jsp" %> --%>


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

  <img src="resources/images/photo-1542834759-197152b49c42.jpg" id="target" class="rounded img-responsive center-block " style="width:100%; image-orientation:45deg;"/>
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
      <input id="file-3" type="file" name="imgFile" data-ref="imgUrl" multiple />
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
<!--     <script>window.jQuery || document.write('<script src="resources/jquery.min.js"><\/script>')</script> -->
    <script src="resources/bootstrap-4.3.1/dist/js/bootstrap.min.js"></script>
<!--     <script src="resources/template-web.js"></script> -->
    <script src="resources/tapmodo-Jcrop-1902fbc/js/jquery.Jcrop.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap-fileinput-master/js/fileinput.min.js"></script>
	<script type="text/javascript" src="resources/bootstrap-fileinput-master/js/locales/zh.js"></script>
	<script type="text/javascript" src="resources/piexifjs-master/piexif.js"></script>
	<script type="text/javascript" src="resources/exif-js-master/exif.js"></script>
<!-- 	<script src="resources/bootstrap-fileinput-master/themes/fas/theme.min.js" type="text/javascript"></script> -->

<script type="text/javascript">
var tailorInfo = "";
var jcrop_api = null;
var orientationInfo = null;
$(function () {
	//判断竖横屏幕
// 	window.addEventListener("orientationchange", function() {
// 	    // Announce the new orientation number
// // 	    alert(window.orientation);
// 	    orientation = window.orientation;
// 	}, false);
// 		console.info(orientation);
// 	if('0' == orientation) {
// 		console.info(orientation +"00000000000000000000000");
// // 		$('.jcrop-holder').css( "transform", "rotate(270deg)" );
// 	}
	
    var _this = this;
	var fileUp = new FileUpload();
	fileUp.Init();
	var input = $('#file-3');
	 //同步上传返回结果处理
    $("#file-3").on("filepreupload", function(event, data, previewId, index) {

//         $('#cut-img').attr('src', data.response.url);
    });
    $("#file-3").on('change', function (event, data, previewId, index) {
        var img = $('#target');
        var val = true;
        if (input[0].files && input[0].files[0]) {
//             var temp = reader.readAsBinaryString(input[0].files[0]);
//             var temp2 = new BinaryFile(temp);
// 			console.info(temp);
// 			console.info(temp2);
// 			console.info(EXIF.readFromBinaryFile(temp));
//            alert(EXIF.readFromBinaryFile(temp));
           	var imgOrientation = input[0].files[0];
           	EXIF.getData(imgOrientation, function() {
            	//获取图片方向
           	   var orientation = EXIF.getTag(this, "Orientation");
           		orientationInfo = orientation;
// 	           	PixelWidth = EXIF.getTag(this, "PixelXDimension");
// 	           	PixelHeight = EXIF.getTag(this, "PixelYDimension");
           	 var allMetaData = EXIF.getAllTags(this);
           	 console.info(allMetaData);
	            var reader = new FileReader();
            	reader.readAsDataURL(input[0].files[0]);
	            reader.onload = function (e) {
					            	img.removeAttr('src');
		                img.removeAttr("style"); 
		             	img.removeClass();
// 	            	getAfterEditedImg(this.result, orientation, function (data) {
		             	img.css( "width", "100%" );
		             	img.addClass("rounded img-responsive center-block ");
		                img.attr('src', this.result);
// 	                });
		                img.Jcrop({
		                    setSelect: [0, 0, 260, 290],
		                    handleSize: 10,
		                    aspectRatio: 9/16,//选框宽高比
		                    bgFade: false,
		                    createDragbars:['n','s','e','w'],
		                    createBorders:['n','s','e','w'],
		                    drawBorders: true,
		                    trackDocument: true,
		                    bgColor: 'black',
		                    bgOpacity: 0.3,
		                    onSelect: updateCords
		                }, function () {
		//                     jcorp = this;
		                    jcrop_api = this;
		                 	jcrop_api.animateTo([0,0,400,300]);
		//                  	jcrop_api.setImage(e.target.result);
		// 					img.attr('src', e.target.result);
		                 	console.log(jcrop_api.tellSelect());
		                 	
		                });
	            };
           	});
//             console.log(Jcrop.tellSelect());
            if (jcrop_api != undefined) {
            	jcrop_api.destroy();
            }
        }	
	});
	function updateCords(obj) {
        tailorInfo = JSON.stringify({ "PictureWidth": $('.jcrop-holder').css('width'), "PictureHeight": $('.jcrop-holder').css('height'), "CoordinateX": obj.x, "CoordinateY": obj.y, "CoordinateWidth": obj.w, "CoordinateHeight": obj.h });
        console.log(tailorInfo);
        
    }
	
	function getAfterEditedImg(img, orientation, next) {
		
		var image = new Image();
        image.onload = function () {
        	var drawWidth;
			var drawHeight;
			var PixelWidth = this.naturalWidth;
			var PixelHeight = this.naturalHeight;;
        	var degree;
        	var canvas = document.createElement('canvas');
        	var context = canvas.getContext("2d");
        	
        	switch(orientation){
            //iphone横屏拍摄，此时home键在左侧
             case 3:
                 degree = 180;
                 drawWidth = -PixelWidth;
                 drawHeight = -PixelHeight;
                 break;
             //iphone竖屏拍摄，此时home键在下方(正常拿手机的方向)
             case 6:
            	 canvas.width = PixelHeight;
                 canvas.height = PixelWidth;
                 degree = 90;
                 drawWidth = PixelWidth;
                 drawHeight = -PixelHeight;
                 break;
             //iphone竖屏拍摄，此时home键在上方
             case 8:
                 canvas.width = PixelHeight;
                 canvas.height = PixelWidth; 
                 degree = 270;
                 drawWidth= -PixelWidth;
                 drawHeight = PixelHeight;
                 break;
         	}
         	//使用canvas旋转校正
          	context.rotate(degree*Math.PI/180);
        	context.drawImage(this,0,0,drawWidth,drawHeight);
	        next(canvas.toDataURL("image/png"));
        }
        image.src = img;
	}

	// This function is bound to the onRelease handler...
	// In certain circumstances (such as if you set minSize
	// and aspectRatio together), you can inadvertently lose
	// the selection. This callback re-enables creating selections
	// in such a case. Although the need to do this is based on a
	// buggy behavior, it's recommended that you in some way trap
	// the onRelease callback if you use allowSelect: false
	function releaseCheck()
	{
	  jcrop_api.setOptions({ allowSelect: true });
	  $('#can_click').attr('checked',false);
	};

	// Attach interface buttons
	// This may appear to be a lot of code but it's simple stuff
	$('#setSelect').click(function(e) {
	  // Sets a random selection
	  jcrop_api.setSelect(getRandom());
	});
	$('#animateTo').click(function(e) {
	  // Animates to a random selection
	  jcrop_api.animateTo(getRandom());
	});
	$('#release').click(function(e) {
	  // Release method clears the selection
	  jcrop_api.release();
	});
	$('#disable').click(function(e) {
	  // Disable Jcrop instance
	  jcrop_api.disable();
	  // Update the interface to reflect disabled state
	  $('#enable').show();
	  $('.requiresjcrop').hide();
	});
	$('#enable').click(function(e) {
	  // Re-enable Jcrop instance
	  jcrop_api.enable();
	  // Update the interface to reflect enabled state
	  $('#enable').hide();
	  $('.requiresjcrop').show();
	});
	$('#rehook').click(function(e) {
	  // This button is visible when Jcrop has been destroyed
	  // It performs the re-attachment and updates the UI
	  $('#rehook,#enable').hide();
	  initJcrop();
	  $('#unhook,.requiresjcrop').show();
	  return false;
	});
	$('#unhook').click(function(e) {
	  // Destroy Jcrop widget, restore original state
	  jcrop_api.destroy();
	  // Update the interface to reflect un-attached state
	  $('#unhook,#enable,.requiresjcrop').hide();
	  $('#rehook').show();
	  return false;
	});


	// The checkboxes simply set options based on it's checked value
	// Options are changed by passing a new options object

	// Also, to prevent strange behavior, they are initially checked
	// This matches the default initial state of Jcrop 

	$('#can_click').change(function(e) {
	  jcrop_api.setOptions({ allowSelect: !!this.checked });
	  jcrop_api.focus();
	});
	$('#can_move').change(function(e) {
	  jcrop_api.setOptions({ allowMove: !!this.checked });
	  jcrop_api.focus();
	});
	$('#can_size').change(function(e) {
	  jcrop_api.setOptions({ allowResize: !!this.checked });
	  jcrop_api.focus();
	});
	$('#ar_lock').change(function(e) {
	  jcrop_api.setOptions(this.checked?
	    { aspectRatio: 9/16 }: { aspectRatio: 0 });
	  jcrop_api.focus();
	});
	$('#size_lock').change(function(e) {
	  jcrop_api.setOptions(this.checked? {
	    minSize: [ 80, 80 ],
	    maxSize: [ 350, 350 ]
	  }: {
	    minSize: [ 0, 0 ],
	    maxSize: [ 0, 0 ]
	  });
	  jcrop_api.focus();
	});
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
		        allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
		        maxFileSize : 10000,
			    showCaption: true,
			    autoOrientImage: true,
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

