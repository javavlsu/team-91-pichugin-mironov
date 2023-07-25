<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${contextPath}/resources/css/registration.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Регистрация</title>
    </head>

    <body>
        <header class="header">
            <div class="header-intro">
                <div class="logo">Logo</div>
                <nav class="nav">
                    <a class="nav_link" href="/">Начальная страница</a>
                    <a class="nav_link" href="/login">Вход</a>
                </nav>
            </div>
        </header>

        <div class="main">
            <br>${usernameError}
            <form:form method="POST" modelAttribute="userForm" class="content" >
                <div class="title">
                    Регистрация:
                </div>
                    <div class="mainInf">
                        <div class="Text">
                            <p>Фамилия: </p>
                            <form:input type="text" path="lastName" placeholder=""
                                        autofocus="true" required="" minlength="2" maxlength="20" cssClass="input"></form:input>
                        </div>

                        <div class="Text">
                            <p>Имя: </p>
                            <form:input type="text" path="name" placeholder=""
                                        required="" minlength="2" maxlength="20" cssClass="input"></form:input>
                        </div>

                        <div class="Text">
                            <p>Дата рождения: </p>
                            <form:input type="date" path="birthday"
                                        cssClass="inputDate"></form:input>
                        </div>

                        <div class="Text">
                            <p>Пол: </p>
                            <form:select path="pol" required="" cssClass="pol">
                                <form:option value="true">Мужской</form:option>
                                <form:option value="false">Женский</form:option>
                            </form:select>
                        </div>

                        <div class="Text">
                            <p>Логин: </p>
                            <form:input type="text" path="username"
                                        required="" minlength="3" maxlength="20" cssClass="input"></form:input>
                        </div>

                        <div class="Text">
                            <p>Пароль: </p>
                            <form:input type="password" path="password"
                                        required="" minlength="6" maxlength="50" cssClass="input"></form:input>
                        </div>

                        <div class="Text">
                            <p>Описание: </p>
<%--                            <textarea name="userDescription" required minlength="2" maxlength="100" rows="1" class="inputBig"> </textarea>--%>
                        </div>

                        <div class="Text">
                            <p>Ссылка на мессенджер: </p>
                            <form:input type="text"  path="linkMes"
                                        maxlength="100" class="input"></form:input>
                        </div>

                    </div>
                <button type="submit" class="button">Зарегистрироваться</button>
                <hr style="width: 90%; visibility: hidden;">
            </form:form>
        </div>

        <hr style="margin-top: 15%;">
    </body>
</html>