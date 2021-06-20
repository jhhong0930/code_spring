<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp"%>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Board Modify Page</h6>
    </div>
    <form role="form" action="/board/modify" method="post">

        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>

        <div class="card-body">
            <div class="form-group">
                <label>bno</label>
                <input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
            </div>

            <div class="form-group">
                <label>Title</label>
                <input class="form-control" name="title" value='<c:out value="${board.title}"/>'>
            </div>

            <div class="form-group">
                <label>Content</label>
                <textarea class="form-control" rows="3" name="content" ><c:out value="${board.content}"/></textarea>
            </div>

            <div class="form-group">
                <label>Writer</label>
                <input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
            </div>
            <button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
            <button type="submit" data-oper="remove" class="btn btn-default">Remove</button>
            <button type="submit" data-oper="list" class="btn btn-default">List</button>
        </div>
    </form>
</div>
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
    $(document).ready(function () {
        var formObj = $("form");
        $('button').on("click", function (e) {
            e.preventDefault();

            var operation = $(this).data("oper");
            console.log(operation);

            if(operation === 'remove') {
                formObj.attr("action", "/board/remove");
            } else if (operation === 'list'){
                // self.location = "/board/list";
                formObj.attr("action", "/board/list").attr("method", "get");

                var pageNumTag = $("input[name='pageNum']").clone();
                var amountTag = $("input[name='amount']").clone();


                formObj.empty();
                formObj.append(pageNumTag);
                formObj.append(amountTag);


            }

            formObj.submit();
        })
    });
</script>