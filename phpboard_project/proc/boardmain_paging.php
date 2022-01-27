<?php
  $url = $_SERVER["REQUEST_URI"];

  // 페이징
  $max_page_num = 10;
  $block = 5;
  $t = 0;

  $result_num = CountList($dbconn);
  $all_page = ($result_num/$max_page_num);

  if($result_num % $max_page_num >= 0)
    $max_page = ceil($all_page);

  $block_num = $max_page;
  // $block_num = ceil($max_page/$block);
  $now_page = ceil($all_page/$block);

  // 페이징 변수 있는지 확인
  $explode_url = explode("?", $url);
  if(count($explode_url) >= 2){
    $board_explode = explode("page=", $explode_url[1]);
    $now_page = $board_explode[1];

    // 페이징이 한자리 수이면 0으로 땜
    $now_page = substr($now_page,1);
    $t = ($now_page - 1) * $max_page_num;

    // 없는 페이징이면 내보내기
    if($now_page > $max_page){
      echo "<script>alert('다음 게시물이 없습니다!')</script>";
      echo "<script>history.back(-1)</script>";
      exit;
    }else if($now_page <= 0){
      echo "<script>alert('이전 게시물이 없습니다!')</script>";
      echo "<script>history.back(-1)</script>";
      exit;
    }

    $now_page = $now_page;
  }

  // 한자리 숫자이면 앞에 0붙여주는 함수
  function PagingNum($now_page){
    $page_len = strlen($now_page);
    if($page_len == 1)
      $page = "0".$now_page;

    return $page;
  }
  function BeforePagingNum($now_page){
    $page_len = strlen($now_page);
    if($page_len == 1)
      $now_page--;
    $page = "0".$now_page;

    return $page;
  }
  function NextPagingNum($now_page){
    $page_len = strlen($now_page);
    if($page_len == 1)
      $now_page++;
    $page = "0".$now_page;

    return $page;
  }
  $result1 = SelectList_Main($dbconn, $t);
  $n = $result_num - $max_page_num * ($now_page - 1);    // 게시판 번호
 ?>
