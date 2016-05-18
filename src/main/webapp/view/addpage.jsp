<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>add page</title>
  <link rel="stylesheet" type="text/css" href=" <c:url value="/resources/css/style.css"/> "/>
</head>
<body>
<c:url var="saveUrl" value="/main/users/add" />
<form:form modelAttribute="user" method="POST" action="${saveUrl}">
    <p>Создание нового пользователя</p>
 <table class="tg">
    <tr>
      <td>
        <label for="name">Имя</label>
        <input type="text" name="name" id="name"/>
      </td>
    </tr>
      <tr>
        <td>
          <label for="age">Возраст</label>
          <input type="text" name="age" id="age"/>
        </td>
      </tr>
      <tr>
        <td>
          <label for="isAdmin">isAdmin</label>
                <span>
                    <input type="radio" name="isAdmin" id="isAdmin" value="true"/> Админ
                    <input type="radio" name="isAdmin" value="false"/> Пользователь
                  </span>
        </td>
      </tr>
 </table>
  <input type="submit" value="Save" />
</form:form>

</body>
</html>
