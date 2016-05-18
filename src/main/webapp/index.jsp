<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>index</title>
</head>
<body>
<h3>Стартовая страница</h3>
<p>Список всех <a href="<c:url value="/main/users"/>" target="_blank">пользователей</a></p>
<p>Добавить нового <a href="<c:url value="/main/users/add"/>" target="_blank">пользователя</a></p>
<p>Поиск <a href="<c:url value="/main/users/search"/>" target="_blank">пользователя</a></p>
</body>
</html>
