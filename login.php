<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once('split_file/php_lib_new.php'); ?>
<?php
//取得要返回的php頁面
if (isset($_GET['sPath'])) {
    $sPath = $_GET['sPath'] . ".php";
} else {
    //登入完成預設要進入首頁
    $sPath = "index.php";
}
//檢查是否完成登入驗證
if (isset($_SESSION['login'])) {
    header(sprintf("location:%s", $sPath));
}
?>
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
    <div>
        <section id="header">
            <!-- 開頭 -->
            <?php require_once("./split_file/header.php"); ?>
            <!-- 引入導覽列 -->
            <?php require_once("./split_file/navbar.php"); ?>
        </section>
        <section id="content">

        </section>
        <!-- 會員登入頁面 -->
        <section id="content-mid">
            <div class="container" style="margin-top: 30vh;">
                <div class="col-md-12">
                    <div class="row col-md-6 mx-auto">
                        <div class="card login-card-border">
                            <div class="card-body">
                                <h1 class="card-title mt-3 text-center">登入會員</h1>
                                <form action="" method="POST" id="form1">
                                    <div class="form-group">
                                        <h5><label for="exampleInputEmail1">帳號</label><label for="exampleInputEmail1" class="ms-1">（電子郵件）</label></h5>
                                        <input type="email" id="inputAccount" name="inputAccount" class="form-control" placeholder="Account" required autofocus aria-describedby="emailHelp">
                                    </div>
                                    <div class="form-group mt-3">
                                        <h5><label for="exampleInputPassword1">密碼</label><small><a href="#" class="ms-3 color-form-text">忘記密碼請點我</a></small></h5>
                                        <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
                                    </div>
                                    <div class="mx-auto col-5 col-md-3 d-grid gap-2"><button type="submit" class="btn btn-green mt-3 "><span>登入</span></button></div>
                                    <div class="text-center mt-2"><span>還不是會員？</span><a href="./register.php" class="ms-3 color-form-text">請點我註冊</a></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <!-- 影片 宣導文字 -->
            <?php require_once('./split_file/video_text.php'); ?>
        </section>
        <section id="footer">
            <!-- 聯絡資訊 -->
            <?php require_once('./split_file/footer.php'); ?>
        </section>
    </div>
    <!-- javascript檔 -->
    <?php require_once('./split_file/jsfile.php'); ?>
    <script type="text/javascript" src="./js/commlib.js"></script>
    <div id="loading" name="loading" class="loginreloadbg"><i class="fas fa-spinner fa-spin fa-5x fa-fw loginreload"></i>
    </div>
    <script type="text/javascript">
        $(function() {
            $("#form1").submit(function() {
                const inputAccount = $("#inputAccount").val();
                const inputPassword = MD5($("#inputPassword").val());
                $("#loading").show();
                //利用$ajax函數呼叫後台的auth_user.php驗證帳號密碼
                $.ajax({
                    url: './split_file/auth_user.php',
                    type: 'post',
                    async: false,  //async(非同步函式)默認是true;false(改為同步請求)
                    dataType: 'json',
                    data: {
                        inputAccount: inputAccount,
                        inputPassword: inputPassword,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            //window.location.reload();
                            window.location.href = "<?php echo $sPath; ?>";
                        } else {
                            alert(data.m);
                        }
                    },
                    error: function(data) {
                        alert("error");
                    }
                });
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