<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet">
<%@include file="/WEB-INF/views/common/head.jsp" %>
<link href="resources/bootstrap-4.3.1/dist/dashboard.css" rel="stylesheet">
<style type="text/css">
/* .test { */
/* width:300px; */
/* height:400px; */
/* -moz-box-shadow: 10px 10px 5px #888888; /* 老的 Firefox */ */
/* box-shadow: 10px 10px 5px #888888; */
/* } */
* {
  box-sizing: border-box;
}

body {
  background-color: #f1f1f1;
  padding: 20px;
  font-family: Arial;
}

/* Center website */
.main {
  max-width: 1000px;
  margin: auto;
}

h1 {
  font-size: 50px;
  word-break: break-all;
}

.row {
  margin: 10px -16px;
}

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
.content {
  background-color: white;
  padding: 10px;
}

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
<!-- MAIN (Center website) -->
<div class="main">

<h1>MYLOGO.COM</h1>
<hr>

<h2>PORTFOLIO</h2>

<div id="myBtnContainer" class="myBtnContainer">
  <button class="btn active" onclick="filterSelection('all')"> Show all</button>
  <button class="btn" onclick="filterSelection('nature')"> Nature</button>
  <button class="btn" onclick="filterSelection('cars')"> Cars</button>
  <button class="btn" onclick="filterSelection('people')"> People</button>
</div>
		<div class="row ">                                     
	    <div class="column nature">
    <div class="content">
      <img src="resources/w3images/mountains.jpg" alt="Mountains" style="width:100%">
      <h4>Mountains</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  <div class="column nature">
    <div class="content">
      <img src="resources/w3images/lights.jpg" alt="Lights" style="width:100%">
      <h4>Lights</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  
   <div class="column cars">
    <div class="content">
      <img src="resources/w3images/cars1.jpg" alt="Car" style="width:100%">
      <h4>Retro</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  <div class="column cars">
    <div class="content">
    <img src="resources/w3images/cars2.jpg" alt="Car" style="width:100%">
      <h4>Fast</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
	    </div>
	    </div>



    
    
<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="resources/jquery.min.js"><\/script>')</script>
    <script src="resources/bootstrap-4.3.1/dist/js/bootstrap.min.js"></script>
<!--     <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script> -->
<!--     <script src="resources/bootstrap-table-master/dist/bootstrap-table.min.js"></script> -->
<!--     <script src="resources/bootstrap-table-master/dist/locale/bootstrap-table-zh-CN.min.js"></script> -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <script src="resources/bootstrap-3.3.7-dist/assets/js/ie10-viewport-bug-workaround.js"></script> -->
    
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
//     var current = document.getElementsByClassName("active"); 
    console.info(current[0].className);
    current[0].className = current[0].className.replace(" active", "");
//     console.info(current[0].className);
    this.className += " active";
    console.info("111111111111111111111111111");
    console.info(this.className);
  });
}
</script>
</body>
</html>