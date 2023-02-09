<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once('split_file/php_lib_new.php'); ?>
<!doctype html>

<html lang="zh-TW">

<head>
    <!-- 引入網頁標頭 -->
    <?php require_once("./split_file/headfile.php"); ?>
    <style type="text/css">
        /*輸入有錯誤時，顯示紅框*/
        table input:invalid {
            border: solid red 6px;
        }
    </style>
</head>

<body>
    <section id="header">
        <!-- 開頭 -->
        <?php require_once("./split_file/header.php"); ?>
        <!-- 引入導覽列 -->
        <?php require_once("./split_file/navbar.php"); ?>
    </section>
    <section id="content">

    </section>
    <section id="content-mid">
        <!-- 熱銷商品 -->
        <?php require_once("./split_file/hotcart.php"); ?>
        <!-- 購物車內容模組 -->
        <?php require_once("./split_file/cart_content.php");
        ?>
        <!-- 影片 宣導文字 -->
        <?php require_once('./split_file/video_text.php'); ?>
    </section>
    <section id="footer">
        <!-- 聯絡資訊 -->
        <?php require_once('./split_file/footer.php'); ?>
    </section>
    <!-- javascript檔 -->
    <?php require_once('./split_file/jsfile.php'); ?>
    <script type="text/javascript">
        //更改數量寫入資料庫
        $("input").change(function() {
            var qty = $(this).val();
            const cartid = $(this).attr("cartid");
            if (qty <= 0 || qty >= 50) {
                alert("請更改數量，需大於0，以及小於50。")
                return false;
            }
            $.ajax({
                url: './split_file/change_qty.php',
                type: 'post',
                dataType: 'json',
                data: {
                    cartid: cartid,
                    qty: qty,
                },
                success: function(data) {
                    if (data.c == true) {
                        //alert(data.m);
                        window.location.reload();
                    } else {
                        alert(data.m);
                    }
                },
                error: function(data) {
                    alert("系統目前無法連接到後台資料庫。");
                }
            });
        });
    </script>
</body>

</html>
<?php
//判斷$num是否等於$chkPoint，若是則回傳active，可用於設定起始分頁carousel
function activeShow($num, $chkPoint)
{
    return (($num == $chkPoint) ? "active" : "");
}
?>