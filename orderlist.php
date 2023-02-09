<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once('split_file/php_lib_orderlist.php'); ?>
<?php
if (!isset($_SESSION['login'])) {
    $sPath = "login.php?sPath=orderlist";
    header(sprintf("Location:%s", $sPath));
}
?>
<!doctype html>

<html lang="zh-TW">

<head>
    <!-- 引入網頁標頭 -->
    <?php require_once("./split_file/headfile.php"); ?>
</head>
<style>

</style>

<body>
    <div>
        <section id="header">
            <!-- 開頭 -->
            <?php require_once("./split_file/header.php"); ?>
            <!-- 引入導覽列 -->
            <?php require_once("./split_file/navbar.php"); ?>
        </section>
        <section id="content">
        </section>
        <section id="content-mid">
            <!-- 引入訂單查詢 -->
            <?php require_once('./split_file/order_content.php'); ?>
            <!-- 影片 宣導文字 -->
            <?php //require_once('./split_file/video_text.php'); ?>
        </section>
        <section id="footer">
            <!-- 聯絡資訊 -->
            <?php require_once('./split_file/footer.php'); ?>
        </section>
    </div>
    <!-- javascript檔 -->
    <?php require_once('./split_file/jsfile.php'); ?>
</body>


</html>
<?php

?>
<?php
//判斷$num是否等於$chkPoint，若是則回傳active，可用於設定起始分頁carousel
function activeShow($num, $chkPoint)
{
    return (($num == $chkPoint) ? "active" : "");
}
?>