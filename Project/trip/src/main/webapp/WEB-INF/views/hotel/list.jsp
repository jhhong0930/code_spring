<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@include file="../common/header.jsp"%>

  <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('/resources/images/bg_1.jpg');height: 10px;" data-stellar-background-ratio="0.5" id="section-home">
    <div class="overlay"></div>
  </section>
  <!-- END section -->
    
  <section class="probootstrap_section" id="section-city-guides">
    <div class="container">
      <div class="row text-center mb-5 probootstrap-animate">
        <div class="col-md-12">
          <h2 class="display-4 border-bottom probootstrap-section-heading">Hotel List</h2>
        </div>
      </div>
      <div class="row mb-4">
        <table class="table table-borderless table-hover">
          <thead>
          <tr>
            <th>번호</th>
            <th>호텔 이름</th>
            <th>성급</th>
          </tr>
          </thead>

          <tbody>
          <c:forEach items="${list}" var="hotel">
            <tr>
              <td><c:out value="${hotel.hno}" /></td>
              <td><a href='/hotel/detail?hno=<c:out value="${hotel.hno}" />'><c:out value="${hotel.name}" /></a></td>
              <td><c:out value="${hotel.grade}" /></td>
            </tr>

          </c:forEach>
          </tbody>
        </table>
        <%-- start paging --%>
        <div class="fa-pull-left">
          <ul class="pagination">
            <c:if test="${pageMaker.prev}">
              <li class="page-item paginate_button previous">
                <a class="page-link" href="${pageMaker.startPage -1}">Previous</a>
              </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
              <li class="page-item paginate_button  ${pageMaker.criteria.pageNum == num ? "active":""} ">
                <a class="page-link" href="${num}">${num}</a>
              </li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
              <li class="page-item paginate_button next">
                <a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
              </li>
            </c:if>
          </ul>
        </div>
        <%-- End paging --%>
        <%-- Start Form (paging, search) --%>
        <form id='actionForm' action="/hotel/list" method='get'>
          <input type='hidden' name='pageNum' value='${pageMaker.criteria.pageNum}'>
          <input type='hidden' name='amount' value='${pageMaker.criteria.amount}'>
        </form>
        <%-- End Form (paging, search) --%>
      </div>
    </div>
  </section>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">
  $(document).ready(
  function() {

    var actionForm = $("#actionForm");

    $(".paginate_button a").on(
      "click",
      function(e) {

        e.preventDefault();

        console.log('click');

        actionForm.find("input[name='pageNum']")
                .val($(this).attr("href"));
        actionForm.submit();
      });

  });
</script>