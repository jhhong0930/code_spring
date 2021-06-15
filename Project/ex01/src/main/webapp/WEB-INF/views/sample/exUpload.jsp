<%--
  Created by IntelliJ IDEA.
  User: kwonw
  Date: 2021-06-13
  Time: 오후 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form action="/sample/exUploadPost" method="post" enctype="multipart/form-data">
    <div>
      <input type="file" name="files">
    </div>
    <div>
      <input type="file" name="files">
    </div>
    <div>
      <input type="file" name="files">
    </div>
    <div>
      <input type="file" name="files">
    </div>
    <div>
      <input type="submit">
    </div>
  </form>
</body>
</html>
