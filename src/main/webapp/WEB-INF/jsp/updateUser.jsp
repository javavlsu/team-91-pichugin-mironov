<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Изменение пользователя</title>
</head>

<body>
    <div>
        <form:form method="POST" action="/updateUser" modelAttribute="userForm">
            <h2>Изменение данных пользователя</h2>
            <div>
                <form:input type="hidden" path="id_user" placeholder="Id_user" value="${user.id_user} "></form:input>
                <form:input type="text" path="username" placeholder="Username"
                            autofocus="true" value="${user.username}"></form:input>
                ${usernameError}
                <form:input type="hidden" path="password" placeholder="Password" value="${user.password}"></form:input>
            </div>
            <button type="submit">Изменить</button>
        </form:form>
        <a href="/admin">Назад</a>
    </div>

</body>
</html>