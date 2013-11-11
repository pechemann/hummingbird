<?php
$msg = isset($_GET['name']) ? 'Hello ' . $_GET['name'] . '!' : 'error: name value not detected';
echo utf8_encode($msg);
?>