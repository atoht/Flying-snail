<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 模态框 -->
	<div class="modal fade" id="myModalApparel" data-backdrop="static" data-keyboard=true>
	  <div class="modal-dialog modal-dialog-centered modal-lg">
	    <div class="modal-content">
	 
	      <!-- 模态框头部 -->
	      <div class="modal-header">
	        <h4 class="modal-title">模态框头部</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	 
	      <!-- 模态框主体 -->
	      <div class="modal-body">
	 		       <div class="container">
				<!-- <div class="row"> -->
				<!-- <div class="span12"> -->
				<div class="jc-demo-box">
				<div class="row">
				<div class="col-md-4">
				  <img src="resources/images/photo-1542834759-197152b49c42.jpg" id="target1" class="rounded img-responsive center-block " style="width:100%; "/>
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
<!-- 				    <form enctype="multipart/form-data" method="POST"> -->
				      <input id="file-4" type="file" name="imgFile" multiple />
<!-- 				      </form> -->
				  </fieldset>
				</div>
				</div>
				</div>
				</div>
	      </div>
	 
	      <!-- 模态框底部 -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
	        <button type="button" id="submitPhoto1" class="btn btn-primary">提交</button>
	      </div>
	 
	    </div>
	  </div>
	</div>
