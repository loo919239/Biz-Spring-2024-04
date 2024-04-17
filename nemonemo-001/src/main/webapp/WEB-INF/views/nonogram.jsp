<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nonogram Game</title>
    <style>
        table {
            border-collapse: collapse;
        }
        td {
            width: 30px;
            height: 30px;
            border: 1px solid black;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
            background-color: white; /* 초기에는 모든 셀을 흰색으로 설정합니다. */
        }
        .black {
            background-color: black;
        }
        .red {
            background-color: red;
        }
        .heart {
            color: red;
        }
    </style>
</head>
<body>
    <h1>Nonogram Game</h1>
    <table>
        <!-- 게임 보드를 표시하는 부분 -->
        <c:forEach var="row" items="${VO}">
            <tr>
                <td class="cell" onclick="toggleColor(this)" data-value="${row.lv1_block1}"></td>
                <td class="cell" onclick="toggleColor(this)" data-value="${row.lv1_block2}"></td>
                <td class="cell" onclick="toggleColor(this)" data-value="${row.lv1_block3}"></td>
                <td class="cell" onclick="toggleColor(this)" data-value="${row.lv1_block4}"></td>
                <td class="cell" onclick="toggleColor(this)" data-value="${row.lv1_block5}"></td>
            </tr>
        </c:forEach>
    </table>
    <div id="lives">목숨: <span class="heart">♥</span><span class="heart">♥</span><span class="heart">♥</span></div>
</body>
<script>
    var clickedCells = []; // 클릭된 셀을 추적하기 위한 배열
    var lives = document.querySelectorAll('.heart'); // 목숨을 나타내는 하트 요소들
    var wrongClickCount = 0; // 잘못된 클릭 횟수를 추적하기 위한 변수

    function toggleColor(cell) {
        if (!clickedCells.includes(cell)) { // 한 번 이상 클릭된 셀이 아닌 경우
            var value = cell.getAttribute('data-value'); // 현재 셀의 숫자 값을 가져옵니다.
            cell.classList.toggle('black', value === '1'); // 현재 셀의 값이 1이면 black 클래스를 추가합니다.
            cell.classList.toggle('red', value !== '1'); // 현재 셀의 값이 1이 아니면 red 클래스를 추가합니다.
            clickedCells.push(cell); // 클릭된 셀을 배열에 추가합니다.
            
            if (value !== '1') { // 잘못된 클릭인 경우
                wrongClickCount++; // 잘못된 클릭 횟수를 증가시킵니다.
                if (wrongClickCount > lives.length) { // 잘못된 클릭 횟수가 목숨 개수와 같거나 클 경우
                    gameOver(); // 게임오버 함수를 호출합니다.
                } else {
                    // 하트를 하나씩 없앱니다.
                    lives[wrongClickCount - 1].innerHTML = '♡';
                }
            }
        }
    }

    function gameOver() {
        alert('게임 오버!'); // 알림 창을 표시합니다.
        disableCellClicks(); // 셀 클릭 이벤트를 비활성화합니다.
    }

    function disableCellClicks() {
        var cells = document.querySelectorAll('.cell');
        cells.forEach(function(cell) {
            cell.onclick = null; // 각 셀의 클릭 이벤트를 제거합니다.
        });
    }
</script>
</html>