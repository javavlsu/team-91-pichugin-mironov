<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${contextPath}/resources/css/profile.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Личный кабинет</title>
    </head>

    <body>
    <header class="header">
        <div class="header-intro">
            <div class="logo">Logo</div>
            <nav class="nav">
                <a class="nav_link" href="/posts">Посты</a>
                <a class="nav_link" href="#">Друзья</a>
                <div class="profileHref">
                    <a class="nav_link_p" href="/profile?username=${pageContext.request.userPrincipal.name}">
                        ${pageContext.request.userPrincipal.name}
                    </a>
                </div>
                <a class="nav_link" href="/logout">Выход</a>
            </nav>
        </div>
    </header>

    <div class="main">
            <div class="profileInf">

                <div class="content">

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
                                    <c:otherwise>

                                        <br />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="Text">
                            День рождения:
                            <div class="input">
                                ${user.birthday}
                            </div>
                        </div>
<%--                        Проверка на то, чтобы только пользователь своей страницы мог редактировать профиль--%>
                        <c:if test="${user.username == pageContext.request.userPrincipal.name}">
                            <form method="GET" action="/editProfile">
                                <input type="hidden" name="id_user" value="${user.id_user}"/>
                                <button type="submit" class="buttonEdit">Редактировать</button>
                            </form>
                            <a class="buttonExit" href="/logout">Выход</a>
                        </c:if>
                        <c:if test="${alreadyFriends != 'yes'}">
                            <c:if test="${user.username != pageContext.request.userPrincipal.name}">
                                <form method="POST" action="/addFriendship">
                                    <input type="hidden" name="friendname" value="${user.username}">
                                    <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
                                    <button type="submit" class="buttonEdit">Добавить в друзья</button>
                                </form>
                            </c:if>
                        </c:if>
                    </div>
                </div>
                <div class="rightInf">
                    <div class="content1">
                        <div class="mainInf">

                            <div class="Text">
                                Обо мне:
                                <div class="input1">
                                    ${user.userDescription}
                                </div>
                            </div>

                            <div class="Text">
                                Ссылка на мессенджер:
                                <div class="input1">
                                    <a href="${user.linkMes}" style="color:white">${user.linkMes}</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <c:if test="${user.username == pageContext.request.userPrincipal.name}">
                        <div class="friendships">
                            <c:forEach items="${listFriends}" var="friend">
                                <div class="content2">
                                    <div class="friendInf">
                                        <div>
                                            <a href="/profile?username=${friend.username}&user=${pageContext.request.userPrincipal.name}">
                                                <img src="https://clck.ru/33MEpQ" alt="фото пользователя" class="friendImg">
                                            </a>
                                        </div>
                                        <div class="friendInf1">
                                            <div class="Text">
                                                <a href="/profile?username=${friend.username}&user=${pageContext.request.userPrincipal.name}" class="friendHref">${friend.lastName} ${friend.name}</a>
                                                <br>Хочет добавить вас в дрзуья
                                            </div>
                                            <div style="display: flex">
                                                <div>
                                                    <form method="POST" action="/addFriend">
                                                        <input type="hidden" name="idF" value="${user.id_user}">
                                                        <input type="hidden" name="idU" value="${friend.id_user}">
                                                        <button type="submit" class="buttonFriendships">Добавить</button>
                                                    </form>

                                                </div>
                                                <div>
                                                    <button class="buttonFriendships">Отказаться</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>

                </div>



            </div>
    </div>

    <hr style="margin-top: 15%;">
    </body>
</html>