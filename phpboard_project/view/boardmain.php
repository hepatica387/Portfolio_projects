<?php
  include_once "header.php";
  include_once $link."/proc/boardmain_paging.php";
 ?>
 <style media="screen">
   .ftco-navbar-light{padding:0;top:0;background: linear-gradient(45deg, #76a5ee 0%, #ef788e 100%) !important;}
 </style>

 <div class="container" style="margin-top:3rem;">
   <div class="row">
     <div class="col-md-12 my-5 p-0">
       <h2>게시판</h2>
       <hr>
       <div class="table-responsive">
         <table class="table table-striped">
           <tr class="center">
             <th>번호</th>
             <th>제목</th>
             <th>작성자</th>
             <th>날짜</th>
             <th>조회수</th>
           </tr>
           <?php
             while ($row = mysqli_fetch_array($result1)){
           ?>
               <tr class="dt_click" id="num<?=$row['rowid']?>">
                 <td><?=floor($n)?></td>
                 <?php if($row['depth'] > 0):?>
                 <td class="t-overflow">
                 <?php
                   $null = "&nbsp";
                   for($i = 0; $i <= $row['depth'];$i++){
                 ?>
                 <?=$null?>
                  <?php } ?>
                 └ <?=$row['title']?></td>
                <?php else:?>
                 <td>
                   <div class="t-overflow" style="width:300px;">
                     <?=$row['title']?>
                   </div>
                 </td>
                 <?php endif;?>
                 <td><?=$row['name']?></td>
                 <td><?=$row['date']?></td>
                 <td><?=$row['view']?></td>
               </tr>
           <?php
                $n--;
               }
           ?>
         </table>
       </div>

       <div class="col-md-12 p-0 txt-center">
         <a href="boardmain.php?page=<?=BeforePagingNum($now_page)?>">이전</a>
         <?php for($i=1;$i<=$block_num;$i++){ ?>
         <a href="boardmain.php?page=<?=PagingNum($i)?>"><?=$i?></a>
         <?php } ?>
         <a href="boardmain.php?page=<?=NextPagingNum($now_page)?>">다음</a>
       </div>

       <div class="col-md-12 p-0" style="text-align:right;">
         <button type="button" class="btn btn-success" onclick="location.href='write.php'">글쓰기</button>
       </div>

     </div>
   </div>
 </div>

 <script type="text/javascript">
   $(document).ready(function(){
      // 게시판 글 클릭시 발생
      $(".dt_click").on("click",function(){
        BoardListNum = $(this).attr("id");
        BoardListNum = BoardListNum.replace("num","");
        location.href="detail_view.php?<?=PagingNum($now_page)?>&"+BoardListNum+"";
      });
   });
 </script>
<?php
    include_once "footer.php";
 ?>
