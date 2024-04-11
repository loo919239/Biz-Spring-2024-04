<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nonogram Game</title>
    <script>
        function cellClicked(row, col) {
            // 셀을 클릭했을 때 처리하는 JavaScript 함수
            // 적절한 로직을 구현하세요
            document.getElementById("row").value = row;
            document.getElementById("col").value = col;
            document.getElementById("checkForm").submit();
        }
    </script>
</head>
<body>
    <h1>Nonogram Game</h1>
    <table>
        <!-- 게임 보드를 표시하는 부분 -->
        <c:forEach var="row" begin="0" end="${gameBoard.board.length - 1}">
            <tr>
                <c:forEach var="col" begin="0" end="${gameBoard.board[row].length - 1}">
                    <td onclick="cellClicked(${row}, ${col})"
                        style="width: 50px; height: 50px; background-color: ${gameBoard.board[row][col] == 1 ? 'blue' : 'white'};">
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    <form id="checkForm" method="post" style="display: none;">
        <input type="hidden" id="row" name="row"/>
        <input type="hidden" id="col" name="col"/>
    </form>
</body>
</html>
