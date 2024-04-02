<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/views/includes/head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<style>
table.w3-table-all {
	width: 70%;
	margin: 10px auto;
	tr: hover{ 
			cursor:pointer;
}
}

div.btn_box {
	display: block;
	width: 70%;
	margin: 5px auto;
	text-align: right;
	padding: 0;
}
</style>
	<script>
		// JS 파일을 Link 하여 사용할 경우
		// JSP 에서 선언된 ${rootPath}는 사용할수 없다
		// JS 파일을 Link 하기 전에 var 키워드를 사용하여
		// 모든 JS 에서 사용할수 있도록 변수를 선언해 둔다

		var rootPath = "${rootPath}"
	</script>
	<script src="${rootPath}/static/js/product.js?2024-03-29-005"></script>
	<div class="w3-container w3-padding-24 w3-center">
		<table class="w3-table-all w3-hoverable">
			<thead>
				<tr>
					<th>SEQ</th>
					<th>상품코드</th>
					<th>상품이름</th>
					<th>품목</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody class="pro_body">
				<c:forEach items="${PRODUCT_LIST}" var="PRODUCT" varStatus="VAR">
					<tr data-pcode = "${PRODUCT.p_code}">
						<td>${VAR.index},${VAR.count}
						<td>${PRODUCT.p_code}</td>
						<td>${PRODUCT.p_name}</td>
						<td>${PRODUCT.p_item}</td>
						<td>${PRODUCT.p_price}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="w3-container btn_box">
			<a href="${rootPath}/product/insert"
				class="w3-button w3-blue w3-round-large">고객추가</a>
		</div>
		<ul>
			<c:forEach begin="1" end="100" step="2" var="VAR">
				<li>${VAR}</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>