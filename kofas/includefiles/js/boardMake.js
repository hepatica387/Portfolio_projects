function board_make() {
	var x = document.make_frm

		if (x.group_chk.checked==false)
		{
			if (x.board_group.value == "" ){
				alert("�Խ��� �׷��̸��� �Է��ϼ���");
				x.board_group.focus();
				return false;}
			else{
				if (x.board_group.value.search(/[��-��|��-��|��-��]/) != -1) {
				alert("�Խ��� �׷��̸��� �ѱ��� ����Ҽ� �����ϴ�.\n\n�������� �Է��ϼ���");
				x.board_group.value = "";
				x.board_group.focus();
				return false;}
				}
		}

	if (x.table_chk.checked==false)
		{
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
	 if (x.boardid.value.length < 4 ){
		alert("�Խ��� ���̵�� 3���� �̻��Է��ؾ� �մϴ�.");
		x.boardid.focus();
		return false;}	


	if (x.title.value == "" ){
		alert("�Խ��� �̸��� �Է��ϼ���");
		x.title.focus();
		return false;}
	if (!x.table_width.value)
	{	alert("�Խ��� ���� ���̸� �Է��ϼ���");
		x.table_width.focus();
		return false;
	}
	if (isNaN(x.table_width.value))
	{	alert("�Խ��� ���� ���̴� ���ڷθ� �Է��ؾ� �մϴ�.");
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