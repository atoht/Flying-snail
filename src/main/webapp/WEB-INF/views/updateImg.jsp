<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/views/common/head.jsp" %>
<link type="text/css" rel="stylesheet" href="resources/bootstrap-fileinput-master/css/fileinput.min.css" />
<link rel="stylesheet" href="resources/tapmodo-Jcrop-1902fbc/css/jquery.Jcrop.min.css" type="text/css" />
<style type="text/css">
/*   .optdual { position: relative; } */
/*   .optdual .offset { position: absolute; left: 18em; } */
/*   .optlist label { width: 16em; display: block; } */
/*   #dl_links { margin-top: .5em; } */
.column {
  float: left;
  width: 33.33%;
}

</style>
<title>Insert title here</title>
<style type="text/css">
.main-box{
/* 	width: 100vw;  */
/* border: 1px solid transparent; */
 border:none;
    height: 0px; 
/*     position: relative; */
    padding-bottom: 150%;
/*     background: blue; */
/*     background: pink; */
/* 	overflow: hidden; */
/*  	background: url(resources/images/photo-1542834759-197152b49c42.jpg); */
}
.vice-main-box{
/* 	width: 100vw;  */
    height: 0px; 
/*     position: relative; */
    padding-bottom: 150%;
}
/* .card { */

/*   margin-top: 100px; */
/* } */
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/navbar.jsp" %> 
<div class="container-fluid">
<div class="row ">
<div class="col-sm-3 col-md-3 col-lg-2">
    <hr>
</div>
<div class="col-sm-9 col-md-9 col-lg-10">
    <hr>
    <h1><spring:message code="image.title"/></h1>
    <div class="row " id="viceCard">
    <div class="col-sm-8 col-md-4 col-lg-4 addCardMian">
    	<div class="card">
		  <div class="main-box" id="boxID" data="0" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><spring:message code="image.add.photo"/></div>
		</div>
    </div>
    <div class="col-sm-12 col-md-8 col-lg-6">
    <div class="row ">
	    <div class="column col-sm-2 col-md-4 col-lg-4 addCardLeft " >
	    	<div class="card" >
			  <div class="addBoxDiv vice-main-box" data="1" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><spring:message code="image.add.apparel"/></div>
			</div>
	    </div>
	    <div class="column col-sm-2 col-md-4 col-lg-4 addCardAmong" >
	    </div>
	    <div class="column col-sm-2 col-md-4 col-lg-4 addCardRight" >
	    </div>
    </div>
    </div>
    </div>
    <!-- 模态框 -->
    <%@include file="/WEB-INF/views/dialog/addClothingModalDialog.jsp" %> 
</div>
</div>
</div>
<!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="resources/jquery-3.3.1.min.js"></script>
    <script src="resources/bootstrap-4.3.1/dist/js/bootstrap.min.js"></script>
    <script src="resources/tapmodo-Jcrop-1902fbc/js/jquery.Jcrop.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap-fileinput-master/js/fileinput.min.js"></script>
	<script type="text/javascript" src="resources/bootstrap-fileinput-master/js/locales/zh.js"></script>
	<script type="text/javascript" src="resources/JavaScript-Load-Image-master/js/load-image.all.min.js"></script>
	<script type="text/javascript" src="resources/exif-js-master/exif.js"></script>	
<!-- 	自定义 js-->
	<script type="text/javascript" src="resources/custom-js/modal-dialog.js"></script>	
		    
<script type="text/javascript">

