<?php  
	
	$_from = $_POST['from'];
	$_to =  'pizziandrea9@gmail.com';
	$_message = "<p>Thank to buy the tikets, get it</p>";
	$_object = "Test email";
	$headers[] = 'MIME-Version: 1.0';
	$headers[] = 'Content-type: text/html; charset=utf-8';
	mail($_to,$_object,  $_message, implode("\r\n", $headers));

	
	
?>
