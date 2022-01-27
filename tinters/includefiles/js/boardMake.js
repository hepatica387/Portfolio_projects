function board_make() {
	var x = document.make_frm

		if (x.group_chk.checked==false)
		{
			if (x.board_group.value == "" ){
				alert("게시판 그룹이름을 입력하세요");
				x.board_group.focus();
				return false;}
			else{
				if (x.board_group.value.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/) != -1) {
				alert("게시판 그룹이름은 한글을 사용할수 없습니다.\n\n영문으로 입력하세요");
				x.board_group.value = "";
				x.board_group.focus();
				return false;}
				}
		}

	if (x.table_chk.checked==false)
		{
			if (x.db_table.value == "" ){
				alert("테이블명을 입력하세요");
				x.db_table.focus();
				return false;}
			else{
				if (x.db_table.value.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/) != -1) {
				alert("테이블명은 한글을 사용할수 없습니다.\n\n영문으로 입력하세요");
				x.db_table.value = "";
				x.db_table.focus();
				return false;}
				}
		}


	if (x.boardid.value == "" ){
		alert("게시판 아이디를 입력하세요");
		x.boardid.focus();
		return false;}
	else{
		if (x.boardid.value.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/) != -1) {
		alert("게시판 아이디는 한글을 사용할수 없습니다.\n\n영문으로 입력하세요");
		x.boardid.value = "";
		x.boardid.focus();
		return false;}
	}
	 if (x.boardid.value.length < 4 ){
		alert("게시판 아이디는 3글자 이상입력해야 합니다.");
		x.boardid.focus();
		return false;}	


	if (x.title.value == "" ){
		alert("게시판 이름을 입력하세요");
		x.title.focus();
		return false;}
	if (!x.table_width.value)
	{	alert("게시판 가로 길이를 입력하세요");
		x.table_width.focus();
		return false;
	}
	if (isNaN(x.table_width.value))
	{	alert("게시판 가로 길이는 숫자로만 입력해야 합니다.");
		x.table_width.focus();
		return false;
	}


	x.submit();
	return;
}

function tbl_chk(){
		if (document.make_frm.table_chk.checked == true) {
			table.style.display = 'none';
			old_table.style.display = '';
		}else {
			old_table.style.display = 'none';
			table.style.display = '';
		}
		}
function grp_chk(){
		if (document.make_frm.group_chk.checked == true) {
			group_table.style.display = 'none';
			group_old_table.style.display = '';
		}else {
			group_old_table.style.display = 'none';
			group_table.style.display = '';
		}
}