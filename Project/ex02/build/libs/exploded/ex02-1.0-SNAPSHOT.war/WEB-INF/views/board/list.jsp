<%--
  Created by IntelliJ IDEA.
  User: jhhon
  Date: 2021-06-16
  Time: 오후 1:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="index.html">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Interface
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span>Components</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Custom Components:</h6>
                    <a class="collapse-item" href="buttons.html">Buttons</a>
                    <a class="collapse-item" href="cards.html">Cards</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
               aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Utilities</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Custom Utilities:</h6>
                    <a class="collapse-item" href="utilities-color.html">Colors</a>
                    <a class="collapse-item" href="utilities-border.html">Borders</a>
                    <a class="collapse-item" href="utilities-animation.html">Animations</a>
                    <a class="collapse-item" href="utilities-other.html">Other</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Addons
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>Pages</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Login Screens:</h6>
                    <a class="collapse-item" href="login.html">Login</a>
                    <a class="collapse-item" href="register.html">Register</a>
                    <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                    <div class="collapse-divider"></div>
                    <h6 class="collapse-header">Other Pages:</h6>
                    <a class="collapse-item" href="404.html">404 Page</a>
                    <a class="collapse-item" href="blank.html">Blank Page</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Charts</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item active">
            <a class="nav-link" href="tables.html">
                <i class="fas fa-fw fa-table"></i>
                <span>Tables</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="../includes/hearder.jsp"%>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                    For more information about DataTables, please visit the <a target="_blank"
                                                                               href="https://datatables.net">official DataTables documentation</a>.</p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <%--                        <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>--%>
                        <div class="panel-heading">Board List Page
                            <button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>#번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>수정일</th>
                                </tr>
                                </thead>
                                <c:forEach items="${list}" var="board">
                                    <tr>
                                        <td><c:out value="${board.bno}" /></td>
                                        <td><a href='/board/get?bno=<c:out value="${board.bno}" />'><c:out value="${board.title}" /></a></td>
                                        <td><c:out value="${board.writer}" /></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" /></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
                                    </tr>
                                </c:forEach>
                            </table>

                            <!-- Start searching-->
                            <div class='row'>
                                <div class="col-lg-12">
                                    <form id='searchForm' action="/board/list" method='get'>
                                        <select name='type'>
                                            <option value=""
                                                    <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
                                            <option value="T"
                                                    <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
                                            <option value="C"
                                                    <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
                                            <option value="W"
                                                    <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
                                            <option value="TC"
                                                    <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
                                                or 내용</option>
                                            <option value="TW"
                                                    <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
                                                or 작성자</option>
                                            <option value="TWC"
                                                    <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
                                                or 내용 or 작성자</option>
                                        </select>
                                        <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
                                        <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
                                        <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
                                        <button class='btn btn-default'>Search</button>
                                    </form>
                                </div>
                            </div>
                            <!--End searching -->

                            <!-- Paging -->
                            <div class="pull-right">
                                <ul class="pagination">
                                    <c:if test="${pageMaker.prev}">
                                        <li class="paginate_button previous">
                                            <a href="${pageMaker.startPage -1}">Previous</a>
                                        </li>
                                    </c:if>

                                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                        <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
                                            <a href="${num}">${num}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${pageMaker.next}">
                                        <li class="paginate_button next">
                                            <a href="${pageMaker.endPage +1 }">Next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                            <!-- End Paging -->

                            <form id='actionForm' action="/board/list" method='get'>
                                <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                                <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                                <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
                                <input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
                            </form>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                        </div>
                                        <div class="modal-body">처리가 완료되었다</div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save Changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="../includes/footer.jsp"%>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<%--<script src="/resources/vendor/jquery/jquery.min.js"></script>--%>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/js/demo/datatables-demo.js"></script>

<<script type="text/javascript">
    $(document)
        .ready(
            function() {

                var result = '<c:out value="${result}"/>';

                checkModal(result);

                history.replaceState({}, null, null);

                function checkModal(result) {

                    if (result === '' || history.state) {
                        return;
                    }

                    if (parseInt(result) > 0) {
                        $(".modal-body").html(
                            "게시글 " + parseInt(result)
                            + " 번이 등록되었습니다.");
                    }

                    $("#myModal").modal("show");
                }

                $("#regBtn").on("click", function() {

                    self.location = "/board/register";

                });

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

                $(".move")
                    .on(
                        "click",
                        function(e) {

                            e.preventDefault();
                            actionForm
                                .append("<input type='hidden' name='bno' value='"
                                    + $(this).attr(
                                        "href")
                                    + "'>");
                            actionForm.attr("action",
                                "/board/get");
                            actionForm.submit();

                        });

                var searchForm = $("#searchForm");

                $("#searchForm button").on(
                    "click",
                    function(e) {

                        if (!searchForm.find("option:selected")
                            .val()) {
                            alert("검색종류를 선택하세요");
                            return false;
                        }

                        if (!searchForm.find(
                            "input[name='keyword']").val()) {
                            alert("키워드를 입력하세요");
                            return false;
                        }

                        searchForm.find("input[name='pageNum']")
                            .val("1");
                        e.preventDefault();

                        searchForm.submit();

                    });

            });
</script>


</body>

</html>
