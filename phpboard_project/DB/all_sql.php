<?php
  // error_reporting(E_ALL);
  // ini_set("display_errors", 1);
  include_once "db_conn.php";

  if (mysqli_connect_errno()){
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit;
  }

  /* index */
  function SelectList($dbconn){
    $sql = "SELECT * from test_board ORDER BY ref DESC, step LIMIT 7";
    $result = mysqli_query($dbconn,$sql);

    return $result;
  }

  /* boardmain */
  function CountList($dbconn){
    $sql = "SELECT COUNT(*) FROM test_board";
    $result = mysqli_query($dbconn, $sql);
    $num = mysqli_fetch_array($result);

    return $num['COUNT(*)'];
  }
  function SelectList_Main($dbconn, $page_num){
    $sql = "SELECT * FROM test_board ORDER BY ref DESC, step LIMIT $page_num, 10";
    $result = mysqli_query($dbconn, $sql);

    return $result;
  }
  function SelectListAsc($dbconn, $page_num){
    $sql = "SELECT * FROM test_board ORDER BY rowid ASC LIMIT $page_num, 10";
    $result = mysqli_query($dbconn, $sql);

    // return $result;
  }

  /* write */
  function InsertAdd($dbconn, $title, $content, $user_name, $date, $user_ip, $view, $ref, $depth, $step){
    $upd_ref = $ref;

    // 글쓰기
    if($ref == 0){
      $sel_ref = "SELECT MAX(ref) FROM test_board";
      $result = mysqli_query($dbconn,$sel_ref);
      $array_ref = mysqli_fetch_array($result);
      $ref = $array_ref['MAX(ref)']+1;
    }

    $sql = "INSERT INTO test_board VALUES(0,'$title', '$content', '$user_name', $date, '$user_ip', $view, $ref, $depth, $step)";
    mysqli_query($dbconn,$sql);

    // 답변글
    if($upd_ref != 0){
      $updt = "UPDATE test_board a SET a.depth = (SELECT depth FROM test_board WHERE ref = $ref ORDER BY rowid DESC LIMIT 1)+1, a.step = (SELECT MAX(step) FROM test_board WHERE ref = $ref)+1 WHERE a.rowid = (SELECT rowid FROM test_board WHERE ref = $ref ORDER BY rowid DESC LIMIT 1)";
      mysqli_query($dbconn,$updt);
    }
  }

  /* edit */
  function EditSelect($dbconn, $rowid){
    $sql = "select * from test_board where rowid=".$rowid;
    $result = mysqli_query($dbconn, $sql);

    return $result;
  }

  function UpdateList($dbconn, $board_num, $title, $contents){
    $sql = "update test_board set title='".$title."', content='".$contents."' where rowid=".$board_num;
    $result = mysqli_query($dbconn, $sql);

    return $result;
  }

  /* delete */
  function DeleteWrite($dbconn, $rowid){
    $sql = "delete from test_board where rowid=".$rowid;
    $result = mysqli_query($dbconn, $sql);
  }

  /* deatil view */
  function DetailView($dbconn, $rowid){
    $sql = "select * from test_board where rowid=".$rowid;
    $result = mysqli_query($dbconn, $sql);

    return $result;
  }

  function BoardAddView($dbconn, $rowid){
    $sql = "UPDATE test_board SET view = view + 1 where rowid = $rowid";
    $result = mysqli_query($dbconn, $sql);
  }

  // 댓글
  function ListComment($dbconn, $list_num){
    $sql = "SELECT * FROM board_comment WHERE list_num = $list_num ORDER BY ref DESC, step";
    $result = mysqli_query($dbconn, $sql);

    return $result;
  }
  function InsertComments($dbconn, $list_num, $user_id, $user_name, $comment, $user_ip, $ref, $depth, $step){
    $upd_ref = $ref;

    // 새댓글
    if($ref == 0){
      $sel_ref = "SELECT MAX(ref) FROM board_comment";
      $ref_result = mysqli_query($dbconn, $sel_ref);
      $max_ref = mysqli_fetch_array($ref_result);
      $ref = $max_ref['MAX(ref)']+1;
    }

    $sql = "INSERT INTO board_comment VALUES(0, $list_num,'$user_id','$user_name', '$comment',NOW(),'$user_ip', $ref, $depth, $step)";
    mysqli_query($dbconn, $sql);

    // 대댓글
    if($upd_ref != 0){
      $updt = "UPDATE board_comment a SET a.depth = (SELECT depth FROM board_comment WHERE ref = $ref ORDER BY rowid DESC LIMIT 1)+1, a.step = (SELECT MAX(step) FROM board_comment WHERE ref = $ref)+1 WHERE a.rowid = (SELECT rowid FROM board_comment WHERE ref = $ref ORDER BY rowid DESC LIMIT 1)";
      mysqli_query($dbconn,$updt);
    }
  }
  function UpdtSelComment($dbconn, $rowid, $comment){
    $sql = "UPDATE board_comment SET comment = '$comment' WHERE  rowid = $rowid";
    $result = mysqli_query($dbconn, $sql);
  }
  function DelComment($dbconn, $rowid){
    $sql = "Delete From board_comment WHERE rowid = $rowid";
    $result = mysqli_query($dbconn, $sql);
  }

 ?>
