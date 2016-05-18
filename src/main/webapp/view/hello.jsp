<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>users page</title>
    <link rel="stylesheet" type="text/css" href=" <c:url value="/resources/css/style.css"/> "/>
</head>
<body>

<div class="tg">
        <div>
            <c:url var="addUrl" value="/main/users/add"/>
            <p>Добавить нового <a href="${addUrl}">пользователя</a></p>
            <p>Поиск <a href="<c:url value="/main/users/search"/>" target="_blank">пользователя</a></p>
    </div>
</div>
    <div id="pagination">
        <c:url value="/main/users" var="prev">
            <c:param name="page" value="${page -1}"/>
        </c:url>
        <c:if test="${page > 1}">
            <a href="<c:out value="${prev}"/>" class="pn prev">Prev</a>
        </c:if>
        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
            <c:choose>
                <c:when test="${page == i.index}">
                    <span>${i.index}</span>
                </c:when>
                <c:otherwise>
                    <c:url value="/main/users" var="url">
                        <c:param name="page" value="${i.index}"/>
                    </c:url>
                    <a href='<c:out value="${url}" />'>${i.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:url value="/main/users" var="next">
            <c:param name="page" value="${page + 1}"/>
        </c:url>
        <c:if test="${page + 1 <=maxPages}">
            <a href="<c:out value="${next}" />" class="pn next">Next</a>
        </c:if>
    </div>
    <div>
        <table class="tg">
            <caption>База Пользователей</caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>isAdmin</th>
                <th>createdDate</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${users}" var="user" varStatus="status">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.age}</td>
                    <td>${user.isAdmin}</td>
                    <td>${user.createdDate}</td>
                    <td><a href="<c:url value='/main/users/edit?id=${user.id}' />" >Edit</a></td>
                    <td><a href="<c:url value='/main/users/delete/${user.id}' />" >Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    </div>

</body>
</html>
