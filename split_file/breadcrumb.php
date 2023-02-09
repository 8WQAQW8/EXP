<?php
$level1Open = "";
$level2Open = "";
$level3Open = "";
if (isset($_GET['p_id']) && $_GET['p_id'] != "" && isset($_GET['uplink']) && $_GET['uplink'] == 0) {
    //使用p_id產品代碼取出資料
    //處理第一層
    $SQLstring = sprintf("SELECT * FROM product,pyclass,(SELECT classid as upclassid, level as uplevel, cname as upcname FROM pyclass WHERE level=1) as uplevel WHERE product.classid=pyclass.classid AND pyclass.classid=uplevel.upclassid AND product.p_id=%d", $_GET['p_id']);
    $classid_rs = $link->query($SQLstring);
    $data = $classid_rs->fetch();
    $level1Cname = $data['upcname'];
    $level1Upclassid = $data['upclassid'];
    $level1 = $data['uplevel'];
    $level1Open = '<li class="breadcrumb-item"><a href="drugstore.php?classid=' . $level1Upclassid . '&level=' . $level1 . '">' . $level1Cname . '</a></li>';
    //處理第二層
    $level2Cname = $data['cname'];
    $level2Classid = $data['classid'];
    $level2Open = '<li class="breadcrumb-item"><a href="drugstore.php?classid=' . $level2Classid . '&uplink=">' . $level2Cname . '</a></li>';
    //處理第三層(產品名稱)
    $level3Open = '<li class="breadcrumb-item active" aria-current="page">' . $data['p_name'] . '</li>';
} elseif (isset($_GET['p_id']) && $_GET['p_id'] != "") {
    //使用p_id產品代碼取出資料
    //處理第一層
    $SQLstring = sprintf("SELECT * FROM product,pyclass,(SELECT classid as upclassid, level as uplevel, cname as upcname FROM pyclass WHERE level=1) as uplevel WHERE product.classid=pyclass.classid AND pyclass.uplink=uplevel.upclassid AND product.p_id=%d", $_GET['p_id']);
    $classid_rs = $link->query($SQLstring);
    $data = $classid_rs->fetch();
    $level1Cname = $data['upcname'];
    $level1Upclassid = $data['upclassid'];
    $level1 = $data['uplevel'];
    $level1Open = '<li class="breadcrumb-item"><a href="drugstore.php?classid=' . $level1Upclassid . '&level=' . $level1 . '">' . $level1Cname . '</a></li>';
    //處理第二層
    $level2Cname = $data['cname'];
    $level2Classid = $data['classid'];
    $level2Open = '<li class="breadcrumb-item"><a href="drugstore.php?classid=' . $level2Classid . '">' . $level2Cname . '</a></li>';
    //處理第三層(產品名稱)
    $level3Open = '<li class="breadcrumb-item active" aria-current="page">' . $data['p_name'] . '</li>';
} elseif (isset($_GET['search_name'])) {
    //使用關鍵字查詢
    $level1Open = '<li class="breadcrumb-item active" aria-current="page">關鍵字查詢:' . $_GET['search_name'] . '</li>';
} elseif (isset($_GET['level']) && isset($_GET['classid'])) {
    //選擇第一層類別
    $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=%d AND classid=%d", $_GET['level'], $_GET['classid']);
    $classid_rs = $link->query($SQLstring);
    $data = $classid_rs->fetch();
    $level1Cname = $data['cname'];
    $level1Open = '<li class="breadcrumb-item active" aria-current="page">' . $level1Cname . '</li>';
} elseif (isset($_GET['classid']) && isset($_GET['uplink']) && $_GET['uplink'] == 0) {
    //選擇第二層類別
    $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=1 AND classid=%d", $_GET['classid']);
    $classid_rs = $link->query($SQLstring);
    $data = $classid_rs->fetch();
    $level2Cname = $data['cname'];
    $level2uplink = $data['uplink'];
    $level2Open = '<li class="breadcrumb-item active" aria-current="page">' . $level2Cname . '</li>';
    //需加處理上一層
    $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=1 AND classid=%d", $level2uplink);
    $classid_rs = $link->query($SQLstring);
    $data = $classid_rs->fetch();
    $level1Cname = $data['cname'];
    $level1 = $data['level'];
    $level1Open = '<li class="breadcrumb-item"><a href="drugstore.php?classid=' . $level2uplink . '&level=' . $level1 . '">' . $level1Cname . '</a></li>';
} elseif (isset($_GET['classid'])) {
    //選擇第二層類別
    $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 AND classid=%d", $_GET['classid']);
    $classid_rs = $link->query($SQLstring);
    $data = $classid_rs->fetch();
    $level2Cname = $data['cname'];
    $level2uplink = $data['uplink'];
    $level2Open = '<li class="breadcrumb-item active" aria-current="page">' . $level2Cname . '</li>';
    //需加處理上一層
    $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=1 AND classid=%d", $level2uplink);
    $classid_rs = $link->query($SQLstring);
    $data = $classid_rs->fetch();
    $level1Cname = $data['cname'];
    $level1 = $data['level'];
    $level1Open = '<li class="breadcrumb-item"><a href="drugstore.php?classid=' . $level2uplink . '&level=' . $level1 . '">' . $level1Cname . '</a></li>';
}
?>
<div class="container">
    <div class="col-12">
        <?php
        if ($_GET['classid'] == "" && $_GET['search_name'] == "" && $_GET['p_id'] == "") {  //所有商品麵包屑
            echo
            '<nav aria-label="breadcrumb" style="margin-top: 120px;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item">所有商品</li>
                </ol>
        </nav>';
        } elseif ($_GET['classid'] && $_GET['level']) { //肉類麵包屑
            echo
            '<nav aria-label="breadcrumb" style="margin-top: 120px;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                ' . $level1Open . '
                </ol>
        </nav>';
        } elseif (isset($_GET['classid']) && isset($_GET['uplink']) && $_GET['uplink'] == 0) { //只第一層的麵包屑(所有商品除外)
            echo
            '<nav aria-label="breadcrumb" style="margin-top: 120px;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                ' . $level2Open . '
                </ol>
        </nav>';
        } elseif ($_GET['classid']) {  //有第二層的麵包屑
            echo
            '<nav aria-label="breadcrumb" style="margin-top: 120px;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>'
                . $level1Open . $level2Open .
                '</ol>
        </nav>';
        } elseif ($_GET['classid'] == "" && isset($_GET['search_name']) && $_GET['search_name']) {  //搜尋麵包屑
            echo
            '<nav aria-label="breadcrumb" style="margin-top: 120px;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                ' . $level1Open . $level2Open . '
                </ol>
        </nav>';
        } elseif (isset($_GET['p_id']) && $_GET['p_id'] != "" && isset($_GET['uplink']) && $_GET['uplink'] == 0) {  //有二層的麵包屑
            echo
            '<nav aria-label="breadcrumb" style="margin-top: 120px;margin-left: -2.6vw;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>'
                . $level2Open . $level3Open .
                '</ol>
        </nav>';
        } elseif ($_GET['p_id']) {  //有第三層的麵包屑
            echo
            '<nav aria-label="breadcrumb" style="margin-top: 120px;margin-left: -2.6vw;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>'
                . $level1Open . $level2Open . $level3Open .
                '</ol>
        </nav>';
        }
        ?>
    </div>
</div>