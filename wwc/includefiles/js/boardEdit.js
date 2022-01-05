function board_make() {
	var x = document.make_frm
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
	if (x.title.value == "" ){
		alert("게시판 이름을 입력하세요");
		x.title.focus();
		return false;}


	x.submit();
	return;
}