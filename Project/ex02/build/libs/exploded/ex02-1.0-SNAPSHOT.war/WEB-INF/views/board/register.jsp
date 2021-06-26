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
    <h6 class="m-0 font-weight-bold text-primary">Board Register</h6>
  </div>
  <div class="card-body">

    <form role="form" action="/board/register" method="post">
      <div class="form-group">
        <label>Title</label><input class="form-control" name="title">
      </div>

      <div class="form-group">
        <label>Content</label>
        <textarea class="form-control" rows="3" name="content"></textarea>
      </div>

      <div class="form-group">
        <label>writer</label><input class="form-control" name="writer">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
      <button type="reset" class="btn btn-default">Reset Button</button>
    </form>
  </div>
</div>
<%@include file="../includes/footer.jsp"%>