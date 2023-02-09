<div class="container-fluid">
    <div class="row aaa">
        <div class="col-md-6 col-6 header-img">
            <a href="https://www.youtube.com/" target="_blank"> <img src="./images/yt_icon.png" alt="yt"></a>
            <a href="https://www.facebook.com/" target="_blank"><img src="./images/FB-Icon.png" alt="FB"></a>
            <a href="https://www.instagram.com/" target="_blank"><img src="./images/Instagram_icon.png" alt="Instagram"></a>
        </div>
        <div class="Register col-6 col-md-6">
            <?php if (!isset($_SESSION['login'])) { ?>
                <a href="./register.php"><i class="fa-solid fa-registered fa-fw"></i><span class="regword">會員註冊</span></a>
                &nbsp;&nbsp;
            <?php } ?>
            <?php if (isset($_SESSION['login'])) { ?>
                <a href="javascript:void(0);" onclick="btn_confirmLink('是否確定登出?','./split_file/logout.php')"><i class="fa-sharp fa-solid fa-right-from-bracket fa-fw"></i><span class="regword">會員登出</span></a>
            <?php } else { ?>
                <a href="./login.php"><i class="fa-sharp fa-solid fa-right-to-bracket fa-fw"></i><span class="regword">會員登入</span></a>
            <?php } ?>
            <!-- <a href="#"><i class="fa-sharp fa-solid fa-right-to-bracket fa-fw"></i><span class="regword">登入</span></a> -->
        </div>
    </div>
</div>