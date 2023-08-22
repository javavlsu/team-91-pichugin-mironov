<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${contextPath}/resources/css/updateUser.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Изменение пользователя</title>
</head>

<body>
    <header class="header">
        <div class="header-intro">
            <div class="logo">Logo</div>
            <nav class="nav">
                <a class="nav_link" href="/posts">Посты</a>
                <a class="nav_link" href="/friends?username=${pageContext.request.userPrincipal.name}">Друзья</a>
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
        <form:form method="POST" action="/editProfile" modelAttribute="userForm" cssClass="content">

            <form:input type="hidden" path="id_user" value="${user.id_user}"></form:input>
            <form:input type="hidden" path="username" value="${user.username}"></form:input>

            <div class="title">
                Редактирование профиля:
            </div>

            <div class="mainInf">

                <div class="Text">
                    Фамилия:
                    <form:input type="text" path="lastName" value="${user.lastName}" class="input"/>
                </div>

                <div class="Text">
                    Имя:
                    <form:input type="text" path="name" value="${user.name}" class="input"/>

                </div>

                <div class="Text">
                    Дата рождения:
                    <form:input type="date" path="birthday" value="${user.birthday}" class="input"/>
                </div>

                <div class="Text">
                    Пол:
                    <select name="pol" class="inputSel">
                        <option value="${user.pol}">
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
                        </option>
                        <option value="true">Мужской</option>
                        <option value="false">Женский</option>
                    </select>
                </div>

                <div class="Text">
                    Описание:
                    <form:input type="text" path="userDescription" value="${user.userDescription}" class="input"/>
                </div>

                <div class="Text">
                    Ссылка на мессенджер:
                    <form:input type="text" path="linkMes" value="${user.linkMes}" class="input"/>
                </div>

                <div class="Text">
                    Пароль:
                    <form:input type="text" path="password" value="${user.password}" class="input"/>
                </div>

                <input type="submit" class="button" value="Изменить"/>
            </div>
        </form:form>
    </div>

    <hr style="margin-top: 15%;">

</body>
</html>