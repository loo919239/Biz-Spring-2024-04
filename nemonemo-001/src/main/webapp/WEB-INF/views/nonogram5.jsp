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
            vertical-align: middle;
            cursor: pointer;
            background-color: white; /* 초기에는 모든 셀을 흰색으로 설정합니다. */
        }
        
        td.num {
        width: 100px;
        text-align: right;
        }
        
        .black {
            background-color: black;
        }
        .red {
            background-color: red;
        }
        .blue {
            background-color: blue;
        }
        .heart {
            color: red;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <table>
        <!-- 게임 보드를 표시하는 부분 -->
        <c:forEach var="row" items="${rows}">
            <tr>
                <td class="num">${row.hints}</td> <!-- 각 행의 숫자 힌트를 표시 -->
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block1}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block2}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block3}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block4}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block5}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block6}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block7}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block8}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block9}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block10}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block11}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block12}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block13}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block14}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block15}"></td>
            </tr>
        </c:forEach>
    </table>
    <div id="lives">목숨: <span class="heart">♥</span><span class="heart">♥</span><span class="heart">♥</span></div>

    <script>
        var clickedCells = []; // 클릭된 셀을 추적하기 위한 배열
        var lives = document.querySelectorAll('.heart'); // 목숨을 나타내는 하트 요소들
        var wrongClickCount = 0; // 잘못된 클릭 횟수를 추적하기 위한 변수

        function toggleColor(event, cell) {
            if (cell.classList.contains('blue')) return; // 파란색 셀은 클릭 불가
            var value = cell.getAttribute('data-value');
            if (event.button === 2) return; // 우클릭이면 아무 작업도 하지 않음
            if (!cell.classList.contains('blue')) { // 파란색이 아닌 경우에만 작동
                cell.classList.toggle('black', value === '1');
                cell.classList.toggle('red', value !== '1');
                clickedCells.push(cell); // 클릭된 셀을 배열에 추가합니다.
                if (value === '0') {
                    decreaseLife();
                }
            }

            // 클리어 판단
          /*   if (clickedCells.length === 7) {
                clearGame();
            } */
        }

        // 우클릭으로 파란색으로 변경하는 함수
        function toggleBlue(event, cell) {
            event.preventDefault(); // 기본 우클릭 이벤트를 막음
            cell.classList.toggle('blue'); // 파란색으로 변경 또는 제거
        }

        function clearGame() {
            alert('게임 클리어!'); // 알림 창을 표시합니다.
            disableCellClicks(); // 셀 클릭 이벤트를 비활성화합니다.
        }

       /*  function gameOver() {
            alert('게임 오버!'); // 알림 창을 표시합니다.
            disableCellClicks(); // 셀 클릭 이벤트를 비활성화합니다.
        } */

       /*  function disableCellClicks() {
            var cells = document.querySelectorAll('.cell');
            cells.forEach(function(cell) {
                cell.onclick = null; // 각 셀의 클릭 이벤트를 제거합니다.
            });
        } */

        function decreaseLife() {
            var heart = document.querySelector('.heart:not(.hidden)');
            if (heart) {
                heart.classList.add('hidden');
            } else {
                gameOver();
            }
        }
    </script>
</body>
</html>
