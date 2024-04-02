<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>여기는 제목</title>
<style>
.input {
display: flex;
flex-direction: column;

margin: 10px auto;
input {
flex:1;
width:20%;
padding: 5px 5px;
}
}

</style>
</head>
<body>
<script>
    // 현재 날짜를 가져오는 함수
    function getCurrentDate() {
        var currentDate = new Date();
        var year = currentDate.getFullYear();
        var month = ("0" + (currentDate.getMonth() + 1)).slice(-2);
        var day = ("0" + currentDate.getDate()).slice(-2);
        return year + "-" + month + "-" + day;
    }

    // 현재 시각을 가져오는 함수
    function getCurrentTime() {
        var currentTime = new Date();
        var hour = ("0" + currentTime.getHours()).slice(-2);
        var minute = ("0" + currentTime.getMinutes()).slice(-2);
        return hour + ":" + minute;
    }

    // 페이지가 로드될 때 실행되는 함수
    window.onload = function() {
        // 현재 날짜를 가져와서 입력 필드에 설정
        document.getElementById("currentDate").value = getCurrentDate();
        // 현재 시각을 가져와서 입력 필드에 설정
        document.getElementById("currentTime").value = getCurrentTime();
    };
</script>
	<h1>매입매출 등록</h1>
	<form method="POST">
		<div class="input">
			<div><input placeholder="SEQ" name="io_seq" value="${IO.io_seq}"/></div>
			<div><input type="date" placeholder="일자" name="io_date" value="${IO.io_date}" id="currentDate"/></div>
			<div><input type="time" placeholder="시각" name="io_time" value="${IO.io_time}" id="currentTime"/></div>
			<div><input placeholder="상품명" name="io_pname" value="${IO.io_pname}"/></div>
			<div><input placeholder="구분" name="io_input" value="${IO.io_input}"/></div>
			<div><input placeholder="단가" name="io_price" value="${IO.io_price}"/></div>
			<div><input placeholder="수량" name="io_quan" value="${IO.io_quan}"/></div>
			<div><input type="submit" value="저장"/></div>
		</div>
	</form>
</body>
</html>
