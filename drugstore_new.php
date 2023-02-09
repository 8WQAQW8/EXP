<?php require_once('./Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once('./split_file/php_lib_new.php'); ?>
<!doctype html>

<html lang="zh-TW">

<head>
    <!-- 引入網頁標頭 -->
    <?php require_once("./split_file/headfile.php"); ?>
</head>
<style>
    .modal-backdrop.show {
        opacity: 0.6;
    }
</style>

<body>
    <!-- Modal -->
    <?php //require_once("./split_file/Modal.php"); 
    ?>
    <section id="header">
        <!-- 開頭 -->
        <?php require_once("./split_file/header.php"); ?>
        <!-- 引入導覽列 -->
        <?php require_once("./split_file/navbar.php"); ?>
    </section>
    <section id="content">
    </section>
    <section id="content-mid">
        <div class="container text-center">
            <div class="row col-md-12">
                <div class="col-md-12 picnew">
                    <h1><i class="fa-regular fa-thumbs-up fa-lg"></i>新品上市</h1>
                </div>
            </div>
            <!-- 建立類別分項 -->
            <?php require_once('./split_file/breadcrumb_new.php'); ?>
        </div>
        <!-- 新商品 -->
        <?php require_once('./split_file/new_product.php'); ?>
        <!-- 影片 宣導文字 -->
        <?php require_once('./split_file/video_text.php'); ?>
    </section>
    <section id="footer">
        <!-- 聯絡資訊 -->
        <?php require_once('./split_file/footer.php'); ?>
    </section>
    <!-- javascript檔 -->
    <?php require_once('./split_file/jsfile.php'); ?>
</body>


</html>