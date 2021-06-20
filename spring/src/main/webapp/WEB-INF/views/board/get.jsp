<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp"%>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Board Read Page</h6>
    </div>
    <div class="card-body">

            <div class="form-group">
                <label>Bno</label><input class="form-control" name="bno" value="<c:out value='${board.bno}'/>" readonly="readonly">
            </div>

            <div class="form-group">
                <label>Title</label><input class="form-control" name="title" value="<c:out value='${board.title}'/>" readonly="readonly">
            </div>

            <div class="form-group">
                <label>Text area</label><textarea class="form-control" row="3" name="content" readonly="readonly"><c:out value="${board.content}" /></textarea>
            </div>

            <div class="form-group">
                <label>Writer</label><input class="form-control" name="writer" value="<c:out value='${board.writer}'/>" readonly="readonly">
            </div>

            <button data-oper="modify" class="btn btn-default">Modify</button>
            <button data-oper="list" class="btn btn-info">List</button>

        <form id='operForm' action="/boad/modify" method="get">
            <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
            <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
            <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
            <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
            <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

        </form>

    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var operForm = $("#operForm");

        $("button[data-oper='modify']").on("click", function (e) {
            operForm.attr("action", "/board/modify").submit();
        });

        $("button[data-oper='list']").on("click", function (e) {
            operForm.find('#bno').remove();
            operForm.attr("action","/board/list")
            operForm.submit();
        });

    })
</script>




<%@ include file="../includes/footer.jsp"%>