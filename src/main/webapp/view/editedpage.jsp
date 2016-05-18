<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>edited page</title>
  <link rel="stylesheet" type="text/css" href=" <c:url value="/resources/css/style.css"/> "/>
</head>
<body>
<div class="tg">
      <p>Вы успешно отредактировали поьзователя с id: ${id} </p>
      <p>Вернуться к <a href="/main/users">списку пользователей</a> </p>
</div>
</body>
</html>