<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>

  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


  <title>Get_List</title>
  <style>
    body{
      padding: 10px 200px;
    }
    h1 {
      text-align: center;
    }
  </style>
</head>
<body>
<h1>Get List</h1>
<table class="table table-hover">
  <thead>
  <tr>
    <th scope="col">Seq</th>
    <th scope="col">Title</th>
    <th scope="col">Content</th>
    <th scope="col">Writer</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="getList" items="${list}">
  <tr>
    <th> ${getList.bno}</th>
    <td><a href='/board/get?bno=<c:out value="${getList.bno}" />'><c:out value="${getList.title}" /></a></td>
    <td> ${getList.content}</td>
    <td> ${getList.writer}</td>
  </tr>
  </c:forEach>
  </tbody>
</table>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        처리가 완료되었습니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js">
  $(document).ready(function() {
    var result = '<c:out value="${result}"/>';
  });
</script>
</body>
</html>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js">
  $(document).ready(function() {
    var $seq='<c:out value="${result}"/>';
    checkModal($seq);

    function checkModal($seq) {
      const result = parseInt($seq);
      if(result === 0) {
        $(".modal-body").html("게시글 " + result + "번이 등록되었습니다.");
      }

      if(result > 0) {
        $(".modal-body").html("게시글 " + result + "번이 등록되었습니다.");
      }

      $("#myModal").modal("show");
    }
  });
</script>