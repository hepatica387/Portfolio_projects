function board_make() {
	var x = document.make_frm
	if (x.db_table.value == "" ){
		alert("���̺���� �Է��ϼ���");
		x.db_table.focus();
		return false;}
	else{
		if (x.db_table.value.search(/[��-��|��-��|��-��]/) != -1) {
		alert("���̺���� �ѱ��� ����Ҽ� �����ϴ�.\n\n�������� �Է��ϼ���");
		x.db_table.value = "";
		x.db_table.focus();
		return false;}
		}
	if (x.boardid.value == "" ){
		alert("�Խ��� ���̵� �Է��ϼ���");
		x.boardid.focus();
		return false;}
	else{
		if (x.boardid.value.search(/[��-��|��-��|��-��]/) != -1) {
		alert("�Խ��� ���̵�� �ѱ��� ����Ҽ� �����ϴ�.\n\n�������� �Է��ϼ���");
		x.boardid.value = "";
		x.boardid.focus();
		return false;}
	}
	if (x.title.value == "" ){
		alert("�Խ��� �̸��� �Է��ϼ���");
		x.title.focus();
		return false;}


	x.submit();
	return;
}