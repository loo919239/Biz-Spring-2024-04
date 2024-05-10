<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<section>
	<a href="${rootPath}/insert">이미지 업로드</a>
	<section class="insert container">
		<c:forEach var="GA" items="${GALLERY}">
			<div class="insertcard">
				<c:set var="imageSrc" value="/upload/${GA.i_up_image}" />
				<c:choose>
					<c:when test="${empty GA.i_up_image}">
						<c:set var="imageSrc"
							value="${rootPath}/static/images/noimage.png" />
					</c:when>
				</c:choose>

				<img src="${imageSrc}" width="100px"
					alt="<c:out value="${GA.i_origin_image}" />">
				<h3>
					<c:choose>
						<c:when test="${not empty GA.i_title}">
							<c:out value="${GA.i_title}" />
						</c:when>
						<c:otherwise>
						 	이미지 제목
						</c:otherwise>
					</c:choose>
				</h3>
			</div>
		</c:forEach>
	</section>
</section>
