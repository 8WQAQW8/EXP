<?php
//取得收件者地址資料
$SQLstring = sprintf("SELECT *,city.Name AS ctName,town.Name AS toName FROM addbook,city,town WHERE emailid='%d' AND setdefault='1' AND addbook.myzip=town.Post AND town.AutoNo=city.AutoNo", $_SESSION['emailid']);
$addbook_rs = $link->query($SQLstring);
if ($addbook_rs && $addbook_rs->rowCount() != 0) {
    $data = $addbook_rs->fetch();
    $cname = $data['cname'];
    $mobile = $data['mobile'];
    $myzip = $data['myzip'];
    $address = $data['address'];
    $ctName = $data['ctName'];
    $toName = $data['toName'];
} else {
    $cname = "";
    $mobile = "";
    $myzip = "";
    $address = "";
    $ctName = "";
    $toName = "";
}
?>
<div class="container" style="margin-top: 18vh;">
    <div class="row">
        <h2 class="mb-3">水產超市:會員(<?php echo $_SESSION['cname']; ?>)結帳作業</h2>
        <div class="card col-md-12">
            <h3 class="card-header text-center" style="color:#007bff;"><i class="fa-solid fa-truck-arrow-right me-1 fa-fw"></i>配送資訊</h3>
            <div class="card-body mt-3 ps-3">
                <h3 class="card-title mb-3">收件人資訊：</h3>
                <hr class="CheckoutHr" width="60%">
                <h4 class="card-title mb-3">姓名：<?php echo $cname; ?></h4>
                <h5 class="card-text mb-3">電話：<?php echo $mobile; ?></h5>
                <h5 class="card-text mb-3">郵遞區號:<?php echo $myzip; ?></h5>
                <h5 class="card-text mb-3">地址：<?php echo $ctName . $toName . $address; ?></h5>
            </div>
            <div class="mx-auto mb-2 checkoutbutton">
                <a href="#" class="btn btn-outline-primary me-5" data-bs-toggle="modal" data-bs-target="#exampleModal">選擇其他收件人</a>
                <a href="#" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#exampleModal">新增收件人</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="card col-md-12 mt-3">
            <h3 class="card-header text-center" style="color:#000;"><i class="far fa-credit-card me-1 fa-fw"></i>付款方式</h3>
            <div class="card-body pt-2 pb-2">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <!-- <li class="nav-item" role="presentation">
                        <a class="nav-link active PayNav" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" style="color:#007bff !important;">貨到付款or信用卡</a>
                    </li> -->
                    <li class="nav-item" role="presentation">
                        <a class="nav-link PayNav" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false" style="color:#007bff !important;">請選擇付款方式</a>
                    </li>
                    <!-- <li class="nav-item" role="presentation">
                        <a class="nav-link PayNav" id="contact-tab" data-bs-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false" style="color:#007bff !important;">銀行轉帳</a>
                    </li> -->
                    <!-- <li class="nav-item" role="presentation">
                        <a class="nav-link PayNav" id="epay-tab" data-bs-toggle="tab" href="#epay" role="tab" aria-controls="epay" aria-selected="false" style="color:#007bff !important;">電子支付</a>
                    </li> -->
                </ul>
                <div class="tab-content" id="myTabContent">
                    <!-- <div class="tab-pane fade show active mt-3 mb-2" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <h3 class="card-title pt-3 mb-3">收件人資訊：</h3>
                        <hr class="CheckoutHr" width="60%">
                        <h4 class="card-title mb-3">姓名:<?php //echo $cname; ?></h4>
                        <h5 class="card-text mb-3">電話:<?php //echo $mobile; ?></h5>
                        <h5 class="card-text mb-3">郵遞區號:<?php //echo $myzip; ?></h5>
                        <h5 class="card-text mb-3">地址:<?php //echo $ctName . $toName . $address; ?></h5>
                    </div> -->
                    <div class="tab-pane fade show active mt-3 mb-2" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <!-- <h3 class="card-title pt-3">選擇付款帳戶：</h3> -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="CheckoutTheadFont" scope="col" width="8%">#</th>
                                    <th class="CheckoutTheadFont" scope="col" width="20%"></th>
                                    <th class="CheckoutTheadFont" scope="col" width="30%"></th>
                                    <th class="CheckoutTheadFont" scope="col" width="42%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="CheckoutTbodyFont">
                                    <th scope="row"><input type="radio" style="zoom:2;" name="creditCard" id="pay1" /></th>
                                    <td><img src="./images/pay1.png" alt="貨到付款" class="img-fluid"></td>
                                    <td><h4>貨到付款</h4></td>
                                    <td></td>
                                </tr>
                                <tr class="CheckoutTbodyFont">
                                    <th scope="row"><input type="radio" style="zoom:2;" name="creditCard" id="pay2" /></th>
                                    <td><img src="./images/credit.png" alt="creditcard" class="img-fluid"></td>
                                    <td><h4>信用卡付款</h4></td>
                                    <td></td>
                                </tr>
                                <tr class="CheckoutTbodyFont">
                                    <th scope="row"><input type="radio" style="zoom:2;" name="creditCard" id="pay3" /></th>
                                    <td><img src="./images/webATM.png" alt="webATM" class="img-fluid"></td>
                                    <td><h4>網路ATM</h4></td>
                                    <td></td>
                                </tr>
                                <tr class="CheckoutTbodyFont">
                                    <th scope="row"><input type="radio" style="zoom:2;" name="creditCard" id="pay4" /></th>
                                    <td><img src="./images/store.png" alt="store" class="img-fluid"></td>
                                    <td><h4>超商代碼繳費</h4></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- <a href="./ECPayAIO_PHP-master/AioSDK/example/sample_Credit_CreateOrder.php" type="button" class="btn btn-success">使用信用卡付款</a> -->
                    </div>
                    <div class="tab-pane fade mt-3 mb-2" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                        <h3 class="card-title pt-3">ATM匯款資訊：</h3>
                        <img src="./images/Cathay-bk.png" alt="cathay" class="img-fluid pt-3">
                        <hr class="CheckoutHr">
                        <h4 class="card-title mb-3">姓名:林小強</h4>
                        <h5 class="card-title mb-3">匯款銀行：國泰世華銀行</h5>
                        <h5 class="card-title mb-3">銀行代碼：013</h5>
                        <h5 class="card-text mb-3">匯款帳號：1234-4567-7890-1234</h5>
                        <p class="card-text mb-3">備註：匯款完成後，需要1、2個工作天，待系統入款完成後，將以簡訊通知訂單完成付款。</p>
                    </div>
                    <!-- <div class="tab-pane fade mt-3 mb-2" id="epay" role="tabpanel" aria-labelledby="epay-tab">
                        <h3 class="card-title pt-3">選擇電子支付方式：</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="CheckoutTheadFont" scope="col" width="5%">#</th>
                                    <th class="CheckoutTheadFont" scope="col" width="25%">電子支付系統</th>
                                    <th class="CheckoutTheadFont" scope="col" width="70%">電子支付公司</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="CheckoutTbodyFont">
                                    <th scope="row"><input type="radio" name="epay" id="epay[]" checked /></th>
                                    <td><img src="./images/Apple_Pay_logo.png" alt="applepay" class="img-fluid"></td>
                                    <td>Apple Pay</td>
                                </tr>
                                <tr class="CheckoutTbodyFont">
                                    <th scope="row"><input type="radio" name="epay" id="epay[]" checked /></th>
                                    <td><img src="./images/Line_pay_logo.png" alt="linepay" class="img-fluid"></td>
                                    <td>Line Pay</td>
                                </tr>
                                <tr class="CheckoutTbodyFont">
                                    <th scope="row"><input type="radio" name="epay" id="epay[]" checked /></th>
                                    <td><img src="./images/JKOPAY_logo.png" alt="jkopay" class="img-fluid"></td>
                                    <td>JKOPAY</td>
                                </tr>
                            </tbody>
                        </table>
                    </div> -->
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <?php
        //建立結帳表格資料庫查詢
        $SQLstring = "SELECT * FROM cart,product,product_img WHERE ip='" . $_SERVER['REMOTE_ADDR'] . "' AND orderid is NULL AND cart.p_id=product_img.p_id AND cart.p_id=product.p_id AND product_img.sort=1 ORDER BY cartid DESC";
        $cart_rs = $link->query($SQLstring);
        $ptotal = 0; //設定累加變數$pTotal
        ?>
        <div class="table-responsive-md">
            <table class="table">
                <thead>
                    <tr>
                        <td width="17%"></td>
                        <td width="35%" class="color_orange">
                            <h5>商品</h5>
                        </td>
                        <td width="20%" class="color_orange">
                            <h5>單價</h5>
                        </td>
                        <td width="18%" class="color_orange">
                            <h5>數量</h5>
                        </td>
                        <td width="10%" class="text-right color_orange">
                            <h5>小計</h5>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($cart_data = $cart_rs->fetch()) { ?>
                        <tr>
                            <td><a href="goods.php?p_id=<?php echo $cart_data['p_id']; ?>&uplink=<?php echo $cart_data['uplink']; ?>"><img src="./images/<?php echo $cart_data['img_file']; ?>" alt="<?php echo $cart_data['p_name']; ?>" title="<?php echo $cart_data['p_name']; ?>" class="img-fluid"></a></td>
                            <td>
                                <h5><a href="goods.php?p_id=<?php echo $cart_data['p_id']; ?>&uplink=<?php echo $cart_data['uplink']; ?>"><?php echo $cart_data['p_name']; ?></a></h5>
                            </td>
                            <td>
                                <h5 class="pt-1">$<?php echo number_format($cart_data['p_price']); ?><?php echo $cart_data['p_set']; ?></h5>
                            </td>
                            <td>
                                <h5 class="pt-1"><?php echo $cart_data['qty']; ?></h5>
                            </td>
                            <td>
                                <h5 class="pt-1 text-right">$<?php echo number_format($cart_data['p_price'] * $cart_data['qty']); ?></h5>
                            </td>
                        </tr>
                    <?php $ptotal += $cart_data['p_price'] * $cart_data['qty'];
                    } ?>
                </tbody>
                <tfoot>
                </tfoot>
            </table>
            <table class="table">
                <tfoot>
                    <tr>
                        <td class="noneBorder tfootcolspn col-md-8 col-5"></td>
                        <td class="totalborder color_gray tfootprice col-md-2 col-3">
                            <h4>累計:</h4>
                            <h4>運費:</h4>
                        </td>
                        <td class="text-right totalborder color_gray tfoottotal col-md-2 col-4">
                            <h4><?php echo number_format($ptotal); ?></h4>
                            <h4>
                                <?php
                                if ($ptotal >= 2000) {
                                    echo 0;
                                } elseif ($ptotal > 0 && $ptotal < 2000) {
                                    echo 200;
                                } else {
                                    echo 0;
                                }
                                ?>
                            </h4>
                        </td>
                    </tr>
                    <tr>
                        <td class="noneBorder"></td>
                        <td class="thead_color noneBorder">
                            <h4>總計:</h4>
                        </td>
                        <td class="text-right thead_color noneBorder">
                            <h4>
                                <?php if ($ptotal >= 2000) {
                                    echo number_format($ptotal + 0);
                                } elseif ($ptotal > 0 && $ptotal < 2000) {
                                    echo number_format($ptotal + 200);
                                } else {
                                    echo number_format($ptotal);
                                }; ?>
                            </h4>
                        </td>
                    </tr>
                </tfoot>
            </table>
            <div class="mt-5" style="display: flex; justify-content: center;margin-top:-0.6vw !important;">
                <div style="margin-right: 6vw;">
                    <a style="display: none;" href="" howpay="" id="btn04" name="btn04" class="btn btn-green"><i class="fas fa-cart-arrow-down pe-2"></i>確認結帳</a>
                </div>
                <div>
                    <button type="button" id="btn03" name="btn03" class="btn btn-warning" onclick="window.history.go(-1)"><i class="fas fa-undo-alt pe-2"></i>回到上一頁</button>
                </div>
            </div>
        </div>

    </div>
</div>