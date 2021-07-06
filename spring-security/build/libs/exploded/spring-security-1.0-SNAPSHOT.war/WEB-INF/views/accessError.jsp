<%--
  Created by IntelliJ IDEA.
  User: jhhon
  Date: 2021-07-06
  Time: 오후 6:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>

  <h1>Access Denied Page</h1>

  <h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h2>

  <h2><c:out value="${msg}"/></h2>

</body>
</html>
