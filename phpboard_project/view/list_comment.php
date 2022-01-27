<div class="input-comt mt-4">
  <form class="nform_comment" method="post" action="/DB/comments_form.php">
    <div class="col-md-12 black">
      <input type="hidden" name="list_info" value="<?=$list_info?>">
      <div class="form-group">
        <textarea class="form-control" name="uesr_comments" rows="5"><?=$comt_result['comment']?></textarea>
      </div>
      <div class="form-group txt-right">
        <input type="hidden" name="UserName" value="<?=$user_name?>">
        <button type="submit" class="btn btn-success refh-btn">등록</button>
      </div>
    </div>
  </form>
</div>
