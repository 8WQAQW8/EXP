<div class="container-fluid">
    <div class="row">
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