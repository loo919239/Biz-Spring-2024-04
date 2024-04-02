<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script>
    var rootPath = "${rootPath}";
</script>
<style>
.btn_box {
margin-top: 5px;
margin-bottom: 10px;
}

</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<script src="${rootPath}/static/js/iolist.js?2024-04-01-005"></script>
	<h1>매입매출관리</h1>
	<div class="w3-container btn_box w3-right ">
			<a href="${rootPath}/insert"
				class="w3-button w3-blue w3-round-large">추가</a>
		</div>
	<div class="w3-container w3-padding-24 w3-center">
		<table class="w3-table-all w3-hoverable">
			<thead>
				<tr>
					<td>SEQ</td>
					<td>일자</td>
					<td>시각</td>
					<td>상품명</td>
					<td>매입단가</td>
					<td>판매단가</td>
					<td>수량</td>
					<td>매입합계</td>
					<td>판매합계</td>
				</tr>
			</thead>
			<tbody class="io_body">
				<c:forEach items="${IO_LIST}" var="IO">
					<tr data-seq="${IO.io_seq}">
						<td>${IO.io_seq}</td>
						<td>${IO.io_date}</td>
						<td>${IO.io_time}</td>
						<td>${IO.io_pname}</td>
						<c:choose>
							<c:when test="${IO.io_input eq 1}">
								<td>${IO.io_price}</td>
							</c:when>
							<c:otherwise>
								<td>&nbsp;</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${IO.io_input eq 2}">
								<td>${IO.io_price}</td>
							</c:when>
							<c:otherwise>
								<td>&nbsp;</td>
							</c:otherwise>
						</c:choose>
						<td>${IO.io_quan}</td>
						<c:choose>
							<c:when test="${IO.io_input eq 1}">
								<td>${IO.io_price*IO.io_quan}</td>
							</c:when>
							<c:otherwise>
								<td>&nbsp;</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${IO.io_input eq 2}">
								<td>${IO.io_price*IO.io_quan}</td>
							</c:when>
							<c:otherwise>
								<td>&nbsp;</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>
