<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${contextPath}/resources/css/login.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Вход</title>
    </head>

    <body>
        <header class="header">
            <div class="header-intro">
                <div class="logo">Logo</div>
                <nav class="nav">
                    <a class="nav_link" href="/">Начальная страница</a>
                </nav>
            </div>
        </header>

        <div class="main">
            <form method="POST" action="/login" class="content">
                <div class="login">
                    <div class="loginText">
                        Логин:<p>
                        <input  name="username" type="text" placeholder="Username" autofocus="true"
                                required minlength="2" maxlength="20" class="inputLogin">
                    </div>
                    <div class="loginText">
                        <p>Пароль:</p>
                        <input name="password" type="password" placeholder="Password"
                               required minlength="2" maxlength="50" class="inputLogin">
                    </div>
                </div>
                <input type="submit" value="Войти" class="button">
                <hr style="width: 90%; visibility: hidden;">
            </form>
        </div>

        <hr style="margin-top: 15%;">
    </body>
</html>