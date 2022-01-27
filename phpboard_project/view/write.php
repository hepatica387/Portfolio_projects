<?php
  include_once "header.php";

  if(!isset($_SESSION['login_succ'])){
    echo "<script>alert('로그인해주세요!')</script>";
    echo("<script>location.href='/view/login.php'</script>");
    exit;
  }

  $explode_url = explode("?", $url);
  $ref = 0;
  $depth = 0;
  $step = 0;

  if(isset($explode_url[1])){
    $ref = $explode_url[1];
  }

  $user_name = $_SESSION['user_name'];
?>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style media="screen">
  .ftco-navbar-light{
    padding-top:38px;
    top:0;
    background: linear-gradient(45deg, #76a5ee 0%, #ef788e 100%) !important;
  }
</style>

<div class="container" style="margin-top:8rem;">
  <div class="row">

    <div class="col-md-12 my-5">
      <h2>글쓰기</h2>
      <hr>
      <div class="table-responsive">

        <form action="/DB/write_form.php" method="post" onsubmit="return false;">

          <div class="form-group">
            <label for="Titleinput">제목</label>
            <input type="text" class="form-control" id="Titleinput" name="Titleinput" placeholder="제목을 입력하세요">
          </div>

          <input type="hidden" class="form-control" id="UserName" name="UserName" value="<?=$_SESSION['user_id']?>">

          <div class="form-group mt-3">
            <label for="ContentsForm">내용</label>
            <textarea class="form-control" name="ContentsForm" id="summernote" placeholder="내용을 입력하세요"></textarea>
          </div>

          <!-- <input type="hidden" name="UploadImg" style="display:none;"> -->
          <input type="hidden" name="Ref" value="<?=$ref?>" style="display:none;">
          <div class="form-group" style="text-align:right;">
            <button type="submit" class="btn btn-success" id="submit">제출</button>
            <button type="button" class="btn btn-default" style="border: 1px solid #adadad;" onclick="history.back(-1)">뒤로가기</button>
          </div>

        </form>
      </div>
    </div>

  </div>
 </div>
 <script type="text/javascript">
   $(document).ready(function(){
     $("#submit").on("click",function(){
       if($("input[name=Titleinput]").val() != "" && $('#summernote').val() != ""){
         $("form").attr('onsubmit','return true');
       }else{
         alert("빈칸이 있습니다.");
       }
     });

     // summernote api
     $('#summernote').summernote({
       height: 500,
       minHeight: null,
       maxHeight: null,
       focus : true,
       lang: "ko-KR",
       callbacks : {
         onImageUpload: function(files, editor, welEditable){
           sendFile(files[0], editor, welEditable);
         }
       }
     });

     function sendFile(file,editor,welEditable) {
       data = new FormData();
       data.append("file", file);
        $.ajax({
          url: "/proc/saveimage_ajax.php", // image 저장 소스
          data: data,
          cache: false,
          contentType: false,
          processData: false,
          type: 'POST',
          success: function(data){
           // alert(data);
           var image = $('<img>').attr('src', '' + data); // 에디터에 img 태그로 저장을 하기 위함
           image.attr('style','width:50%');
           $('#summernote').summernote("insertNode", image[0]); // summernote 에디터에 img 태그를 보여줌
           $("input[name=UploadImg]").val(data);
          },
          error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus+" "+errorThrown);
          }
        });
       }

   });
 </script>
<?php
  include_once "footer.php";
 ?>
