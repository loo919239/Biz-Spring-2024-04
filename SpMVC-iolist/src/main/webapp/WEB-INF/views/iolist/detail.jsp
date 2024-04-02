<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script>
    var rootPath = "${rootPath}";
</script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="${rootPath}/static/js/iolist.js?2024-04-01-005"></script>
<body>
	<main class="w3-container">
		<div class="w3-card-4 w3-dark-gray">
			<div class="w3-container w3-center">
				<h3>${IO.io_seq}</h3>		
				<h5>${IO.io_date}</h5>
				<h5>${IO.io_time}</h5>
				<h5>${IO.io_pname}</h5>
				<c:choose>
					<c:when test="${IO.io_input eq 1}">
						<h5>매입단가:${IO.io_time}</h5>
					</c:when>
					<c:otherwise>
						<h5>매출단가:${IO.io_time}</h5>
					</c:otherwise>
				</c:choose>
				<h5>${IO.io_quan}</h5>
				<h5>${IO.io_price*IO.io_quan}</h5>
				<div class="w3-section">
					<input data-seq="${IO.io_seq}" type="button" value="수정"
						class="btn_update w3-button w3-green" /> <input
						data-seq="${IO.io_seq}" type="button" value="삭제"
						class="btn_delete w3-button w3-red" />
				</div>
			</div>
		</div>

	</main>

</body>
</html>