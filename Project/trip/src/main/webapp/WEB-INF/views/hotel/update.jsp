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

<%@include file="../common/header.jsp"%>
<section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('/resources/images/bg_1.jpg');height: 10px;" data-stellar-background-ratio="0.5" id="section-home">
    <div class="overlay"></div>
</section>
<!-- END section -->

<section class="probootstrap_section" id="section-feature-testimonial">
    <div class="container">
        <div class="row justify-content-center mb-5">
            <div class="col-md-12 text-center mb-5 probootstrap-animate">
                <form role="form" action="/hotel/update" method="post">
                    <div class="card-body">
                        <h2 class="display-4 border-bottom probootstrap-section-heading">Update</h2>
                        <div class="form-group">
                            <br>
                            <h4>호텔고유번호</h4>
                            <label>
                                <input class="form-control text-center" name="hno" value='<c:out value="${hotelVO.hno}"/>' readonly="readonly">
                            </label>
                        </div>

                        <div class="form-group">
                            <h4>호텔이름</h4>
                            <input class="form-control" name="name" value='<c:out value="${hotelVO.name}"/>'>
                        </div>
                        <div class="form-group">
                            <h4>호텔 등급</h4>
                            <input class="form-control" name="grade" value='<c:out value="${hotelVO.grade}"/>' >
                        </div>

                        <div class="form-group">
                            <h4>Content</h4>
                            <textarea class="form-control" rows="3" name="address" ><c:out value="${hotelVO.address}"/></textarea>
                        </div>

                        <div class="form-group">
                            <h4>Writer</h4>
                            <input class="form-control" name="phone" value='<c:out value="${hotelVO.phone}"/>'>
                        </div>
                        <button type="submit" data-oper="list" class="btn btn-default" >List</button>
                        <button type="submit" data-oper="delete" class="btn btn-dark">Delete</button>
                        <button type="submit" data-oper="update"  class="btn btn-success">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- END section -->
<%@include file="../common/footer.jsp"%>

<script type="text/javascript">
    $(document).ready(function () {
        var formObj = $("form");
        $('button').on("click", function (e) {
            e.preventDefault();

            var operation = $(this).data("oper");
            console.log(operation);

            if(operation === 'delete') {
                formObj.attr("action", "/hotel/delete");
            } else if (operation === 'list'){
                // self.location = "/board/list";
                formObj.attr("action", "/hotel/list").attr("method", "get");
                formObj.empty();
            }

            formObj.submit();
        })
    });
</script>