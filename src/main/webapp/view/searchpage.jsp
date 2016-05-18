<%@ page language="java" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>search page</title>
  <link rel="stylesheet" type="text/css" href=" <c:url value="/resources/css/style.css"/> "/>
</head>
<body>
<c:url var="saveUrl" value="/main/users/search" />
<form:form modelAttribute="name" method="get" action="${saveUrl}">
  <div>
    <p>Поиск пользователя</p>
    <table class="tg">
      <tr>
      <td>
        <label for="name">Имя</label>
        <input type="text" name="name" id="name"/>
      </td>
      </tr>
    </table>
    <input type="submit" value="Найти" />
  </div>
</form:form>


<div class="tg">
    <div>
      <p>Вернуться к общему списку <a href="/main/users">пользователей</a></p>
  </div>
</div>
<c:if test="${!empty users}">
  <div id="pagination">
    <c:url value="/main/users/search" var="prev">
      <c:param name="page" value="${page -1}"/>
      <c:param name="name" value="${name}"/>
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
          <c:url value="/main/users/search" var="url">
            <c:param name="page" value="${i.index}"/>
            <c:param name="name" value="${name}"/>
          </c:url>
          <a href='<c:out value="${url}" />'>${i.index}</a>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <c:url value="/main/users/search" var="next">
      <c:param name="page" value="${page + 1}"/>
      <c:param name="name" value="${name}"/>
    </c:url>
    <c:if test="${page + 1 <=maxPages}">
      <a href="<c:out value="${next}" />" class="pn next">Next</a>
    </c:if>
  </div>
  <div>
    <table class="tg">
      <caption> Найденные пользователи с именем : ${name}</caption>
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
</c:if>
<c:if test="${empty users && name != ''}">
<div class="tg">
      <p> Пользователь с именем : ${name} в базе не найден</p>
</div>
</c:if>
</body>
</html>
