<?php

	$host = 'localhost:3307';
	$user = 'test';
	$password = 'test1';
	$dbname = 'test_tb';

	$dbconn = mysqli_connect($host,$user,$password,$dbname);

	if ( mysqli_connect_errno() )
	{
		echo "DB 연결에 실패했습니다 " . mysqli_connect_error();
	}
	
	// HY000/2002 에러 코드 : 접근거부 => 포트문제

	mysqli_set_charset($dbconn, 'utf8');

?>
