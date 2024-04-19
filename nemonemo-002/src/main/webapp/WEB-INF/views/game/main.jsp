<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<div class="HM-home_container">
	<div class="HM-home_top">
		<div class="HM-home_first_menu">
			<div class="HM-home_weather">
				<label > <span>날씨</span></label>
			</div>

			<div class="HM-home_img">
				<img src="${rootPath}/static/img/sun.png">
				<img src="${rootPath}/static/img/cloud.png">
				<img src="${rootPath}/static/img/rainy.png">
				<img src="${rootPath}/static/img/snow.png">
			</div>
			<div>
				<label class="HM-home_cal"> <span>년</span> <span>월</span> <span>일</span>
				</label>
			</div>
		</div>
		<div class="HM-home_second_menu">
			<label>제목</label>
		</div>
	</div>
	<div class="HM-home_picture">
		<div>
			<div></div>
			<div></div>
		</div>
		<div>
			<div></div>
			<div></div>
		</div>
	</div>
	<div class="HM-home_diary"></div>
</div>