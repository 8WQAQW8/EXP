<div class="container mb-5" style="margin-top: 18vh;">
    <?php
    //建立訂單查詢
    $maxRows_rs = 5; //分頁設定數量
    $pageNum_rs = 0;  //起始頁=0
    if (isset($_GET['pageNum_order_rs'])) {
        $pageNum_rs = $_GET['pageNum_order_rs'];
    }
    $startRow_rs = $pageNum_rs * $maxRows_rs;
    $queryFirst = sprintf("SELECT *,uorder.create_date as udate FROM uorder,addbook WHERE uorder.emailid='%d' AND uorder.addressid=addbook.addressid ORDER BY uorder.create_date DESC", $_SESSION['emailid']);
    $query = sprintf("%s LIMIT %d,%d", $queryFirst, $startRow_rs, $maxRows_rs);
    $order_rs = $link->query($query);
    $i = 1; //控制第一筆訂單開啟
    ?>
    <h2>水產超市：訂單查詢</h2>
    <?php if ($order_rs->rowCount() != 0) { ?>
        <div class="accordion" id="accordionExample">
            <?php while ($data01 = $order_rs->fetch()) { ?>
                <div class="accordion-item mb-3">
                    <div class="accordion-header" id="headingOne<?php echo $i; ?>">
                        <a data-bs-toggle="collapse" href="#collapseOne<?php echo $i; ?>" aria-expanded="true" aria-controls="collapseOne<?php echo $i; ?>">
                            <div class="table-responsive-md mt-3">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <td width="10%">訂單編號</td>
                                            <td width="20%">下單日期時間</td>
                                            <td width="15%">付款方式</td>
                                            <td width="15%">訂單狀態</td>
                                            <td width="10%">收件人</td>
                                            <td width="20%">地址</td>
                                            <td width="10%">備註</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><?php echo $data01['orderid']; ?></td>
                                            <td><?php echo $data01['udate']; ?></td>
                                            <td><?php echo epayCode($data01['howpay']); ?></td>
                                            <td><?php echo processCode($data01['status']); ?></td>
                                            <td><?php echo $data01['cname']; ?></td>
                                            <td><?php echo $data01['address']; ?></td>
                                            <td><?php echo $data01['remark']; ?></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </a>
                    </div>
                    <?php
                    //處理訂單詳細商品資料列表
                    $subQuery = sprintf("SELECT * FROM cart,product,product_img,pyclass WHERE cart.orderid='%s' AND product.classid=pyclass.classid AND cart.p_id=product.p_id AND product.p_id=product_img.p_id AND product_img.sort='1' ORDER BY cart.create_date DESC", $data01['orderid']);
                    $details_rs = $link->query($subQuery);
                    $ptotal = 0;
                    ?>
                    <div id="collapseOne<?php echo $i; ?>" class="accordion-collapse collapse <?php echo ($i == 1) ? 'show' : ''; ?>" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="table-responsive-md">
                                <table class="table table-hover">
                                    <thead>
                                        <tr class="table-primary">
                                            <td width="10%" class="color_orange">
                                                <h5>產品編號</h5>
                                            </td>
                                            <td width="10%" class="color_orange">
                                                <h5>圖片</h5>
                                            </td>
                                            <td width="25%" class="color_orange">
                                                <h5>名稱</h5>
                                            </td>
                                            <td width="15%" class="color_orange">
                                                <h5>價格</h5>
                                            </td>
                                            <td width="10%" class="color_orange">
                                                <h5>數量</h5>
                                            </td>
                                            <td width="15%" class="color_orange">
                                                <h5>小計</h5>
                                            </td>
                                            <td width="15%" class="color_orange">
                                                <h5>狀態</h5>
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php while ($data02 = $details_rs->fetch()) { ?>
                                            <tr>
                                                <td>
                                                    <h4><?php echo $data02['p_id']; ?></h4>
                                                </td>
                                                <td><a href="goods.php?p_id=<?php echo $data02['p_id']; ?>&uplink=<?php echo $data02['uplink']; ?>"><img src="./images/<?php echo $data02['img_file']; ?>" alt="<?php echo $cart_data['p_name']; ?>" title="<?php echo $data02['p_name']; ?>" class="img-fluid"></a></td>
                                                <td>
                                                    <h5><a href="goods.php?p_id=<?php echo $data02['p_id']; ?>&uplink=<?php echo $data02['uplink']; ?>"><?php echo $data02['p_name']; ?></a></h5>
                                                </td>
                                                <td>
                                                    <h4>$<?php echo $data02['p_price']; ?></h4>
                                                </td>
                                                <td>
                                                    <h4><?php echo $data02['qty']; ?></h4>
                                                </td>
                                                <td>
                                                    <h4>$<?php echo $data02['p_price'] * $data02['qty']; ?></h4>
                                                </td>
                                                <td>
                                                    <h4>處理中</h4>
                                                </td>
                                            </tr>
                                        <?php $ptotal += $data02['p_price'] * $data02['qty'];
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
                        </div>
                    </div>
                </div>
            <?php $i++;
            } ?>
            <div class="col-md-12">
                <?php
                //取得目前頁數
                if (isset($_GET['totalRows_rs'])) {
                    $totalRows_rs = $_GET['totalRows_rs'];
                } else {
                    $all_rs = $link->query($queryFirst);
                    $totalRows_rs = $all_rs->rowCount();
                }
                $totalPages_rs = ceil($totalRows_rs / $maxRows_rs) - 1;
                //呼叫分頁功能函數
                $prev_rs = "&laquo;";
                $next_rs = "&raquo;";
                $separator = "|";
                $max_links = 20;
                $pages_rs = buildNavigation($pageNum_rs, $totalPages_rs, $prev_rs, $next_rs, $separator, $max_links, true, 3, "order_rs");
                ?>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <?php echo $pages_rs[0] . $pages_rs[1] . $pages_rs[2]; ?>
                    </ul>
                </nav>
            </div>
        </div>
    <?php } else { ?>
        <div class="alert alert-info" role="alert">抱歉!目前還沒有任何的訂單。</div>
    <?php } ?>
</div>