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
        <h2 class="display-4 border-bottom probootstrap-section-heading">Detail</h2>
        <br>
        <p>호텔 이름</p>
        <label>
          <input class="form-control text-center" name="hno" value='<c:out value="${hotelVO.name}"/>' readonly="readonly">
        </label><br>

        <p>호텔 등급</p>
        <label>
          <input class="form-control text-center" name="hno" value='<c:out value="${hotelVO.grade}"/>' readonly="readonly">
        </label><br>

        <p>호텔 주소</p>
        <label>
          <input class="form-control text-center" name="hno" value='<c:out value="${hotelVO.address}"/>' readonly="readonly">
        </label><br>

        <p>호텔 전화번호</p>
        <label>
          <input class="form-control text-center" name="hno" value='<c:out value="${hotelVO.phone}"/>' readonly="readonly">
        </label><br>
        <hr>
        <button data-oper="list" type="button" class="btn btn-light">List</button>
        <button data-oper="update" type="button" class="btn btn-success">Update</button>

        <form id="operForm" action="/hotel/update" method="get">
          <input type="hidden" id="hno" name="hno" value="<c:out value='${hotelVO.hno}'/>"/>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- END section -->
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">
  $(document).ready(function() {
    var operForm = $("#operForm");
    $("button[data-oper='update']").on("click", function(e){
      operForm.attr("action","/hotel/update").submit();
    });

    $("button[data-oper='list']").on("click", function(e){
      operForm.find("#hno").remove();
      operForm.attr("action","/hotel/list")
      operForm.submit();

    });
  });
</script>
