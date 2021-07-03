<%--
  Created by IntelliJ IDEA.
  User: kwonw
  Date: 2021-07-02
  Time: 오후 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
    <title>Upload</title>
</head>
<body>

    <form action="uploadFormAction" method="post" enctype="multipart/form-data">
        <input type="file" name="uploadFile" multiple>
        <button>submit</button>
    </form>
</body>
</html>
