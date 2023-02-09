<?php /*
$level1Open = "";
$level2Open = "";
$level3Open = "";
if (isset($_GET['p_id']) && $_GET['p_id'] != "") {
    //使用p_id產品代碼取出資料
    //處理第一層
    $SQLstring = sprintf("SELECT * FROM product,pyclass,new,(SELECT classid as upclassid, level as uplevel, cname as upcname FROM pyclass WHERE level=1) as uplevel WHERE product.classid=pyclass.classid AND product.p_id=new.p_id AND pyclass.uplink=uplevel.upclassid AND product.p_id=%d", $_GET['p_id']);
    $classid_rs = $link->query($SQLstring);
    $data = $classid_rs->fetch();
    if ($data['upclassid'] == 120) {
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
    /*} elseif ($data['upclassid'] != 120) {
        $SQLstring = sprintf("SELECT * FROM product,pyclass,new,(SELECT classid as upclassid, level as uplevel, cname as upcname FROM pyclass WHERE level=1) as uplevel WHERE product.classid=pyclass.classid AND product.p_id=new.p_id AND pyclass.uplink!=uplevel.upclassid AND pyclass.cname=uplevel.upcname AND product.p_id=%d", $_GET['p_id']);
        $classid_rs = $link->query($SQLstring);
        $data = $classid_rs->fetch();
        $level1Cname = $data['upcname'];
        $level1Upclassid = $data['upclassid'];
        $level1 = $data['uplevel'];
        $level1Open = '<li class="breadcrumb-item"><a href="drugstore.php?classid=' . $level1Upclassid . '&level=' . $level1 . '">' . $level1Cname . '</a></li>';
        //處理第二層
        $level2Cname = $data['cname'];
        $level2Classid = $data['classid'];
        $level2Open = '<li class="breadcrumb-item active" aria-current="page">' . $data['p_name'] . '</li>';
    }
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
}*/
?>
<div class="col-md-3">
    <?php if ($_GET['classid'] == "" && $level1Open == "") {  //所有商品麵包屑
        echo
        '<nav aria-label="breadcrumb">
        <ol class="breadcrumb newbreadmg">
            <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
            <li class="breadcrumb-item">新品上市</li>
            </ol>
    </nav>';
    }/* elseif ($_GET['p_id'] && $data['upclassid'] != 120) {  //搜尋麵包屑
        echo
        '<nav aria-label="breadcrumb" style="margin-top: 90px;margin-left: 0vw;background-color:#DDDDDD;height:40px;padding-top: 10px;padding-left: 16px;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
            ' . $level1Open . $level2Open . '
            </ol>
    </nav>';
    } elseif ($_GET['p_id']  && $data['upclassid'] == 120) {  //搜尋麵包屑
        echo
        '<nav aria-label="breadcrumb" style="margin-top: 90px;margin-left: 0vw;background-color:#DDDDDD;height:40px;padding-top: 10px;padding-left: 16px;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
            ' . $level1Open . $level2Open . $level3Open . '
            </ol>
    </nav>';
    }*/  /*else {  //有第二層的麵包屑
        echo
        '<nav aria-label="breadcrumb" style="margin-top: 90px;margin-left: 7.4vw;background-color:#DDDDDD;height:40px;padding-top: 10px;padding-left: 16px;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.php">首頁</a></li>'
            . $level1Open . $level2Open . $level3Open .
            '</ol>
    </nav>';
    }*/
    ?>
</div>