<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${contextPath}/resources/css/findFriends.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Посты</title>
    </head>

    <body>
        <header class="header">
            <div class="header-intro">
                <div class="logo">Logo</div>
                <nav class="nav">
                    <a class="nav_link" href="/posts">Посты</a>
                    <a class="nav_link" href="/friends?username=${pageContext.request.userPrincipal.name}">Друзья</a>
                    <a class="nav_link" href="/profile?username=${pageContext.request.userPrincipal.name}">
                        ${pageContext.request.userPrincipal.name}
                    </a>
                    <a class="nav_link" href="/logout">Выход</a>
                </nav>
            </div>
        </header>

        <div class="main">

            <div style="display: flex; flex-direction: row; justify-content: space-around; align-items: center; width: 100%;">
                <form method="post">
                    <div class="contentID">
                        <div class="titleID">Введите фрагмент фамилии или имени пользователя:</div>
                        <form:form method="POST" action="findFriendsSubstring">
                            <input type="text" autofocus name="substring" class="inputID"/>
                            <input type="submit" id="btnB" class="buttonID" value="Найти" />
                        </form:form>
                    </div>
                </form>
            </div>

            <div class="title" style="display: flex; flex-direction: row; justify-content: space-around; align-items: center; width: 100%;">
                <c:if test="${users.isEmpty()}">
                    Ничего не найдено
                </c:if>
            </div>

            <c:forEach items="${users}" var="user">
                <c:if test="${user.username != pageContext.request.userPrincipal.name}">
                    <div class="friend">
                        <div class="mainInf">
                            <div class="styleImg">
                                <img src="https://clck.ru/33MEpQ" alt="фото пользователя" class="profileImg">
                            </div>
                            <div class="Text">
                                Фамилия:
                                <div class="input">
                                        ${user.lastName}
                                </div>
                            </div>

                            <div class="Text">
                                Имя:
                                <div class="input">
                                        ${user.name}
                                </div>
                            </div>

                            <div class="Text">
                                Пол:
                                <div class="input">
                                    <c:choose>
                                        <c:when test="${user.pol==true}">
                                            Мужской
                                            <br />
                                        </c:when>
                                        <c:when test="${user.pol==false}">
                                            Женский
                                            <br />
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>

                            <div class="Text">
                                День рождения:
                                <div class="input">
                                        ${user.birthday}
                                </div>
                            </div>

                        </div>
                        <hr style="width: 90%; visibility: hidden;">
                        <div class="bMenu">
                            <a class="buttonMenu" href="/profile?username=${user.username}&user=${pageContext.request.userPrincipal.name}">Подробнее</a>
                        </div>
                    </div>
                </c:if>
            </c:forEach>

        </div>

        <hr style="margin-top: 15%;">
    </body>
</html>
