<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<body class="HM-main_container">
	<div class="HM-main_body">
		<%@ include file="/WEB-INF/views/include/header.jsp"%>

		<c:if test="${BODY eq 'HOME' }">
			<%@ include file="/WEB-INF/views/game/main.jsp"%>
		</c:if>
		<c:if test="${BODY eq 'GAME' }">
			<%@ include file="/WEB-INF/views/game/game.jsp" %>
		
		</c:if> 

	</div>

	<div class="HM-main_hover_box"></div>
	<nav class="HM-main_nav">
		<ul>
			<li>홈</li>
			<li>게임</li>
		</ul>
	</nav>
</body>
</html>