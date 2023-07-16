<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>index</title>
    </head>
    <body>
        <h2>Hello World!</h2>
        <center>
            <h2>СПИСОК ПОЛЬЗОВАТЕЛЕЙ</h2>

            <table>

                <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>lastName</th>
                    <th>age</th>
                </tr>
                <c:forEach items="${userList}" var="userItem">
                    <tr>
                        <td><c:out value="${userItem.id}" /></td>
                        <td><c:out value="${userItem.name}" /></td>
                        <td><c:out value="${userItem.lastName}" /></td>
                        <td><c:out value="${userItem.age}" /></td>
                    </tr>
                </c:forEach>

            </table>
        </center>
    </body>
</html>
