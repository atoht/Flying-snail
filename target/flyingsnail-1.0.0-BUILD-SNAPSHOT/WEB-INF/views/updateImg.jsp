<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="resources/bootstrap-4.3.1/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="resources/bootstrap-fileinput-master/css/fileinput.min.css" />
<!-- <link type="text/css" rel="stylesheet" href="resources/tapmodo-Jcrop-1902fbc/demos/demo_files/main.css" /> -->
<!-- <link rel="stylesheet" href="resources/tapmodo-Jcrop-1902fbc/demos/demo_files/demos.css" type="text/css" /> -->
<link rel="stylesheet" href="resources/tapmodo-Jcrop-1902fbc/css/jquery.Jcrop.min.css" type="text/css" />
<style type="text/css">
/*   .optdual { position: relative; } */
/*   .optdual .offset { position: absolute; left: 18em; } */
/*   .optlist label { width: 16em; display: block; } */
/*   #dl_links { margin-top: .5em; } */
/* .column { */
/*   float: left; */
/*   width: 33.33%; */
/* } */

</style>
<title>Insert title here</title>
<%@include file="/WEB-INF/views/common/head.jsp" %>
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
		  <div class="main-box" id="boxID" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><spring:message code="image.add.photo"/></div>
<!-- 		  <div class="main-box" id="boxID" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><img class="rounded "  src="resources/images/144eae6a-78fe-49f3-8504-c983bd2b7606.jpg" style="width:100%"></div> -->
		</div>
    </div>
    <div class="col-sm-4 col-md-2 col-lg-2 addCardLeft" >
    	<div class="card" >
		  <div class="addBoxDiv vice-main-box" data="1" data-toggle="modal" data-target="#myModalClothing" onclick="return false;"><spring:message code="image.add.apparel"/></div>
		</div>
    </div>
    <div class="col-sm-4 col-md-2 col-lg-2 addCardAmong" >
    </div>
    <div class="col-sm-4 col-md-2 col-lg-2 addCardRight" >
    </div>
    </div>
    <!-- 模态框 -->
    <%@include file="/WEB-INF/views/dialog/addClothingModalDialog.jsp" %> 
<%-- 	<%@include file="/WEB-INF/views/dialog/addApparelModalDialog.jsp" %>  --%>
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

var countApparel = 0;
var language = '<spring:message code="language"/>';
// var itemFile = $('#file-3');
$(function () {
	$( "#boxID" ).on( "click", function() {
		if(file == null) {
			submitPhoto.attr({ disabled: "disabled" });
		}
		errorMessage = null;
		countApparel = 0;
		img.attr('src','');
	});
	$( "#viceCard" ).on( "click", '.addBoxDiv', function() {
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