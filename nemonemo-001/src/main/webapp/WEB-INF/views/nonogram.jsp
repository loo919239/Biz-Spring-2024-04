<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nonogram</title>
    <style>
        .board {
            display: grid;
            grid-template-columns: repeat(5, 20px);
            grid-template-rows: repeat(5, 20px);
            gap: 1px;
        }
        .cell {
            width: 20px;
            height: 20px;
            border: 1px solid black;
            background-color: white;
            cursor: pointer; /* 클릭 가능한 커서 설정 */
        }
        .black {
            background-color: black;
        }
        .wrong {
            background-color: red;
        }
    </style>
</head>
<body>
    <h1>Nonogram</h1>
    <div class="board">
        <!-- 노노그램 보드 표시 -->
        <div class="cell" id="cell-0" onclick="toggleColor(this, 0)"></div>
        <div class="cell" id="cell-1" onclick="toggleColor(this, 1)"></div>
        <div class="cell" id="cell-2" onclick="toggleColor(this, 2)"></div>
        <div class="cell" id="cell-3" onclick="toggleColor(this, 3)"></div>
        <div class="cell" id="cell-4" onclick="toggleColor(this, 4)"></div>
        <div class="cell" id="cell-5" onclick="toggleColor(this, 5)"></div>
        <div class="cell" id="cell-6" onclick="toggleColor(this, 6)"></div>
        <div class="cell" id="cell-7" onclick="toggleColor(this, 7)"></div>
        <div class="cell" id="cell-8" onclick="toggleColor(this, 8)"></div>
        <div class="cell" id="cell-9" onclick="toggleColor(this, 9)"></div>
        <div class="cell" id="cell-10" onclick="toggleColor(this, 10)"></div>
        <div class="cell" id="cell-11" onclick="toggleColor(this, 11)"></div>
        <div class="cell" id="cell-12" onclick="toggleColor(this, 12)"></div>
        <div class="cell" id="cell-13" onclick="toggleColor(this, 13)"></div>
        <div class="cell" id="cell-14" onclick="toggleColor(this, 14)"></div>
        <div class="cell" id="cell-15" onclick="toggleColor(this, 15)"></div>
        <div class="cell" id="cell-16" onclick="toggleColor(this, 16)"></div>
        <div class="cell" id="cell-17" onclick="toggleColor(this, 17)"></div>
        <div class="cell" id="cell-18" onclick="toggleColor(this, 18)"></div>
        <div class="cell" id="cell-19" onclick="toggleColor(this, 19)"></div>
        <div class="cell" id="cell-20" onclick="toggleColor(this, 20)"></div>
        <div class="cell" id="cell-21" onclick="toggleColor(this, 21)"></div>
        <div class="cell" id="cell-22" onclick="toggleColor(this, 22)"></div>
        <div class="cell" id="cell-23" onclick="toggleColor(this, 23)"></div>
        <div class="cell" id="cell-24" onclick="toggleColor(this, 24)"></div>
    </div>
    <div id="gameOver" style="display: none; color: red; font-size: 24px; margin-top: 20px;">게임 오버!</div>
    <div id="clearMessage" style="display: none; color: green; font-size: 24px; margin-top: 20px;">클리어!</div>

    <script>
        var controllerData = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1];
        var clickedCells = [];
        var wrongClickCount = 0;
        var gameIsOver = false;

        function toggleColor(cell, index) {
            if (!gameIsOver && !clickedCells.includes(index)) {
                cell.classList.toggle('black');
                checkAnswer(index);
                clickedCells.push(index);
                if (clickedCells.length === controllerData.length && clickedCells.every(i => controllerData[i] === 1)) {
                    clearGame();
                }
            }
        }

        function checkAnswer(index) {
            if (!gameIsOver && controllerData[index] !== (clickedCells.includes(index) ? 1 : 0)) {
                document.getElementById('cell-' + index).classList.add('wrong');
                wrongClickCount++;
                if (wrongClickCount >= 3) {
                    endGame();
                }
            } else {
                document.getElementById('cell-' + index).classList.remove('wrong');
            }
        }

        function endGame() {
            gameIsOver = true;
            document.getElementById('gameOver').style.display = 'block';
            disableCellClicks();
        }

        function clearGame() {
            gameIsOver = true;
            document.getElementById('clearMessage').style.display = 'block';
            disableCellClicks();
        }

        function disableCellClicks() {
            // 게임 종료 후에는 모든 셀의 클릭 이벤트를 비활성화
            var cells = document.querySelectorAll('.cell');
            cells.forEach(function(cell) {
                cell.onclick = null;
            });
        }
    </script>
</body>
</html>
