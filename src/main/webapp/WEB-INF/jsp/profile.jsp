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

                        <form method="GET" action="/editProfile">
                            <input type="hidden" name="id_user" value="${user.id_user}"/>
                            <button type="submit" class="buttonEdit">Редактировать</button>
                        </form>

                        <a class="buttonExit" href="/logout">Выход</a>

                    </div>
                </div>

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
            </div>
    </div>

    <hr style="margin-top: 15%;">
    </body>
</html>