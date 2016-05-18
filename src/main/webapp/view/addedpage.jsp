<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>added page</title>
  <link rel="stylesheet" type="text/css" href=" <c:url value="/resources/css/style.css"/> "/>
</head>
<body>
<div class="tg">
  <p> Вы успешно добавили нового пользователя в базу <%= new java.util.Date()%></p>
  <c:url var="mainUrl" value="/main/users"/>
  <p>Вернуться к <a href="${mainUrl}">списку пользователей</a> </p>
</div>
</body>
</html>
