<%--
  Created by IntelliJ IDEA.
  User: jhhon
  Date: 2021-07-02
  Time: 오후 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <style>
    .uploadResult {
      width: 100%;
      background: gray;
    }
    .uploadResult ul{
      display: flex;
      flex-flow: row;
      justify-content: center;
      align-items: center;
    }
    .uploadResult ul li{
      list-style: none;
      padding: 10px
    }
    .uploadResult ul li img{
      width: 20px;
    }
  </style>
</head>
<body>

  <h1>Upload with Ajax</h1>

  <div class="uploadDiv">
    <input type="file" name="uploadFile" multiple>
  </div>

  <button id="uploadBtn">Upload</button>

  <div class="uploadResult">
    <ul>

    </ul>
  </div>


  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
  <script>
    $(document).ready(function(){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 5242880;

      function checkExtension(fileName, fileSize) {

        if(fileSize >= maxSize) {
          alert("파일 사이즈 초과");
          return false;
        }

        if(regex.test(fileName)) {
          alert("해당 종류의 파일은 업로드 할 수 없습니다");
          return false;
        }

        return true;

      }

      var uploadResult = $(".uploadResult ul");

      // function showUploadFile(uploadResultArr) {
      //
      //   var str = "";
      //
      //   $(uploadResultArr).each(
      //           function (i, obj) {
      //
      //             if(!obj.image) {
      //               str += "<li><img src='/resources/img/attach.png'>"
      //                   + obj.fileName + "</li>";
      //             } else {
      //               str += "<li>" + obj.fileName + "</li>";
      //             }
      //
      //           });
      //
      //   uploadResult.append(str);
      //
      // }

      function showUploadFile(uploadResultArr) {

        var str = "";

        $(uploadResultArr).each(function (i, obj) {

          if(!obj.image) {
            str += "<li><img src='/resources/img/attach.png'>" + obj.fileName + "</li>";
          } else {
            str += "<li>" + obj.fileName + "</li>";

            var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

            str += "<li><img src='/display?fileName=" + fileCallPath + "'><li>";

          }

        });

        uploadResult.append(str);

      }

      var cloneObj = $(".uploadDiv").clone();

      $("#uploadBtn").on("click", function(e){

        var formData = new FormData();

        var inputFile = $("input[name='uploadFile']");

        var files = inputFile[0].files;

        console.log(files);

        for(var i=0; i<files.length; i++) {

          if(!checkExtension(files[i].name, files[i].size)){
            return false;
          }

          formData.append("uploadFile", files[i]);
        }

        $.ajax({
          url: '/uploadAjaxAction',
          processData: false,
          contentType: false,
          data: formData,
          type: 'POST',
          dataType: 'json',
          success: function(result) {

            console.log(result);

            showUploadFile(result);

            $(".uploadDiv").html(cloneObj.html());

          }

        });

      });

    });
  </script>

</body>
</html>
