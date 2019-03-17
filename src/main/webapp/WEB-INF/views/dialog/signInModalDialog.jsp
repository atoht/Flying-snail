<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 模态框 -->
	<div class="modal fade" id="mySignInModalDialog" data-backdrop="static" data-keyboard=true>
	  <div class="modal-dialog modal-dialog-centered modal-lg">
	    <div class="modal-content">
	 
	      <!-- 模态框头部 -->
	      <div class="modal-header">
	        <h4 class="modal-title"><spring:message code="user.loginWindow"/> </h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	 
	      <!-- 模态框主体 -->
	      <div class="modal-body">
 		        <div class="container">
 		        	<form class="form-signin">
					  <div class="text-center mb-4">
					    <h1 class="h3 mb-3 font-weight-normal">Floating labels</h1>
					    <p><spring:message code="user.DonithaveAnAccount"/><a class="nav-link" href="/flyingsnail/signUp"><spring:message code="user.signUp"/> </a></p>
					  </div>
					
					  <div class="form-label-group">
					    <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
					    <label for="inputEmail">Email address</label>
					  </div>
					
					  <div class="form-label-group">
					    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
					    <label for="inputPassword">Password</label>
					  </div>
					
					  <div class="checkbox mb-3">
					    <label>
					      <input type="checkbox" value="remember-me"> Remember me
					    </label>
					  </div>
					  <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
					  <p class="mt-5 mb-3 text-muted text-center">&copy; 2019-{{ site.time | date: "%Y" }}</p>
					</form>
				</div>
	      </div>
	 
	      <!-- 模态框底部 -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
<!-- 	        <button type="button" id="submitPhoto1" class="btn btn-primary">提交</button> -->
	      </div>
	 
	    </div>
	  </div>
	</div>
