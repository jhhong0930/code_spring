<%--
  Created by IntelliJ IDEA.
  User: kwonw
  Date: 2021-07-02
  Time: 오후 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
    <title>upload with Ajax</title>
    <style>
        .uploadResult {
            width: 100%;
            background-color: gray;
        }

        .uploadResult ul {
            display: flex;
            flex-flow:  row;
            justify-content: center;
            align-items: center;
        }

        .uploadResult ul li {
            list-style: none;
            padding: 10px;
        }

        .uploadResult ul li img {
            width: 20px;
        }
    </style>
</head>
<body>
<h1> UPLOAD AJAX</h1>
<div class="uploadDiv">
    <input type = "file" name="uploadFile" multiple>
</div>
<button id = 'uploadBtn'> upload </button>
<div class="uploadResult">
    <ul>

    </ul>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
</script>
<script>
    $(document).ready(function () {
        var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
        var maxSize = 5242880;

        function checkExtension(fileName, fileSize) {
            if (fileSize >= maxSize){
                alert("파일 사이즈 초과");
                return false;
            }

            if(regex.test(fileName)) {
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
                return false;
            }

            return true;
        }

        // function showUploadFile(uploadResultArr) {
        //     var str = "";
        //
        //     $(uploadResultArr).each(function (i, obj) {
        //         if(!obj.iamge) {
        //             str += "<li><img src='resources/img/attach.png'>"
        //                 + obj.fileName + "</li>";
        //         } else {
        //             str += "<li>" + obj.fileName + "</li>";
        //         }
        //     });
        //
        //     uploadResult.append(str);
        // }
        var uploadResult = $(".uploadResult ul");

        function showUploadFile(uploadResultArr) {
            var str = "";
            $(uploadResultArr).each(function (i, obj) {
                if(!obj.image) {
                    str += "<li><img src='/resources/img/attach.png'>" + obj.fileName + "</li>";
                } else {
                    str += "<li>" + obj.fileName + "</li>";
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                    str += "<li><img src='/display?fileName=" + fileCallPath +"'></li>";
                }
            });

            uploadResult.append(str);
        }

        var cloneObj = $(".uploadDiv").clone();
        $("#uploadBtn").on("click", function (e) {
            var formData = new FormData();

            var inputFile = $("input[name='uploadFile']")

            var files = inputFile[0].files;

            console.log(files);

            for(var i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                url : '/uploadAjaxAction ',
                processData: false,
                contentType: false,
                data: formData,
                    type: 'POST',
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        // alert("Uploaded");

                        showUploadFile(result);

                        $(".uploadDiv").html(cloneObj.html());
                    }
            });
        });
    });
</script>

</body>
</html>
