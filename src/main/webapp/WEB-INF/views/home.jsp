<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<!doctype html>
<html>
<head>
<title>Sun drying your clothes</title>	
<link href="resources/bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet">
<%@include file="/WEB-INF/views/common/head.jsp" %>
<link href="resources/bootstrap-4.3.1/dist/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<!--     <link href="resources/bootstrap-3.3.7-dist/justified-nav.css" rel="stylesheet"> -->
<style type="text/css">
.test { 
/* width:300px; */
/* height:400px; */
-moz-box-shadow: 10px 10px 5px #888888; /* 老的 Firefox */
box-shadow: 10px 10px 5px #888888;
 }
* {
  box-sizing: border-box;
}

/* body { */
/*   background-color: #f1f1f1; */
/*   padding: 20px; */
/*   font-family: Arial; */
/* } */

/* Center website */
/* .main { */
/*   max-width: 1000px; */
/*   margin: auto; */
/* } */

/* h1 { */
/*   font-size: 50px; */
/*   word-break: break-all; */
/* } */

/* .row { */
/*   margin: 10px -16px; */
/* } */

/* Add padding BETWEEN each column */
 .row, 
 .row > .column { 
   padding: 8px; 
 }

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  display: none; /* Hide all elements by default */
}

/* Clear floats after rows */ 
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Content */
/* .content { */
/*   background-color: white; */
/*   padding: 10px; */
/* } */

/* The "show" class is added to the filtered elements */
.show {
  display: block;
}

/* Style the buttons */
.myBtnContainer>.btn {
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: white;
  cursor: pointer;
}

.myBtnContainer>.btn:hover {
  background-color: #ddd;
}

.myBtnContainer>.btn.active {
  background-color: #666;
  color: white;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/navbar.jsp" %> 
<div class="container-fluid">
	<div class="row ">
	<%@include file="/WEB-INF/views/common/sidebar.jsp" %> 
		<div class="col-sm-8 col-md-9 col-lg-11">
	<!-- MAIN (Center website) -->
<div class="main">

<h1>MYLOGO.COM</h1>
<hr>

<h2>PORTFOLIO</h2>

<!--     -->
<div id="myBtnContainer" class="myBtnContainer " >
  <button class="btn active " onclick="filterSelection('all')"> Show all</button>
  <button class="btn " onclick="filterSelection('nature')"> Nature</button>
  <button class="btn" onclick="filterSelection('cars')"> Cars</button>
  <button class="btn" onclick="filterSelection('people')"> People</button>
</div>
		<div class="row ">                                     
		<c:forEach items="${userInfo.listImgPath }" var="vr">
	        <div id="viewport" class="column nature"  >
	            <img src="getInputStreamImg/${vr}/null" class="test rounded img-responsive center-block popover-options" 
	            data-toggle="popover"  title="<h2>Title</h2>"
	             style="width:100%"  >
	            <br>
	            <br>
	            <h4>Mountains</h4>
			      <p>Lorem ipsum dolor..</p>
			  </div>                
		</c:forEach>
	    </div>
	    </div>
		</div>
	</div>
</div>



    
    
<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="resources/jquery.min.js"><\/script>')</script>
<!--     <script src="resources/bootstrap-4.3.1/dist/js/tooltip.js"></script> -->
    <script src="resources/bootstrap-4.3.1/dist/js/popover.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script> -->
    <script src="resources/bootstrap-4.3.1/dist/js/bootstrap.min.js"></script>
<!--     <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script> -->
    <script src="resources/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
    <script src="resources/bootstrap-table-master/dist/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <script src="resources/bootstrap-3.3.7-dist/assets/js/ie10-viewport-bug-workaround.js"></script> -->
    
<script type="text/javascript">
feather.replace()
</script>
<script type="text/javascript">
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}


// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementById('myBtnContainer').getElementsByClassName('active');
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}


</script>
 <script type="text/javascript">
$(function () { 
	$(".popover-options").popover({
		html:true,
        content:"<img src='resources/images/zimages (5).jpg'>",
        viewport: {selector: '#viewport', padding: 0} 
	});
	$('.popover-options').on('shown.bs.popover', function () {
		console.info(this.$element);
		})
// 	$("#Position").click(function(){getPosition()});
 });
 function getPosition() {
	 
	 var element = this.$element; //如果没有传入参数，则以$element（触发tooltip事件的元素）为准
console.info(this.$element);
	 var el = element[0];
	 var isBody = el.tagName == 'BODY';

	 var elRect = el.getBoundingClientRect();
	 if (elRect.width == null) {
	 // width and height are missing in IE8, so compute them manually; see https://github.com/twbs/bootstrap/issues/14093
	 elRect = $.extend({}, elRect, { width: elRect.right - elRect.left, height: elRect.bottom - elRect.top });
	 }
	 var elOffset = isBody ? { top: 0, left: 0 } : $element.offset();
	 var scroll = { scroll: isBody ? document.documentElement.scrollTop || document.body.scrollTop : $element.scrollTop() };
	 var outerDims = isBody ? { width: $(window).width(), height: $(window).height() } : null;

// 	return $.extend({}, elRect, scroll, outerDims, elOffset)
	console.info($.extend({}, elRect, scroll, outerDims, elOffset));
 }
 
 </script>
</body>
</html>
