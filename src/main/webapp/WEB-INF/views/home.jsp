<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<!doctype html>
<html>
<head>
<title>Sun drying your clothes</title>	
<%@include file="/WEB-INF/views/common/head.jsp" %>
<!-- Custom styles for this template -->
    <link href="resources/bootstrap-3.3.7-dist/justified-nav.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<%@include file="/WEB-INF/views/common/navbar.jsp" %>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span3">
			<%@include file="/WEB-INF/views/common/sidebar.jsp" %>
		</div>
		<div class="span9">
<!-- 			<div class="container"> -->

      <!-- The justified navigation menu is meant for single line per list item.
           Multiple lines will require custom code not provided by Bootstrap. -->
      <div class="masthead">
        <h3 class="text-muted">Project name</h3>
        <nav>
          <ul class="nav nav-justified">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">Projects</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Downloads</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
        </nav>
      </div>
<!--       </div> -->
		</div>
	</div>
</div>




    
    
<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="resources/jquery.min.js"><\/script>')</script>
    <script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="resources/bootstrap-3.3.7-dist/assets/js/ie10-viewport-bug-workaround.js"></script>    
</body>
</html>
