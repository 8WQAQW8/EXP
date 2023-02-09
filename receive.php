<?php
require_once('./Connections/conn_db.php');
//建立結帳表格資料庫查詢
$query="INSERT INTO ecpay (TradeNo,TotalAmount,TradeDesc,ChoosePayment)VALUES('".$_POST['MerchantTradeNo']."','2000','good to drink','Credit')";
    $result=$link->query($query);
    return;
?>