var countApparel;
var language = '<spring:message code="language"/>';
// var itemFile = $('#file-3');
$(function () {
// 	$( "#boxID" ).on( "click", function() {
// 		if(file == null) {
// 			submitPhoto.attr({ disabled: "disabled" });
// 		}
// 		errorMessage = null;
// 		countApparel = 0;
// 		console.info(countApparel);
// 		img.attr('src','');
// 	});
	var userClothingList = ${jsonString};
	$.each(userClothingList,function(n,value) {
		var childrendiv_;
		var parentdiv_ ;
		console.info(userClothingList.length);
		if(value.clothingComponentId == 0) {
			var childrenmaindiv_ = $('<div class="main-box" id="boxID" data="0" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><img class="rounded " src="getInputStreamImg/'+ value.imageName +'/'+ value.imageFormat +'" style="width:100%"></div>');
			itemElementMian.empty();
    		itemElementMian.append(childrenmaindiv_);
		}else if(value.clothingComponentId == 1) {
			itemElementLeft.empty();
			childrendiv_ = $('<div class="addBoxDiv vice-main-box" data="1" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><img class="rounded " src="getInputStreamImg/'+ value.imageName+'/'+ value.imageFormat +'" style="width:100%"></div>');
			itemElementLeft.append(childrendiv_);
			if(userClothingList.length <= 2) {
				parentdiv_ = $('<div class="card mt-3" ><div class= "addBoxDiv vice-main-box" data="2" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><spring:message code="image.add.apparel"/>'+countApparel+'</div></div>');
    			itemElementLeft.append(parentdiv_);
    		}
    	}else if(value.clothingComponentId == 2) {
			childrendiv_ = $('<div class="addBoxDiv vice-main-box mt-3" data="2" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><img class="rounded " src="getInputStreamImg/'+ value.imageName+'/'+ value.imageFormat +'" style="width:100%"></div>');
    		itemElementLeft.append(childrendiv_);
    		if(userClothingList.length <= 3) {
				parentdiv_ = $('<div class="card" ><div class= "addBoxDiv vice-main-box" data="3" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><spring:message code="image.add.apparel"/>'+countApparel+'</div></div>');
    			itemElementLeft.next().append(parentdiv_);
    		}
    	}else if(value.clothingComponentId == 3) {
    		childrendiv_ = $('<div class="addBoxDiv vice-main-box" data="3" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><img class="rounded " src="getInputStreamImg/'+ value.imageName+'/'+ value.imageFormat +'" style="width:100%"></div>');
    		itemElementAmong.append(childrendiv_);
    		if(userClothingList.length <= 4) {
				parentdiv_ = $('<div class="card mt-3" ><div class= "addBoxDiv vice-main-box" data="4" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><spring:message code="image.add.apparel"/>'+countApparel+'</div></div>');
				itemElementAmong.append(parentdiv_);
    		}
    	}else if(value.clothingComponentId == 4) {
    		childrendiv_ = $('<div class="addBoxDiv vice-main-box mt-3" data="4" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><img class="rounded " src="getInputStreamImg/'+ value.imageName+'/'+ value.imageFormat +'" style="width:100%"></div>');
    		itemElementAmong.append(childrendiv_);
    		if(userClothingList.length <= 5) {
				parentdiv_ = $('<div class="card" ><div class= "addBoxDiv vice-main-box" data="5" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><spring:message code="image.add.apparel"/>'+countApparel+'</div></div>');
				itemElementAmong.next().append(parentdiv_);
    		}
    	}else if(value.clothingComponentId == 5) {
    		childrendiv_ = $('<div class="addBoxDiv vice-main-box" data="5" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><img class="rounded " src="getInputStreamImg/'+ value.imageName+'/'+ value.imageFormat +'" style="width:100%"></div>');
    		itemElementRight.append(childrendiv_);
    		if(userClothingList.length <= 6) {
				parentdiv_ = $('<div class="card mt-3" ><div class= "addBoxDiv vice-main-box" data="6" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><spring:message code="image.add.apparel"/>'+countApparel+'</div></div>');
				itemElementRight.append(parentdiv_);
    		}
    	}else if(value.clothingComponentId == 6) {
    		childrendiv_ = $('<div class="addBoxDiv vice-main-box mt-3" data="6" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><img class="rounded " src="getInputStreamImg/'+ value.imageName+'/'+ value.imageFormat +'" style="width:100%"></div>');
    		itemElementRight.append(childrendiv_);
    	}
	});
	
	$( "#viceCard" ).on( "click", '#boxID, .addBoxDiv', function() {
		if(file == null) {
			submitPhoto.attr({ disabled: "disabled" });
		}
		errorMessage = null;
		countApparel = parseInt($(this).attr('data'));
		if(countApparel == 1) {
			childrenpoing = "";
			parentpoing = "mt-3";
		}else if(countApparel == 2) {
			childrenpoing = "mt-3";
			parentpoing = "";
		}else if(countApparel == 3) {
			childrenpoing = "";
			parentpoing = "mt-3";
		}else if(countApparel == 4) {
			childrenpoing = "mt-3";
			parentpoing = "";
		}else if(countApparel == 5) {
			childrenpoing = "";
			parentpoing = "mt-3";
		}else if(countApparel == 6) {
			childrenpoing = "mt-3";
			parentpoing = "";
		}
		console.info(countApparel);
// 		if(countApparel <= 1) {
// 		    var parentdiv = $('<div class="card mt-3" ><div class= "addBoxDiv vice-main-box" data-toggle="modal" data-target="#myModalApparel" onclick="return false;"><spring:message code="image.add.apparel"/>'+countApparel+'</div></div>');
// 			$(this).closest('.addCardLeft').append(parentdiv);
// // 			img.removeAttr('src');
// 			$(this).removeClass("addBoxDiv");
// 		}else if(countApparel == 2) {
// 			var childdiv = $('<div class="card" ><div class= "addBoxDiv vice-main-box" data-toggle="modal" data-target="#myModalApparel" onclick="return false;"><spring:message code="image.add.apparel"/>'+countApparel+'</div></div>');
// 			$(this).closest('.addCardLeft').next().append(childdiv);
// 			$(this).removeClass("addBoxDiv");
// 			countApparel++;
// 		}else if(countApparel <= 4) {
// 			var childdiv = $('<div class="card mt-3" ><div class= "addBoxDiv vice-main-box" data-toggle="modal" data-target="#myModalApparel" onclick="return false;"><spring:message code="image.add.apparel"/>'+countApparel+'</div></div>');
// 			$(this).closest('.addCardRight').append(childdiv);
// 			$(this).removeClass("addBoxDiv");
// 			countApparel++;
// 		}
	});
	
// 	$('#myModal').on('shown.bs.modal', function () {
// 		  $('#myInput').trigger('focus')
// 	});
})
</script>    
</body>
</html>