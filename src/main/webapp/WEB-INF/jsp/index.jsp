<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>index</title>
    </head>
    <body>
        <h3>${pageContext.request.userPrincipal.name}</h3>
        <sec:authorize access="!isAuthenticated()">
            <h4><a href="/login">Войти</a></h4>
            <h4><a href="/registration">Зарегистрироваться</a></h4>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            <h4><a href="/logout">Выйти</a></h4>
        </sec:authorize>

    </body>
</html>
