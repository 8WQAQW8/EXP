<div class="card mb-3">
    <div class="row g-0">
        <div class="col-md-5">
            <?php
            //取得產品圖片檔名資料
            $SQLstring = sprintf("SELECT * FROM product_img WHERE product_img.p_id=%d ORDER BY sort", $_GET['p_id']);
            $img_rs = $link->query($SQLstring);
            $imgList = $img_rs->fetch();
            ?>
            <img id="showGoods" name="showGoods" src="./images/<?php echo $imgList['img_file']; ?>" class="img-fluid rounded-start" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>">
            <div class="row mt-2">
                <?php do { ?>
                    <div class="col-4 col-md-3">
                        <a href="./images/<?php echo $imgList['img_file']; ?>" rel="group" data-fancybox="gallery" data-caption="<?php echo $data['p_name']; ?>"><img src="./images/<?php echo $imgList['img_file']; ?>" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>" class="img-fluid"></a>
                    </div>
                <?php } while ($imgList = $img_rs->fetch()); ?>
            </div>
        </div>
        <div class="col-md-7 goodpx-5">
            <div class="card-body mt-3">
                <h3 class="card-title"><?php echo $data['p_name']; ?></h3>
                <h6 class="card-text"><?php echo $data['p_intro']; ?></h6>
                <h4 style="color:red;">$<?php echo number_format($data['p_price']); ?><?php echo $data['p_set']; ?></h4>
                <div class="row mt-3">
                    <div class="col-6 col-md-6 ">
                        <div class="input-group input-group-lg goodquantity">
                            <span class="input-group-text color-success" id="inputGroup-sizing-lg">數量</span>
                            <input type="number" class="form-control" aria-label="Sizing example input" id="qty" name="qty" value="1" aria-describedby="inputGroup-sizing-lg">
                        </div>
                    </div>
                    <div class="col-6 col-md-6">
                        <button name="button01" id="button01" type="button" class="btn btn-primary btn-lg goodbutton" onclick="addcart(<?php echo $data['p_id']; ?>)">加入購物車</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $data['p_content']; ?>