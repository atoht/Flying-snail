/**
 * 
 */
var tailorInfo = "";
var jcrop_api = null;
var orientationInfo = null;
var allMetaData;
var isWin;
var isMac;
var isUnix;
var isLinux;
var childrenpoing = "";
var parentpoing = "";
var input;
var file = null;
var img;
var preview;
var submitPhoto;
var closePhoto;
var itemElementMian;
var itemElementLeft;
var itemElementAmong;
var itemElementRight;
$(function () {
	input = $('#file-3');
	img = $('#target');
	submitPhoto = $("#submitPhoto");
	closePhoto = $("#closePhoto");
	itemElementMian = $('#viceCard .addCardMian');
	itemElementLeft = $('#viceCard .addCardLeft');
	itemElementAmong = $('#viceCard .addCardAmong');
	itemElementRight = $('#viceCard .addCardRight');
	preview = document.querySelector('#target');
	submitPhoto.on( "click", function() {
		$.ajax({
// 		  dataType: "json",
		  url: "upUserDate",
		  method: "POST",
		  async: true,
		  beforeSend: function () {
			  // 禁用按钮防止重复提交
			  submitPhoto.attr({ disabled: "disabled" });
			  closePhoto.attr({ disabled: "disabled" });
		      input.fileinput('upload');
		  },
// 		  data: formData,
//           processData: false,
//           contentType: false,
		}).done(function( data ) {
// 			$('#file-3').fileinput('upload');
			console.info(data);
		}).fail(function( jqXHR, textStatus ) {
			submitPhoto.removeAttr("disabled");
			closePhoto.removeAttr("disabled");
			console.log( "Request failed: " + textStatus );
		});
	});
		 
	var isWin = (navigator.platform == "Win32") || (navigator.platform == "Windows"); 
	var isMac = (navigator.platform == "Mac68K") || (navigator.platform == "MacPPC") || (navigator.platform == "Macintosh") || (navigator.platform == "MacIntel");
	var isUnix = (navigator.platform == "X11");
	var isLinux = (String(navigator.platform).indexOf("Linux") > -1); 
    var _this = this;
	var fileUp = new FileUpload();
	fileUp.Init();
	 //同步上传返回结果处理
	input.on("filebatchuploadsuccess", function(event, data, previewId, index) {
    	console.info(countApparel);
    	console.info("成功");
    	if (jcrop_api != undefined) {
    		//移除被选中图片
        	jcrop_api.destroy();
        	img.removeAttr("style");
        	img.attr('src','');
        }
    	// 恢复按钮提交
    	submitPhoto.removeAttr("disabled");
    	closePhoto.removeAttr("disabled");
    	var childrenmaindiv = $('<div class="main-box" id="boxID" data="'+countApparel+'" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><img class="rounded " src="getInputStreamImg/'+ data.response.imgName +'/'+ data.response.imgFormat +'" style="width:100%"></div>');
    	var childrendiv = $('<div class="addBoxDiv vice-main-box '+childrenpoing+'" data="'+countApparel+'" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><img class="rounded " src="getInputStreamImg/'+ data.response.imgName +'/'+ data.response.imgFormat +'" style="width:100%"></div>');
    	var parentdiv = $('<div class="card '+parentpoing+'" ><div class= "addBoxDiv vice-main-box" data="'+(countApparel+1)+'" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><spring:message code="image.add.apparel"/>'+countApparel+'</div></div>');
    	var itemElement = null;
    	if(countApparel == 0) {
    		itemElementMian.empty();
    		itemElementMian.append(childrenmaindiv);
    	}else if(countApparel == 1) {
    		itemElementLeft.children().eq(0).replaceWith(childrendiv);
//    		itemElement.children().eq(0).remove();
    		if(itemElementLeft.children().eq(1).length == 0) {
    			itemElementLeft.append(parentdiv);
    		}
    		countApparel = 2;
    	}else if(countApparel == 2) {
    		itemElementLeft.children().eq(1).replaceWith(childrendiv);
    		if(itemElementAmong.children().eq(0).length == 0) {
    			itemElementLeft.next().append(parentdiv);
    		}
    		countApparel = 3;
    	}else if(countApparel == 3) {
    		itemElementAmong.children().eq(0).replaceWith(childrendiv);
    		if(itemElementAmong.children().eq(1).length == 0) {
    			itemElementAmong.append(parentdiv);
    		}
    		countApparel = 4;
    	}else if(countApparel == 4) {
    		itemElementAmong.children().eq(1).replaceWith(childrendiv);
    		if(itemElementRight.children().eq(0).length == 0) {
    			itemElementAmong.next().append(parentdiv);
    		}
    		countApparel = 5;
    	}else if(countApparel == 5) {
    		itemElementRight.children().eq(0).replaceWith(childrendiv);
    		if(itemElementRight.children().eq(1).length == 0) {
    			itemElementRight.append(parentdiv);
    		}
    		countApparel = 6;
    	}else if(countApparel == 6) {
    		itemElementRight.children().eq(1).replaceWith(childrendiv);
    	}
    	$('#myModalClothing').modal('hide');//关闭模态框
    });
 	 //同步上传失败返回结果处理
	input.on('filebatchuploaderror', function(event, data, msg) {
        var form = data.form, files = data.files, extra = data.extra,
            response = data.response, reader = data.reader;
        console.info(msg);
        console.info(data);
        submitPhoto.removeAttr("disabled");
		closePhoto.removeAttr("disabled");
    });
	input.on('fileerror', function(event, data, msg) {
		   console.log(msg);
		});
	input.on('change', function (event) {
		if(errorMessage != null) {
			//移除被选中图片
        	if(jcrop_api != null) jcrop_api.destroy();
        	img.removeAttr("style");
        	img.attr('src','');
        	submitPhoto.attr({ disabled: "disabled" });
			$('#errorMess').html(errorMessage);
			return;
		}else {
			$('#errorMess').html('');
		}
		submitPhoto.removeAttr("disabled");
		file = document.querySelector('input[type=file]').files[0];
      	var imgOrientation = input[0].files[0];
      	try {
	      	EXIF.getData(imgOrientation, function() {
	      		//获取图片方向
	      		orientationInfo = EXIF.getTag(this, "Orientation");
// 	      		$("input[name='orientation']").val(orientationInfo);
	      	 	allMetaData = EXIF.getAllTags(this);
			});
        } catch(err) {
        	return;
        }
    	img.removeAttr("style"); 
     	img.removeClass();
     	img.css( "width", "100%" );
       	img.addClass("rounded img-responsive center-block ");
//       	img.attr('id',"target");
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
            	  keySupport: true,
                  setSelect: [0, 0, 260, 290],
                  handleSize: 10,
                  aspectRatio: 2/3,
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
        	console.info('销毁');
        	jcrop_api.destroy();
        }
	});
	function updateCords(obj) {
        tailorInfo = JSON.stringify({ "PictureWidth": $('.jcrop-holder').css('width'), "PictureHeight": $('.jcrop-holder').css('height'), "CoordinateX": obj.x, "CoordinateY": obj.y, "CoordinateWidth": obj.w, "CoordinateHeight": obj.h });
//         $("input[name='tailorInfo']").val(tailorInfo);
        console.log(tailorInfo);
        
    }
function FileUpload() {
	var objectFile = new Object();
	objectFile.Init = function() {
		input.fileinput({
				uploadUrl:"uploadFile",
		        showUpload : false,
// 		        uploadClass: "btn btn-primary",//设置上传按钮样式
		        showRemove : false,
		        uploadAsync: false,
		        maxFileSize: 10000,//单位为kb，如果为0表示不限制文件大小
		        language : language,
		        allowedPreviewTypes : [ 'image' ],
		        allowedFileExtensions : [ 'jpg', 'jpeg', 'png', 'gif', 'HEIF' ],
			    showCaption: true,
			    showCancel: false,//取消按钮
			    maxFileCount: 1,//允许同时上传的最大文件个数
			    validateInitialCount : true,
			    msgErrorClass: '上传出错',
			    showCaption: false,//是否显示标题
		        showPreview: false,//隐藏预览
		        dropZoneEnabled: true,//是否显示拖拽区域
			    autoReplace: true,//是否自动替换当前图片
			    enctype:'form-data',
			    uploadExtraData: function () {
                    return { "tailorInfo": tailorInfo
                    		, "orientation": orientationInfo
                    		, "countApparel": countApparel
                    		}
                }
		});
	}
	return objectFile;
}
});