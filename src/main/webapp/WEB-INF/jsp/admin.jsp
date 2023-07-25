<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Список пользователей</title>
</head>

<body>
    <header class="header">
        <div class="header-intro">
            <div class="logo">Logo</div>
            <nav class="nav">
                <a class="nav_link" href="#">Пользователи</a>
                <a class="nav_link" href="#">Жалобы</a>
                <a class="nav_link" href="#">Посты</a>
                <a class="nav_link" href="#">
                    ${pageContext.request.userPrincipal.name}
                </a>
                <a class="nav_link" href="/logout">Выход</a>
            </nav>
        </div>
    </header>

    <div class="content">
        <h2>Все пользователи</h2>
        <table>
            <tr>
                <td>ID</td>
                <td>Имя</td>
                <td>Фамилия</td>
                <td>Описание</td>
                <td>Ссылка на мессенджер</td>
                <td>Дата рождения</td>
                <td>Пол</td>
                <td>Логин</td>
                <td class="td">Пароль</td>
                <td>Роль</td>
                <td>Действия</td>
            </tr>
            <c:forEach items="${allUsers}" var="user">
                <tr>
                    <td>${user.id_user}</td>
                    <td>${user.name}</td>
                    <td>${user.lastName}</td>
                    <td>${user.userDescription}</td>
                    <td>${user.linkMes}</td>
                    <td>${user.birthday}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.pol==true}">
                                Мужской
                                <br />
                            </c:when>
                            <c:when test="${user.pol==false}">
                                Женский
                                <br />
                            </c:when>
                            <c:otherwise>

                                <br />
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td><c:forEach items="${user.roles}" var="role">${role.name}</c:forEach></td>
                    <td>
                        <form action="${pageContext.request.contextPath}/admin" method="POST">
                            <input type="hidden" name="id_user" value="${user.id_user}"/>
                            <input type="hidden" name="action" value="update"/>
                            <button type="submit" class="button">Редактировать</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/admin" method="POST">
                            <input type="hidden" name="id_user" value="${user.id_user}"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button type="submit" class="button">Удалить</button>
                        </form>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>