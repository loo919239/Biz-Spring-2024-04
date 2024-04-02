<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/views/includes/head.jspf"%>
<style>
form.w3-container {
	width: 60%;
	margin: 10px auto; fieldset { border-radius : 10px;
	padding: 16px;
	margin: 20px
}

legend {
	text-align: center;
	font-weight: 900;
	font-size: 1.3ren;
}

input {
	margin-bottom: 10px;
	border-redius: 10px;
}
}
</style>
<body>
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<form method="POST" class="w3-container">
		<fieldset>
			<legend>회원가입</legend>
			<lable class="w3-text-teal">USERNAME</lable>
			<input placeholder="USERNAME" name="username"
				class="w3-input w3-border w3-light-gray" />
			<lable class="w3-text-teal">비밀번호</lable>
			<input placeholder="비밀번호" name="password"
				class="w3-input w3-border w3-light-gray" />
			<lable class="w3-text-teal">이름</lable>
			<input placeholder="이름" name="name"
				class="w3-input w3-border w3-light-gray">
			<lable class="w3-text-teal">이메일</lable>
			<input placeholder="이메일" name="email"
				class="w3-input w3-border w3-light-gray" />
			<lable class="w3-text-teal">전화번호</lable>
			<input placeholder="전화번호" name="tel"
				class="w3-input w3-border w3-light-gray" /> <input type="submit"
				value="회원가입" class="w3-btn w3-blue-gray w3-right"  />
		</fieldset>
	</form>
	<p>${USER.username}
	<p>${USER.password}
	<p>${USER.name}
	<p>${USER.email}
	<p>${USER.tel}
</body>
</html>