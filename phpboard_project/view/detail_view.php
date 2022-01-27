<?php
  include_once "header.php";

  if (!isset($url))
    exit;

  if(isset($_SESSION['user_id'])){
    $user_id = $_SESSION['user_id'];
    $user_result = SelectUser($dbconn, $user_id);
    $user_row = mysqli_fetch_array($user_result);
    $user_name = $user_row["name"];
  }else{
    $user_id = "";
    $user_name = "";
  }

  // 페이지 번호와 리스트 번호 추출
  $explode_url = explode("?", $url);
  $board_explode = explode("&", $explode_url[1]);
  $page = $board_explode[0];
  $board_num = $board_explode[1];

  // 번호에 해당한 리스트를 디비에 검색
  $result = DetailView($dbconn, $board_num);
  $row = mysqli_fetch_array($result);

  if(empty($row["rowid"])){
    echo "<script>alert('없는 게시물입니다.')</script>";
    echo "<script>location.href='/view/boardmain.php'</script>";
    exit;
  }else{
    // 쿠키로 조회수 판단
    if(!isset($_COOKIE["list_view"])){
      $view_result = BoardAddView($dbconn, $row["rowid"]);
      setcookie("list_view","boardlist_".$row['rowid'],time() + 86400);
    }else{
      $rowid = (string)$row['rowid'];
      $cut_cookie = explode("_",$_COOKIE['list_view']);

      if(in_array($rowid,$cut_cookie) !== true){
        $view_result = BoardAddView($dbconn, $row["rowid"]);
        setcookie("list_view",$_COOKIE["list_view"]."_".$row['rowid'],time() + 86400);
      }

    }
  }

  $list_num = $row["rowid"];
  $ref = $row['ref'];
  $depth = $row['depth'];
  $step = $row['step'];
  $bd_info = $ref."&".$depth."&".$step;
  $list_info = $row['rowid']."&".$user_id."&".$user_name;

?>
<style media="screen">
  .ftco-navbar-light{padding:0;top:0;background: linear-gradient(45deg, #76a5ee 0%, #ef788e 100%) !important;}
</style>

<div class="container" style="margin-top:8rem;">
  <div class="row">
    <div class="col-md-12 p-0">
      <h2><?=$row["title"]?></h2>
      <div class="col-md-12 p-0">
        <span>작성자: <?=$row["name"]?></span>
        <span><?=$row["date"]?></span>
      </div>
    </div>
    <div class="col-md-12 dt-cont-line">
      <p class="col-md-12 p-0" style="white-space: pre-wrap;"><?=$row["content"]?></p>
    </div>
    <div class="col-md-12 mb-45 p-0" style="text-align:right;">
      <?php if($row["name"] == $user_name || $user_name == "admin"): ?>
      <button type="button" class="btn btn-warning white" id="EditWrite">글수정</button>
      <button type="button" class="btn btn-danger" id="DelWrite">글삭제</button>
      <?php endif; ?>

      <button type="button" class="btn btn-success" onclick="location.href='write.php?<?=$bd_info?>'">답변</button>
      <button type="button" class="btn btn-default" style="border: 1px solid #adadad;" onclick="location.href='boardmain.php?page=<?=$page?>'">목록</button>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12 mb-5 p-0 bd-gray" id="ComtList">
         <?php
           $sel_comt = ListComment($dbconn, $list_num);

           while($comt_result = mysqli_fetch_array($sel_comt)){
         ?>
         <div class="comt-dv">
           <form class="form_comment" method="post" action="/DB/comments_form.php">
             <div class="comt-form">
               <div class="col-md-12">
                 <?php if($comt_result['depth'] > 0):?>
                 <span>
                   <?php
                     $null = "&nbsp";
                     for($i = 0; $i <= $comt_result['depth'];$i++){
                   ?><?=$null?>
                 <?php } ?>
                 └ <?=$comt_result['user_name']?></span>
                 <?php else: ?>
                 <span><?=$comt_result['user_name']?></span>
                 <?php endif; ?>
                 <span><?=$comt_result['comt_date']?></span>
               </div>
               <div class="col-md-12 wb-brk-all"><?=$comt_result['comment']?></div>
               <div class="col-md-12" style="text-align:right;">
                 <?php if($comt_result["user_name"] == $user_name || $user_name == "admin"): ?>
                 <span class="span-o spedit">[수정]</span>
                 <a href="delete_comment.php?<?=$comt_result['rowid']?>"><span class="span-r spdel">[삭제]</span></a>
                 <?php endif; ?>
                 <span class="cik-comt">[답글]</span>
               </div>
               <input type="hidden" name="comt_rds" value="<?=$comt_result['ref']."&".$comt_result['depth']."&".$comt_result['step']?>">
             </div>

             <div class="col-md-12 mt-4 edit_comt black hide">
               <input type="hidden" name="list_info" value="<?=$list_info?>&<?=$comt_result['rowid']?>">
               <input type="hidden" name="comt_type" value="">
               <div class="form-group">
                 <textarea class="form-control" name="uesr_comments" rows="5"></textarea>
               </div>
               <div class="form-group txt-right">
                 <input type="hidden" name="UserName" value="<?=$user_name?>">
                 <button type="submit" class="btn btn-success refh-btn" id="submit">등록</button>
               </div>
             </div>
           </form>
         </div>
         <?php } ?>
         <?php include_once "list_comment.php"; ?>

      <div class="col-md-12 mt-4 mb-4 CikComtBtn right black hide">
        <button type="button" name="new_comt" class="btn btn-success">새댓글</button>
      </div>
    </div>
  </div>

</div>

<script type="text/javascript">
  $(document).ready(function(){
    $("#EditWrite").on("click", function(){
      location.href="edit.php?<?=$page?>&<?=$list_num?>";
    });
    $("#DelWrite").on("click", function(){
      location.href="delete.php?<?=$page?>&<?=$list_num?>";
    });
    $("button[name=new_comt]").on("click",function(){
      $('.CikComtBtn').hide();
      $('.edit_comt').hide();
      $('.input-comt').show();
    });
    $('.cik-comt').on("click",function(){
      var txt = "";
      $('.CikComtBtn').show();
      $('.edit_comt').hide();
      $('.input-comt').hide();
      $('input[name=comt_type]').val("comt");
      $(this).parent().parent().parent().children().eq(1).children().eq(2).children().eq(0).val(txt);
      $(this).parent().parent().parent().children().eq(1).show();
    });
    $('.spedit').on("click",function(){
      var txt = $(this).parent().parent().children().eq(1).text();
      $('.CikComtBtn').show();
      $('.edit_comt').hide();
      $('.input-comt').hide();
      $('input[name=comt_type]').val("updt");
      $(this).parent().parent().parent().children().eq(1).children().eq(2).children().eq(0).val(txt);
      $(this).parent().parent().parent().children().eq(1).show();
    });
    $('.refh-btn').on("click", function(){
      location.reload();
    });
  });
</script>
<?php
  include_once "footer.php";
 ?>
