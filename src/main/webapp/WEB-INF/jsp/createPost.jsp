<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${contextPath}/resources/css/createPost.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Создание поста</title>
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
        <form:form method="POST" action="createPost" modelAttribute="postForm" class="content">
            <div class="title">
                Добавление поста
            </div>

            <div class="mainInf">
                <div class="Text">
                    Название поста:
                    <form:input type="text" path="title"
                                required="required" minlength="2" maxlength="40" cssClass="input"/>
                </div>

                <div class="Text">
                    Содержание поста:
                    <form:textarea path="description" required="required" minlength="2" maxlength="200" rows="1" class="inputBig"/>
                </div>

<%--                <div class="Text">--%>
<%--                    Тэги:--%>
<%--                    <form:input type="text" path="tags"--%>
<%--                                minlength="2" maxlength="100" class="input"/>--%>
<%--                </div>--%>

                <div style=" display: flex; flex-direction: row; align-items: center; justify-content: space-between; width: 100%; margin-top: 10%; ">
                    <a class="button1" href="posts">Назад</a>
                    <form method="GET" action="createPost" class="createPost" >
                        <input type="hidden" name="name" value="${user.name}">
                        <input type="hidden" name="lastName" value="${user.lastName}">
                        <input type="hidden" name="id_user" value="${user.id_user}">
                        <input type="hidden" name="username" value="${user.username}">
                        <input type="submit" class="button" value="Создать пост"/>
                    </form>
                </div>

            </div>

            <hr style="width: 90%; visibility: hidden;">
        </form:form>
    </div>

    <hr style="margin-top: 15%;">

</body>
</html>