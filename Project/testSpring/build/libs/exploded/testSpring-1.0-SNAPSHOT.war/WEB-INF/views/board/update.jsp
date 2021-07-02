<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <title>UPDATE</title>
  <style>
    body{
      padding: 10px 200px;
    }
  </style>

</head>
<body>
<h1>Update</h1>
<div class="mb-3">
  <label>bno</label>
  <input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
</div>
<div>
  <label>title</label>
  <input class="form-control" name="bno" value='<c:out value="${board.title}"/>'> <br>
</div>
<div class="mb-3">
  <label>content</label>
  <input class="form-control" name="bno" value='<c:out value="${board.content}"/>' >
</div>
<div class="mb-3">
  <label>writer</label>
  <input class="form-control" name="bno" value='<c:out value="${board.writer}"/>' readonly="readonly">
</div>
<div class="mb-3">
  <label>Insert Date</label>
  <input class="form-control" name="bno" value='<c:out value="${board.regDate}"/>' readonly="readonly">
</div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">수정</button>
  </div>
</body>
</html>
