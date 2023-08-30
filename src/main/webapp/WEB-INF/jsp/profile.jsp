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
                        <c:if test="${!almostFriends}">
                            <c:if test="${user.username != pageContext.request.userPrincipal.name}">
                                <form method="POST" action="/addFriendship">
                                    <input type="hidden" name="friendname" value="${user.username}">
                                    <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
                                    <button type="submit" class="buttonEdit">Добавить в друзья</button>
                                </form>
                            </c:if>
                        </c:if>
                        <c:if test="${alreadyFriends}">
                            <form method="POST" action="/deleteFriend">
                                <input type="hidden" name="friendUsername" value="${user.username}">
                                <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}">
                                <button type="submit" class="buttonEdit">Удалить из друзей</button>
                            </form>
                        </c:if>
                        <c:if test="${almostFriends && !alreadyFriends}">
                            Запрос на дружбу отправлен
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
                            <c:if test="${alreadyFriends || user.username == pageContext.request.userPrincipal.name}">
                                <div class="Text">
                                    Ссылка на мессенджер:
                                    <div class="input1">
                                            <a href="${user.linkMes}" style="color:white">${user.linkMes}</a>
                                    </div>
                                </div>
                            </c:if>
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
                                                    <form method="POST" action="/deleteFriendship">
                                                        <input type="hidden" name="idF" value="${user.id_user}">
                                                        <input type="hidden" name="idU" value="${friend.id_user}">
                                                        <button type="submit" class="buttonFriendships">Отказаться</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>

                    <div style="display: flex;flex-direction: row-reverse;flex-wrap: nowrap;margin-top: 2%;">
                        <c:forEach items="${listPosts}" var="post">
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

                </div>



            </div>
    </div>

    <hr style="margin-top: 15%;">
    </body>
</html>