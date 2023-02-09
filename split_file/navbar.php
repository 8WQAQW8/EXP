<nav class="navbar navbar-expand-lg navbar-light fixed-top navbg navmr ">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.php"><img src="./images/seafood-icon.png" alt="回首頁" title="回首頁" id="navindex"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <?php
        //讀取後台購物車內產品數量
        $SQLstring = "SELECT * FROM cart WHERE orderid is NULL AND ip='" . $_SERVER['REMOTE_ADDR'] . "'";
        $cart_rs = $link->query($SQLstring);
        ?>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-auto">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="index.php">首頁</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">優惠活動</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">關於我們</a>
                </li>
                <?php
                //列出產品類別第一層
                $SQLstring = "SELECT * FROM pyclass";
                $pyclass01 = $link->query($SQLstring);
                $i = 1; //控制編號順序
                ?>
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">線上購物</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
                            <?php if ($pyclass01_Rows['uplink'] == 0) { ?>
                                <li class="dropdown-item dropdown-item-font dropdown-submenu">
                                    <a href="drugstore.php<?php if ($pyclass01_Rows['classid'] != 1) {
                                                                echo "?classid=";
                                                            } ?><?php if ($pyclass01_Rows['classid'] != 1) {
                                                                    echo $pyclass01_Rows['classid'] . "&uplink=" . $pyclass01_Rows['uplink'];
                                                                } ?>" <?php if ($pyclass01_Rows['sort'] == 6) {
                                                                            echo "class='dropdown-toggle' data-bs-toggle='dropdown'";
                                                                        } ?>>
                                        <?php echo $pyclass01_Rows['cname']; ?></a>
                                <?php  }; ?>
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
                                            <li class="dropdown-item dropdown-item-font"><a href="drugstore.php?classid=<?php echo $pyclass02_Rows['classid'] . "&uplink=" . $pyclass02_Rows['uplink']; ?>"><?php echo $pyclass02_Rows['cname']; ?></a></li>
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
                <li class="nav-item">
                    <a class="nav-link" href="./orderlist.php">訂單查詢</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link position-relative" href="cart.php"><i class="fa-sharp fa-solid fa-cart-shopping fa-fw"></i>&nbsp;購物車
                        <?php if ($cart_rs->rowCount() != 0) {
                            echo '<span class="position-absolute p-1 start-100 translate-middle badge bg-red">';
                        } ?>
                        <?php if ($cart_rs->rowCount() != 0) {
                            echo ($cart_rs) ? $cart_rs->rowCount() : '';
                        } ?>
                        </span>
                    </a>
                </li>
            </ul>
            <form class="d-flex" name="search" id="search" action="drugstore.php" method="get">
                <input type="text" name="search_name" id="search_name" class="form-control me-2" placeholder="Search..." value="<?php echo (isset($_GET['search_name'])) ? $_GET['search_name'] : ''; ?>" aria-label="Search" required>
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>