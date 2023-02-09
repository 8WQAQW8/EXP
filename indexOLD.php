<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<!doctype html>
<html lang="zh-TW">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="./images/seafood-icon.png" type="image/png" size="72*72" />
    <link rel="stylesheet" href="./bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/animate.min.css">
    <link rel="stylesheet" href="./css/morphext.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.2.0/css/all.css">
    <link rel="stylesheet" href="./OwlCarousel2-2.3.4/dist/assets/owl.carousel.css">
    <link rel="stylesheet" href="./OwlCarousel2-2.3.4/dist/assets/owl.theme.default.css">
    <link rel="stylesheet" href="./css/header_style.css">
    <link rel="stylesheet" href="./css/content_style.css">
    <link rel="stylesheet" href="./css/footer_style.css">
    <title>水產超市</title>
</head>
<style>
    .modal-backdrop.show {
        opacity: 0.6;
    }
</style>

<body>
    <!-- Modal -->
    <div class="modal fade" id="MyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel"><img src="./images/seafood-icon.png" alt="商標" style="height: 80px;margin:-20px 0;"><span style="margin-left: 12px;">水產超市</span></h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    &nbsp;&nbsp;<span style="color: red;font-size: 22px;">歡迎來到水產超市~~</span><br>
                    『海產』營養豐富、料理多元，滋味清爽鮮嫩。
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal"><span style="font-size: 16px;">關閉</span></button>
                </div>
            </div>
        </div>
    </div>
    <section id="header">
        <div class="container-fluid">
            <div class="row aaa">
                <div class="col-md-6 col-6 header-img">
                    <a href="#"> <img src="./images/yt_icon.png" alt="yt"></a>
                    <a href="#"><img src="./images/FB-Icon.png" alt="FB"></a>
                    <a href="#"><img src="./images/Instagram_icon.png" alt="Instagram"></a>
                </div>
                <div class="Register col-6 col-md-6">
                    <a href="#"><i class="fa-solid fa-registered fa-fw"></i><span class="regword">註冊</span></a>
                    &nbsp;&nbsp;
                    <a href="#"><i class="fa-sharp fa-solid fa-right-to-bracket fa-fw"></i><span class="regword">登入</span></a>
                    &nbsp;&nbsp;
                    <a href="#"><i class="fa-sharp fa-solid fa-cart-shopping fa-fw"></i><span class="shopword">購物車</span></a>
                </div>
            </div>

        </div>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top navbg navmr ">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.php"><img src="./images/seafood-icon.png" alt="回首頁" title="回首頁" id="navindex"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-auto">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="#">首頁</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">優惠活動</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">關於我們</a>
                        </li>
                        <?php
                        //列出產品類別第一層
                        $SQLstring = "SELECT * FROM pyclass WHERE level=1 ORDER BY sort";
                        $pyclass01 = $link->query($SQLstring);
                        $i = 1; //控制編號順序
                        ?>
                        <li class="nav-item dropdown ">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">線上購物</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
                                    <li class="dropdown-item dropdown-submenu"><a href="#" data-bs-toggle="dropdown" <?php if ($pyclass01_Rows['sort'] == 6) {
                                                                                                                            echo "class='dropdown-toggle'";
                                                                                                                        } ?>><?php echo $pyclass01_Rows['cname']; ?></a>
                                        <?php
                                        //列出產品類別第二層
                                        $SQLstring = sprintf(
                                            "SELECT * FROM pyclass where level=2 and uplink=%d order by sort",
                                            $pyclass01_Rows['classid']
                                        );
                                        $pyclass02 = $link->query($SQLstring);
                                        ?>
                                        <?php if ($pyclass02->rowCount() != 0) { ?>
                                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                                                    <li class="dropdown-item"><a href="#"><?php echo $pyclass02_Rows['cname']; ?></a></li>
                                                <?php } ?>
                                            </ul>
                                        <?php } ?>
                                    <?php } ?>
                                    </li>
                            </ul>
                        </li>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">購物說明</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">聯絡我們</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search..." aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </section>
    <section id="content">
        <div class="container-fluid">
            <div class="row rowmg">
                <?php
                //建立carousel查詢
                $SQLstring = "SELECT * FROM carousel WHERE caro_online=1 ORDER BY caro_sort";
                $carosel = $link->query($SQLstring);
                $i = 0; //控制active啟動
                ?>
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3500" data-bs-pause="false">
                    <div class="carousel-indicators">
                        <?php for ($i = 0; $i < $carosel->rowCount(); $i++) { ?>
                            <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="<?php echo $i; ?>" class="<?php echo activeShow($i, 0); ?>"></li>
                        <?php } ?>
                    </div>
                    <div class="carousel-inner">
                        <?php $i = 0;
                        while ($data = $carosel->fetch()) { ?>
                            <div class="carousel-item <?php echo activeShow($i, 0); ?>">
                                <img src="./images/<?php echo $data['caro_pic']; ?>" class="d-block w-100" alt="<?php echo $data['caro_alt']; ?>">
                                <div class="carousel-caption d-none d-md-block">
                                    <h1><?php echo $data['caro_title']; ?></h1>
                                    <p><?php echo $data['caro_content']; ?></p>
                                </div>
                            </div>
                        <?php $i++;
                        } ?>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </section>
    <section id="content-mid">
        <div class="container text-center">
            <div class="row pic">
                <div class="col-md-12">
                    <h1><i class="fa-solid fa-fire fa-lg"></i>熱銷推薦</h1>
                </div>
            </div>
            <div class="row">
                <div class="owl-carousel owl-theme">
                    <div class="item col-md-3">
                        <div class="card " style="width: 20rem;">
                            <img src="./images/北海道帆立貝450-300.png" class="card-img-top img-fluid" alt="北海道帆立貝">
                            <div class="card-body">
                                <h5 class="card-title">北海道帆立貝</h5>
                                <p class="card-text">$480 / 包</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/基隆大砲管450-300.png" class="card-img-top" alt="基隆大砲管">
                            <div class="card-body">
                                <h5 class="card-title">基隆大砲管</h5>
                                <p class="card-text">$569 / 隻</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/山泉鱸魚450-300.png" class="card-img-top" alt="山泉鱸魚">
                            <div class="card-body">
                                <h5 class="card-title">山泉鱸魚</h5>
                                <p class="card-text">$190 / 片</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/巨無霸明蝦450-300.png" class="card-img-top" alt="巨無霸明蝦">
                            <div class="card-body">
                                <h5 class="card-title">巨無霸明蝦</h5>
                                <p class="card-text">$1,680 / 盒</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/日本青森縣熟凍香螺450-300.png" class="card-img-top" alt="熟凍香螺">
                            <div class="card-body">
                                <h5 class="card-title">熟凍香螺</h5>
                                <p class="card-text">$350 / 包</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/北海道特等干貝450-300.png" class="card-img-top" alt="特等干貝">
                            <div class="card-body">
                                <h5 class="card-title">特等干貝</h5>
                                <p class="card-text">$1,150 / 包</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/巴拿馬白蝦450-300.png" class="card-img-top" alt="巴拿馬白蝦">
                            <div class="card-body">
                                <h5 class="card-title">巴拿馬白蝦</h5>
                                <p class="card-text">$300 / 盒</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/活凍竹蛤450-300.png" class="card-img-top" alt="活凍竹蛤">
                            <div class="card-body">
                                <h5 class="card-title">活凍竹蛤</h5>
                                <p class="card-text">$170 / 盒</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/生凍帝王蟹腳450-300.png" class="card-img-top" alt="生凍帝王蟹腳">
                            <div class="card-body">
                                <h5 class="card-title">生凍帝王蟹腳</h5>
                                <p class="card-text">$1,388 / 包</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/熟凍麵包蟹450-300.png" class="card-img-top" alt="熟凍麵包蟹">
                            <div class="card-body">
                                <h5 class="card-title">熟凍麵包蟹</h5>
                                <p class="card-text">$350 / 隻</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/特大鳳螺450-300.png" class="card-img-top" alt="特大鳳螺">
                            <div class="card-body">
                                <h5 class="card-title">特大鳳螺</h5>
                                <p class="card-text">$450 / 包</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-3">
                        <div class="card" style="width: 20rem;">
                            <img src="./images/生食級胭脂蝦450-300.png" class="card-img-top" alt="生食級胭脂蝦">
                            <div class="card-body">
                                <h5 class="card-title">生食級胭脂蝦</h5>
                                <p class="card-text">$399 / 盒</p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-green">放購物車</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container text-center">
            <div class="row vd">
                <div class="col-md-12">
                    <h1><i class="fa-solid fa-shrimp fa-lg"></i>海鮮烹飪教學影片</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 vdd">
                    <div class="video-background">
                        <video id="video-background" src="./video/簡易版西班牙海鮮燉飯｜快速上手異國料理·超簡單零失誤.mp4" muted loop plays-inline controls poster="./images/vid.png">
                        </video>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row rowGov">
                <div class="col-md-12">
                    <p class="text-center"> 政 府 政 策 Government policy</p>
                    <span>
                        1.為防治動物傳染病，境外動物或動物產品等應施檢疫物輸入我國，應符合動物檢疫規定，並依規定申請檢疫。擅自輸入應施檢疫物者最高可處7年以下有期徒刑，得併科新臺幣300萬元以下罰金。未依規定申請檢疫者，將課以新臺幣100萬元以下罰鍰，並得按次處罰。<br>
                        2.境外商品不得隨貨贈送應施檢疫物。<br>
                        3.收件人違反動物傳染病防治條例第34條第3項規定，未將郵遞寄送輸入之應施檢疫物送交輸出入動物檢疫機關銷燬者，處新臺幣3萬元以上15萬元以下罰鍰。
                    </span>
                </div>
            </div>
        </div>
    </section>
    <section id="footer">
        <div class="containar-fluid">
            <div class="row">
                <img src="./images/footerpic.png" alt="">
            </div>
            <div id="last-data" class="row text-center">
                <div class="col-md-12 parent">
                    <span class="col-md-12">中彰投分署科技股份有限公司 40767台中市西屯區工業區一路100號 電話：04-23592181 免付費電話：0800-7778<br>企業通過ISO/IEC27001認證，食品業者登錄字號：A-127360000-00000<br>版權所有 copyright © 2022 WDA.com Inc. All Rights Reserved.</span>
                </div>
            </div>
            <div class="row ftft">
            </div>
        </div>
    </section>
    <script type="text/javascript" src="./bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script src="./OwlCarousel2-2.3.4/dist/owl.carousel.js"></script>
    <script type="text/javascript" src="./js/wow.js"></script>
    <script type="text/javascript" src="./js/morphext.js"></script>
    <script type="text/javascript" src="./js/text_ctrl.js"></script>
    <script>
        //navbar
        let lastPos = 0
        const nav = document.querySelector('nav');
        document.addEventListener('scroll', function() {
            let currentPos = window.scrollY;
            if (currentPos > 38) {
                nav.style.top = "-110px";
            }
            if (currentPos <= lastPos) {
                nav.style.top = "-40px";
            }
            if (currentPos <= 38) {
                nav.style.top = "0px";
            }
            lastPos = currentPos;
        });
    </script>
    <script>
        //網頁載入彈出視窗
        $(window).ready(() => {
            $('#MyModal').modal('show');
        })
    </script>
    <script>
        $(".owl-carousel").owlCarousel({
            loop: true, // 循環播放
            margin: 10, // 外距 10px
            nav: true, // 顯示點點
            responsive: {
                0: {
                    items: 1 // 螢幕大小為 0~600 顯示 1 個項目
                },
                600: {
                    items: 3 // 螢幕大小為 600~1000 顯示 3 個項目
                },
                1000: {
                    items: 4 // 螢幕大小為 1000 以上 顯示 4 個項目
                }
            }
        });
    </script>
    <button type="button" id="BackTop" class="toTop-arrow"></button>
    <script>
        $(function() {
            $('#BackTop').click(function() {
                $('html,body').animate({
                    scrollTop: 0
                }, 500);
            });
            $(window).scroll(function() {
                if ($(this).scrollTop() > 200) {
                    $('#BackTop').fadeIn(360);
                } else {
                    $('#BackTop').stop().fadeOut(360);
                }
            }).scroll();
        });
    </script>
    <script type="text/javascript">
        $(function() {
            $('.dropdown-submenu>a').on("click", function(e) {
                var submenu = $(this);
                $('.dropdown-submenu .dropdown-menu').removeClass('show');
                submenu.next('.dropdown-menu').addClass('show');
                e.stopPropagation();
            });
            $('.dropdown').on("hidden.bs.dropdown", function() {
                //hide any open menus when parent closes
                $('.dropdown-menu.show').removeClass('show');
            });
        });
    </script>
</body>

</html>
<?php
function activeShow($num, $chkPoint)
{
    return (($num == $chkPoint) ? "active" : "");
}
?>