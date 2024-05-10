<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${rootPath}/static/css/input.css?2024-05-10-001">
<script src="${rootPath}/static/js/input.js?2024-05-10-001"></script>
<section class="insert">
	<form method="POST" enctype="multipart/form-data">
		<div>
		<input type="text" placeholder="이미지 제목" name="i_title" />
		</div>
		<div>
			<input type="file" class="file single" name="image_file"
				accept="image/*" /> 
			<input type="file" class="file multi"
				name="image_files" accept="image/*" multiple />
		</div>
		<div>
			<input type="hidden" name="g_image" />
		</div>
		<div class="image">
			<img src="${rootPath}/static/images/noimage.png" width="200px"
				class="insert" />
		</div>
		<div class="image multi"></div>
		<div>
		<input type="text" placeholder="EMAIL" name="i_email" />
		</div>
		<div>
		<input type="text" placeholder="PASSWORD" name="i_pass" /> 
		</div>
		<div>
		<input class="button" type="submit" value="저장" />
		</div>
	</form>
</section>