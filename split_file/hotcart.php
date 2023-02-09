<div class="container text-center">
    <div class="row pic hotcart">
        <div class="col-md-12">
            <h1><i class="fa-solid fa-fire fa-lg"></i>熱銷推薦</h1>
        </div>
    </div>
    <div class="row">
        <div class="owl-carousel owl-theme">
            <?php
            //建立熱銷商品查詢
            $SQLstring = "SELECT * FROM hot,product,product_img,pyclass WHERE hot.p_id=product_img.p_id AND hot.p_id=product.p_id AND product.classid=pyclass.classid AND product_img.sort=1 ORDER BY h_sort";
            $hot = $link->query($SQLstring);
            ?>
            <?php while ($data = $hot->fetch()) { ?>
                <div class="item">
                    <div class="card col-md-3 col-6 cardborder">
                        <a href="goods.php?p_id=<?php echo $data['p_id']; ?>&uplink=<?php echo $data['uplink']; ?>"><img src="./images/<?php echo $data['img_file']; ?>" class="card-img-top img-fluid" alt="HOT <?php echo $data['p_name']; ?> <?php echo $data['h_sort']; ?>"></a>
                        <h5 class="card-title mt-3"><?php echo $data['p_name']; ?></h5>
                        <div class="card-body hotbutton">
                            <p class="card-text cardprice">$<?php echo number_format($data['p_price']); ?><?php echo $data['p_set']; ?></p>
                        </div>
                        <div class="hotbutton">
                            <a href="goods.php?p_id=<?php echo $data['p_id']; ?>&uplink=<?php echo $data['uplink']; ?>" class="btn btn-primary" role="button">更多資訊</a>
                            <!-- <a href="#" class="btn btn-green">放購物車</a> -->
                            <button type="button" id="button01[]" name="button01[]" class="btn btn-green" onclick="addcart(<?php echo $data['p_id']; ?>)">放購物車</button>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>