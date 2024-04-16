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
        }
        .black {
            background-color: black;
        }
        .red {
            background-color: red;
        }
    </style>
</head>
<body>
    <h1>Nonogram Game</h1>
    <table>
        <!-- 게임 보드를 표시하는 부분 -->
        <c:forEach var="row" items="${nemoData}">
            <tr>
                <td class="${row.lv1_block1 == 1 ? 'black' : 'red'}"></td>
                <td class="${row.lv1_block2 == 1 ? 'black' : 'red'}"></td>
                <td class="${row.lv1_block3 == 1 ? 'black' : 'red'}"></td>
                <td class="${row.lv1_block4 == 1 ? 'black' : 'red'}"></td>
                <td class="${row.lv1_block5 == 1 ? 'black' : 'red'}"></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>