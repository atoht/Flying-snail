<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 模态框 -->
	<div class="modal fade" id="myModalClothing" data-backdrop="static" data-keyboard=true>
	  <div class="modal-dialog modal-dialog-centered modal-lg">
	    <div class="modal-content">
	 
	      <!-- 模态框头部 -->
	      <div class="modal-header">
	        <h4 class="modal-title"><spring:message code="image.dialog.title"/></h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	 
	      <!-- 模态框主体 -->
<!-- 	      <form action="uploadFile" enctype="multipart/form-data" method="POST"> -->
	      <div class="modal-body">
 		      <div class="container">
				<!-- <div class="row"> -->
				<!-- <div class="span12"> -->
				<div class="jc-demo-box">
				<div class="row">
				<div class="col-md-4">
				  <img src="" id="target" class="rounded img-responsive center-block " style="width:100%; "/><br>
				  <span id="errorMess"></span>
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
				      <input id="file-3" type="file" name="imgFile" />
<!-- 				      </form> -->
				  </fieldset>
				</div>
				</div>
				</div>
				</div>
	      </div>
	 
	        
	      <!-- 模态框底部 -->
	      <div class="modal-footer">
	        <button type="button" id="closePhoto" class="btn btn-secondary" data-dismiss="modal">关闭</button>
	        <button type="button" id="submitPhoto" class="btn btn-primary">上传</button>
<!-- 	        <input type="hidden" name="tailorInfo"> -->
<!-- 	        <input type="hidden" name="orientation"> -->
	      </div>
<!-- 	        </form> -->
	 
	    </div>
	  </div>
	</div>