<div class="container" style="margin-top: 12vh;">
    <div class="col-md-12">
        <?php
        //建立購物車資料查詢
        $SQLstring = "SELECT * FROM cart,product,product_img,pyclass WHERE ip='".$_SERVER['REMOTE_ADDR']."' AND orderid IS NULL AND cart.p_id=product_img.p_id AND cart.p_id=product.p_id AND product.classid=pyclass.classid AND product_img.sort=1 ORDER BY cartid DESC";
        $cart_rs = $link->query($SQLstring);
        $ptotal = 0; //設定累加的變數，初始=0
        ?>
        <?php if ($cart_rs->rowCount() != 0) { ?>
            <div class="table-responsive-md cart-table-responsive-md">
                <table class="table">
                    <thead>
                        <tr>
                            <td class="cartpic"></td>
                            <td class="color_orange cartname">
                                <h5>商品</h5>
                            </td>
                            <td class="color_orange cartprice">
                                <h5>單價</h5>
                            </td>
                            <td class="color_orange cartqty">
                                <h5>數量</h5>
                            </td>
                            <td class="color_orange cartdel">
                                <h5 class="CartDelFont">移除</h5>
                            </td>
                            <td class="text-right color_orange carttotal">
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
                                    <div class="input-group">
                                        <input type="number" class="form-control" id="qty[]" name="qty[]" min="1" max="49" value="<?php echo $cart_data['qty']; ?>" cartid="<?php echo $cart_data['cartid']; ?>" required>
                                    </div>
                                </td>
                                <td><a href="#" class="color-red" role="button" onclick="btn_confirmLink('確定刪除本資料?','./split_file/shopcart_del.php?mode=1&cartid=<?php echo $cart_data['cartid']; ?>');" id="btn[]" title="移除" name="btn[]">
                                        <h5><i class="fa-solid fa-trash-can"></i></h5>
                                    </a></td>
                                <td>
                                    <h5 class="pt-1 text-right">$<?php echo number_format($cart_data['p_price'] * $cart_data['qty']); ?></h5>
                                </td>
                            </tr>
                        <?php $ptotal += $cart_data['p_price'] * $cart_data['qty'];
                        } ?>
                    </tbody>
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
                                <h4><?php echo number_format($ptotal); ?>元</h4>
                                <h4>
                                    <?php
                                    if ($ptotal >= 2000) {
                                        echo 0;
                                    } elseif ($ptotal > 0 && $ptotal < 2000) {
                                        echo 200;
                                    } else {
                                        echo 0;
                                    }
                                    ?>元
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
                                    }; ?>元
                                </h4>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="mt-5" style="display: flex; justify-content: center;margin-top:-0.6vw !important;">
                <div style="margin-right: 6vw;">
                    <button type="button" id="btn01" name="btn01" class="btn btn-danger" onclick="btn_confirmLink('確定清空購物車?','./split_file/shopcart_del.php?mode=2');">清空商品</button>
                </div>
                <div>
                    <a href="./checkout.php" id="btn02" name="btn02" class="btn btn-primary" role="button">前往結帳</a>
                </div>
            </div>
        <?php } else { ?>
            <div class="mt-5 alert alert-warning text-center" role="alert">
                <h3 style="margin:auto;">抱歉!目前購物車沒有相關產品。</h3>
            </div>
        <?php } ?>
    </div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>