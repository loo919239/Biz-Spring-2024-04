<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/includes/head.jspf"%>
<style>
form.product {
	width: 60%;
	margin: 20px auto;
	div {
		display	:flex;
		laval{
		flex:1;
		}
		input{
		flex:3;
		}
	}
}
</style>

<body>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<form method="POST">
		<fieldset>
			<legend> 상품등록 </legend>
			<div>
				<laval>상품코드</laval>
				<input placeholder="상품코드" name="p_code" value="${PRODUCT.p_code}" />
			</div>
			<div>
				<laval>상품명</laval>
				<input placeholder="상품이름" name="p_name" value="${PRODUCT.p_name}" />
			</div>
			<div>
				<laval>품목</laval>
				<input placeholder="품목" name="p_item" value="${PRODUCT.p_item}" />
			</div>
			<div>
				<laval>가격</laval>
				<input placeholder="가격" name="p_price" value="${PRODUCT.p_price}" />
			</div>
			<div>
				<laval></laval>
				<input type="submit" value="저장" />
			</div>

		</fieldset>
	</form>

</body>
</html>