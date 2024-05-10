<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>여기는 제목</title>
</head>
<body>
	<header>
	<h1>이미지 갤러리</h1>
	<p>Image Gallery 2024 Summer</p>
	</header>
	<c:if test="${BODY eq 'HOME' }">
			<%@ include file="/WEB-INF/views/home.jsp"%>
	</c:if>
	
	<c:if test="${BODY eq 'INSERT' }">
			<%@ include file="/WEB-INF/views/input.jsp"%>
	</c:if>
</body>
</html>