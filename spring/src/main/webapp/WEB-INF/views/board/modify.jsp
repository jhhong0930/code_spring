<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form role="form" action="/board/modify" method="post">

    <div class="form-group">
        <label>Bno</label>
        <input class="form-control" name="bno" value="<c:out value='${board.bno}'/>" readonly="readonly">
    </div>

    <div class="form-group">
        <label>Title</label>
        <input class="form-control" name="title" value="<c:out value='${board.title}'/>">
    </div>

    <div class="form-group">
        <label>Text area</label>
        <textarea class="form-control" row="3" name="content" readonly="readonly">
            <c:out value="${board.content}" />
        </textarea>
    </div>

    <div class="form-group">
        <label>Writer</label>
        <input class="form-control" name="writer" value="<c:out value='${board.writer}'/>" readonly="readonly">
    </div>

    <div class="form-group">
        <label>RegDate</label>
        <input class="form-control" name="regDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regDate}"/>' readonly="readonly">
    </div>

    <div class="form-group">
        <label>update Date</label>
        <input class="form-control" name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}"/>' readonly="readonly">
    </div>

    <button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
    <button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
    <button type="submit" data-oper="list" class="btn btn-info">List</button>

</form>

<script type="text/javascript">
    $(document).ready(function() {
        var formObj = $("form");

        $('button').on("click", function(e){
            e.preventDefault();
            var operation = $(this).data("oper");
            console.log(operation);

            if(operation === 'remove') {
                formObj.attr("action", "/board/remove");
            } else if(operation === 'list') {
                // move to list
                self.location = "/board/list";
                return;
            }
            formObj.submit();

        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        var formObj = $("form");
        $('button').on("click", function (e) {
            e.preventDefault();
            var operation = $(this).data("oper");
            console.log(operation);
            if(operation === 'remove') {
                formObj.attr("action", "/board/remove");
            } else if(operation === 'list') {
                //move to list
                formObj.attr("action", "/board/list").attr("method", "get");
                formObj.empty();
            }
            formObj.submit();
        });
    });
</script>