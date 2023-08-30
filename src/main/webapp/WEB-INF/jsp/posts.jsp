<%@ page import="ru.vlsu.ispi.entity.User" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${contextPath}/resources/css/posts.css">
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

            <div class="contentLeft">
                <div class="titleLeft">
                    Отоброжение постов
                </div>
                <form:form method="GET" action="friendsPosts">
                    <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
                    <input type="submit" class="buttonLeft" value="Посты друзей" />
                </form:form>
            </div>

            <div style="display: flex; flex-direction: column-reverse;">
                <c:forEach items="${allPosts}" var="post">
                <div class="post">
                    <div class="title">
                        <div>
                            <b>${post.title}</b>
                        </div>
                    </div>
                    <div class="dateTimePost">
                        <a href="/profile?username=${post.user.username}&user=${pageContext.request.userPrincipal.name}">
                            <img src="https://clck.ru/33MEpQ" alt="фото пользователя" class="navImg">
                        </a>
                        <div class="ProfilePost">
                            <a href="/profile?username=${post.user.username}&user=${pageContext.request.userPrincipal.name}" style="text-decoration: none; color: white; font-size: 16.5px; line-height: 22px; font-weight: 570;">${post.user.lastName} ${post.user.name}</a>
                            <div>
                                    ${post.startTime}
                            </div>
                        </div>
                    </div>

                    <div class="">
                        <img src="https://sun9-77.userapi.com/impg/VyjXV9OkJvXghffY7KCVxkmmo_aIXFfTj2y3lw/MBC4FuOngiQ.jpg?size=480x376&quality=96&sign=b6aba0cc7167bfb06ad23611b60bc793&type=album" alt="фото поста" class="PostImg">
                    </div>

                    <div class="titleD">
                        <b>Описание:</b>
                    </div>
                    <div class="textDescription">
                        ${post.description}
                    </div>
                    <hr style="width: 90%; visibility: hidden;">

<%--                        @if (User.FindFirst(x => x.Type == ClaimTypes.Name).Value == pst.Login)--%>
<%--                        {--%>
<%--                        <a class="buttonMenu" asp-action="EditPostU" asp-route-id="@pst.PostID" asp-controller="User">Редактировать</a>--%>
<%--                        <a class="buttonMenu" asp-action="DeletePostU" asp-route-id="@pst.PostID" asp-controller="User">Удалить</a>--%>
<%--                        }--%>

<%--                    </div>--%>

                    <div class="commentSection">
                        <div class="newComment">
                            <form method="POST" action="posts"  class="formComment">
                                <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
                                <input type="hidden" name="id" value="${post.id}">
                                <input type="text" name="commentName"
                                            minlength="1" maxlength="300" placeholder="Написать комментарий.." class="inputNewComment"/>
                                <input type="submit" value="Отправить" class="buttonComment">
                            </form>
                        </div>
                        <div style="display: flex; flex-direction: column-reverse;">
                            <c:forEach items="${allComments}" var="comment">
                                <c:if test="${post.id == comment.post.id}">
                                    <div class="comment">
                                        <div class="userComment">
                                            <a href="/profile?username=${comment.user.username}&user=${pageContext.request.userPrincipal.name}">
                                                <img src="https://clck.ru/33MEpQ" alt="фото пользователя" class="navImg">
                                            </a>
                                        </div>
                                        <div class="textComment">
                                            <div style="font-size: 16.5px; line-height: 22px; font-weight: 570;">
                                                <a href="/profile?username=${comment.user.username}&user=${pageContext.request.userPrincipal.name}" style="text-decoration: none; color: white;">${comment.user.lastName} ${comment.user.name}</a>
                                            </div>
                                            <div style="font-size: 14.5px; word-wrap: break-word;">
                                                    ${comment.commentName}
                                            </div>
                                            <div style="font-size: 12.5px; line-height: 20px">
                                                    ${comment.startCommentTime}
                                            </div>
                                        </div>
                                        <c:if test="${comment.user.username == pageContext.request.userPrincipal.name || pageContext.request.userPrincipal.name == post.user.username}">
                                            <div class="deleteComment">
                                                <form method="GET" action="" class="">
                                                    <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}" >
                                                    <input type="submit" value="Удалить" class="buttonComment"/>
                                                </form>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="right">
                <form method="GET" action="createPost" class="createPost" >
                    <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
                    <input type="submit" value="Создать пост" class="buttonRight"/>
                </form>
                <form method="GET" action="findFriends" class="createPost"  >
                    <input type="submit" value="Найти друзей" class="findFriends"/>
                </form>
            </div>
        </div>

        <hr style="margin-top: 15%;">
    </body>
</html>
