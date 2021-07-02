<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <style>
    body{
      padding: 10px 200px;
    }
  </style>
  <title>Insert</title>
</head>
<body>
  <h1> INSERT </h1>
  <form role="form" action="/board/insert" method="post">
    <div>
      <label>title</label>
      <input class="form-control" name="title">
    </div>
    <div class="mb-3">
      <label>content</label>
      <textarea class="form-control" name="content"> </textarea>
    </div>
    <div class="mb-3">
      <label>writer</label>
      <input class="form-control" name="writer">
    </div>

    <button type="submit" class="btn btn-default"> SUBMIT </button>
    <button type="reset" class="btn btn-default"> RESET </button>
  </form>
</body>

</html>
