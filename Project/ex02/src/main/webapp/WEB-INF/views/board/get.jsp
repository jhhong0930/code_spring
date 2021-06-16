<%--
  Created by IntelliJ IDEA.
  User: kwonw
  Date: 2021-06-16
  Time: 오후 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/hearder.jsp"%>
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Board Read Page</h6>
  </div>
  <div class="card-body">
    <div class="form-group">
      <label>bno</label>
      <input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
    </div>

    <div class="form-group">
      <label>Title</label>
      <input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly="readonly">
    </div>

    <div class="form-group">
      <label>Content</label>
      <textarea class="form-control" rows="3" name="content" readonly="readonly">
        <c:out value="${board.content}"/>
      </textarea>
    </div>

    <div class="form-group">
      <label>Writer</label>
      <input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
    </div>
      <button data-oper="modify" class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>' ">Modify</button>
      <button data-oper="list" class="btn btn-default" onclick="location.href='/board/list'">List</button>
  </div>
</div>
<%@include file="../includes/footer.jsp"%>