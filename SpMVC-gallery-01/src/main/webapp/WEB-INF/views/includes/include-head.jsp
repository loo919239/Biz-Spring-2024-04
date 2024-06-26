<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>이미지 갤러리 2024</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html {
	height: 100vh;
}

body {
	height: 100%;
	display: flex;
	flex-direction: column;
}

a {
	text-decoration: none;
	color: inherit;
}
</style>

<link rel="stylesheet" href="${rootPath}/static/css/main.css?2024-04-18-001">

</head>
<script>
	// js 파일에서 사용할 rootPath 변수 선언
	const rootPath = "${rootPath}"
</script>

