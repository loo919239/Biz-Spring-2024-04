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
        .blue {
            background-color: blue;
        }
        .heart {
            color: red;
        }
        .hidden {
            display: none;
        }
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex; /* 가로로 나열하기 위해 flexbox를 사용합니다. */
        }
        ul li {
            margin-right: 10px; /* 각 아이템 사이의 간격을 조절합니다. */
            font-size: 20px; /* 리스트 아이템의 글자 크기를 조절합니다. */
        }
    </style>
</head>
<body>
    <table>
        <ul>
            <c:forEach var="hint" items="${colHints}">
                <li>${hint}</li> <!-- 각 열의 숫자 힌트를 표시 -->
            </c:forEach>
        </ul>
        <!-- 게임 보드를 표시하는 부분 -->
        <c:forEach var="row" items="${rows}">
            <tr>
                <td>${row.hints}</td> <!-- 각 행의 숫자 힌트를 표시 -->
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block1}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block2}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block3}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block4}"></td>
                <td class="cell" onclick="toggleColor(event, this)" oncontextmenu="toggleBlue(event, this)" data-value="${row.n_block5}"></td>
     
            </tr>
        </c:forEach>
    </table>
</body>
</html>
