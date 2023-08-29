<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${contextPath}/resources/css/index.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Поиск друзей</title>
    </head>


    <body>
        <header class="header">
            <div class="header-intro">
                <div class="logo">Logo</div>
                <nav class="nav">
                    <a class="nav_link" href="/registration">Регистрация</a>
                    <a class="nav_link" href="/login">Вход</a>
                </nav>
            </div>
        </header>

        <div class="main">
            <div class="content">
                <div class="main_title">Найди друзей по интересам!</div>
                <a class="main_link" href="/registration">Начать!</a>
            </div>
            <div class="content">
                <img class="main_image" src="https://sun9-87.userapi.com/impg/JPkYQXbtvi8jLRfiOPc5UrMHoFyEwEjZtYwhUw/dFfjcdjQPjE.jpg?size=1000x667&quality=96&sign=c11e00d855e85408e1d092e21a5c13ab&type=album" runat="server" alt="Фото друзей">
            </div>
        </div>


        <hr style="margin-top: 15%;">
    </body>
</html>
