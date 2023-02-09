<div class="container text-center">
    <?php
    //建立新商品rs
    $maxRows_rs = 9; //分頁設定數量
    $pageNum_rs = 0;  //起始頁=0
    if (isset($_GET['pageNum_rs'])) {
        $pageNum_rs = $_GET['pageNum_rs'];
    }
    $startRow_rs = $pageNum_rs * $maxRows_rs;

    //列出產品product資料查詢
    $queryFirst = sprintf("SELECT * FROM product,product_img,new,pyclass WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id AND product_img.p_id=new.p_id AND product.classid=pyclass.classid ORDER BY new_sort");
    $query = sprintf("%s LIMIT %d,%d", $queryFirst, $startRow_rs, $maxRows_rs);
    $pList01 = $link->query($query);

    $i = 1; //控制每列row產生
    ?>
    <?php while ($pList01_Rows = $pList01->fetch()) { ?>
        <?php if ($i % 3 == 1) { ?>
            <div class="row text-center cardmar"><?php } ?>
            <div class="col-md-4 ">
                <div class="card newbutton">
                    <a href="goods.php?p_id=<?php echo $pList01_Rows['p_id']; ?>&uplink=<?php echo $pList01_Rows['uplink']; ?>"><img src="images/<?php echo $pList01_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList01_Rows['p_name']; ?>" title="<?php echo $pList01_Rows['p_name']; ?>"></a>
                    <div class="card-body newproductcard">
                        <h3 class="card-title"><?php echo $pList01_Rows['p_name']; ?></h3>
                        <p class="card-text newintro"><?php echo mb_substr($pList01_Rows['p_intro'], 0, 50, "utf-8"); ?></p><br>
                        <h4 class="card-text newprice">$<?php echo number_format($pList01_Rows['p_price']); ?><?php echo $pList01_Rows['p_set']; ?></h4>
                            <a href="goods.php?p_id=<?php echo $pList01_Rows['p_id']; ?>&uplink=<?php echo $pList01_Rows['uplink']; ?>" class="btn btn-primary" role="button">更多資訊</a>
                            <!-- <a href="#" class="btn btn-green">放購物車</a> -->
                            <button type="button" id="button01[]" name="button01[]" class="btn btn-green" onclick="addcart(<?php echo $pList01_Rows['p_id']; ?>)">放購物車</button>
                    </div>

                </div>
            </div>
            <?php if ($i % 3 == 0 || $i == $pList01->rowCount()) { ?>
            </div><?php } ?>
    <?php $i++;
    } ?>

    <div class="row mt-3">
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
            $prev_rs = "上一頁";
            $next_rs = "下一頁";
            $separator = "|";
            $max_links = 20;
            $pages_rs = buildNavigation($pageNum_rs, $totalPages_rs, $prev_rs, $next_rs, $separator, $max_links, true, 3, "rs");
            ?>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <?php echo $pages_rs[0] . $pages_rs[1] . $pages_rs[2]; ?>
                </ul>
            </nav>
        </div>
    </div>
</div>