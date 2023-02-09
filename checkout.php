<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once('split_file/php_lib_new.php'); ?>
<?php
if (!isset($_SESSION['login'])) {
    $sPath = "login.php?sPath=checkout";
    header(sprintf("Location:%s", $sPath));
}
?>
<!doctype html>

<html lang="zh-TW">

<head>
    <!-- 引入網頁標頭 -->
    <?php require_once("./split_file/headfile.php"); ?>
</head>
<style>
    .modal-backdrop.show {
        opacity: 0.6;
    }
</style>

<body>
    <!-- Modal -->
    <?php //require_once("./split_file/Modal.php");
    ?>
    <div>
        <section id="header">
            <!-- 開頭 -->
            <?php require_once("./split_file/header.php"); ?>
            <!-- 引入導覽列 -->
            <?php require_once("./split_file/navbar.php"); ?>
        </section>
        <section id="content">

        </section>
        <section id="content-mid">
            <!-- 結帳主頁 -->
            <?php require_once('./split_file/checkout_content.php');
            ?>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <!-- 影片 宣導文字 -->
            <?php require_once('./split_file/video_text.php'); ?>
        </section>
        <section id="footer">
            <!-- 聯絡資訊 -->
            <?php require_once('./split_file/footer.php'); ?>
        </section>
    </div>
    <!-- javascript檔 -->
    <?php require_once('./split_file/jsfile.php'); ?>
    <script type="text/javascript">
        $(function() {
            $('#pay1').click(function() {
                function changeLink() {
                    document.getElementById('btn04').innerHTML = "貨到付款";
                    document.getElementById('btn04').href = "";
                    // document.getElementById('btn04').target = "_blank";
                    document.getElementById('btn04').style = "display:flex;";
                    $( "#btn04" ).attr( "howpay", "1" );

                }
                changeLink();
            });
            $('#pay2').click(function() {
                function changeLink() {
                    document.getElementById('btn04').innerHTML = "信用卡付款";
                    document.getElementById('btn04').href = "./ECPayAIO_PHP-master/AioSDK/example/sample_Credit_CreateOrder.php";
                    document.getElementById('btn04').target = "_blank";
                    document.getElementById('btn04').style = "display:flex;";
                    $( "#btn04" ).attr( "howpay", "2" );
                }
                changeLink();
            });
            $('#pay3').click(function() {
                function changeLink() {
                    document.getElementById('btn04').innerHTML = "網路ATM付款";
                    document.getElementById('btn04').href = "./ECPayAIO_PHP-master/AioSDK/example/sample_WebATM_CreateOrder.php";
                    document.getElementById('btn04').target = "_blank";
                    document.getElementById('btn04').style = "display:flex;";
                    $( "#btn04" ).attr( "howpay", "3" );
                }
                changeLink();
            });
            $('#pay4').click(function() {
                function changeLink() {
                    document.getElementById('btn04').innerHTML = "超商代碼繳費";
                    document.getElementById('btn04').href = "./ECPayAIO_PHP-master/AioSDK/example/sample_CVS_CreateOrder.php";
                    document.getElementById('btn04').target = "_blank";
                    document.getElementById('btn04').style = "display:flex;";
                    $( "#btn04" ).attr( "howpay", "4" );
                }
                changeLink();
            });
        });
    </script>
    <script type="text/javascript">
        $(function() {
            //取得縣市碼後查詢鄉鎮市名稱放入#myTown
            $('#myCity').change(function() {
                var CNo = $('#myCity').val();
                $.ajax({
                    url: './split_file/Town_ajax.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        CNo: CNo
                    },
                    success: function(data) {
                        if (data.c == true) {
                            $('#myTown').html(data.m);
                        } else {
                            $('#zipcode').html('');
                            // alert("Database reponse error:" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
            //選鄕鎮市後，查詢郵遞區號放入#myZip,#add_label
            $('#myTown').change(function() {
                var AutoNo = $('#myTown').val();
                $.ajax({
                    url: './split_file/Zip_ajax01.php',
                    type: 'get',
                    dataType: 'json',
                    data: {
                        AutoNo: AutoNo
                    },
                    success: function(data) {
                        if (data.c == true) {
                            $('#myZip').val(data.Post);
                            $('#add_label').html('郵遞區號:' + data.Post + data.Cityname + data.Name);
                        } else {
                            $('#zipcode').html('');
                            // alert("Database reponse error:" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
            $('#recipient').click(function() {
                var validate = 0,
                    msg = "";
                var cname = $("#cname").val();
                var mobile = $("#mobile").val();
                var myzip = $("#myZip").val();
                var address = $("#address").val();
                if (cname == "") {
                    msg = msg + "收件人不得為空白!\n";
                    validate = 1;
                }
                if (mobile == "") {
                    msg = msg + "電話不得為空白!\n";
                    validate = 1;
                }
                if (myzip == "") {
                    msg = msg + "郵遞區號不得為空白!\n";
                    validate = 1;
                }
                if (address == "") {
                    msg = msg + "地址不得為空白!\n";
                    validate = 1;
                }
                if (validate) {
                    alert(msg);
                    return false;
                }
                $.ajax({
                    url: './split_file/addbook.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        cname: cname,
                        mobile: mobile,
                        myzip: myzip,
                        address: address,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.reload();
                        } else {
                            alert("Database reponse error:" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
            //更換收件人處理程序
            $('input[name=gridRadios]').change(function() {
                var addressid = $(this).val();
                $.ajax({
                    url: './split_file/changeaddr.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        addressid: addressid,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.reload();
                        } else {
                            alert("Database reponse error:" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
            //系統進行結帳處理
            $('#btn04').click(function() {
                let msg = "系統將進行結帳處理，請確認產品金額與收件人是否正確!";
                if (!confirm(msg)) return false;
                $("#loading").show();
                var addressid = $('input[name=gridRadios]:checked').val();
                var howpay = $(this).attr('howpay');
                $.ajax({
                    url: './split_file/addorder.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        addressid: addressid,
                        howpay: howpay
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.href = "orderlist.php";
                        } else {
                            alert("Database reponse error:" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            })
        });
    </script>
    <!-- Modal收件人地址處理對話框 -->
    <?php
    //取得所有收件人資料
    $SQLstring = sprintf("SELECT *,city.Name AS ctName,town.Name AS toName FROM addbook,city,town WHERE emailid='%d' AND addbook.myzip=town.Post AND town.AutoNO=city.AutoNo", $_SESSION['emailid']);
    $addbook_rs = $link->query($SQLstring);
    ?>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel">收件人資訊：</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col">
                                <input type="text" name="cname" id="cname" class="form-control" placeholder="收件人姓名">
                            </div>
                            <div class="col">
                                <input type="number" name="mobile" id="mobile" class="form-control" placeholder="收件人電話">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <select name="myCity" id="myCity" class="form-select">
                                    <option value="">請選擇市區</option>
                                    <?php
                                    $city = "SELECT * FROM city WHERE State=0";
                                    $city_rs = $link->query($city);
                                    while ($city_rows = $city_rs->fetch()) {
                                    ?>
                                        <option value="<?php echo $city_rows['AutoNo']; ?>">
                                            <?php echo $city_rows['Name']; ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="col">
                                <select name="myTown" id="myTown" class="form-select">
                                    <option value="">請選擇地區</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <input type="hidden" name="myZip" id="myZip" value="">
                                <label for="address" id="add_label" name="add_label">郵遞區號:</label>
                                <input type="text" name="address" id="address" class="form-control" placeholder="地址">
                            </div>
                        </div>
                        <div class="row mt-4 justify-content-center">
                            <div class="col-auto">
                                <button type="button" class="btn btn-green" id="recipient" name="recipient">新增收件人</button>
                            </div>
                        </div>
                    </form>
                    <div class="row mt-3">
                        <table class="table">
                            <thead class="table-info">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">收件者姓名</th>
                                    <th scope="col">電話</th>
                                    <th scope="col">地址</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($data = $addbook_rs->fetch()) {
                                ?>
                                    <tr>
                                        <th scope="row"><input type="radio" name="gridRadios" id="gridRadios[]" value="<?php echo $data['addressid'] ?>" <?php echo ($data['setdefault']) ? 'checked' : ''; ?>></th>
                                        <td><?php echo $data['cname'];
                                            ?></td>
                                        <td><?php echo $data['mobile'];
                                            ?></td>
                                        <td><?php echo $data['myzip'] . $data['ctName'] . $data['toName'] . $data['address'];
                                            ?></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="loading" name="loading" class="loginreloadbg"><i class="fas fa-spinner fa-spin fa-5x fa-fw loginreload"></i>
    </div>
</body>


</html>
<?php
//判斷$num是否等於$chkPoint，若是則回傳active，可用於設定起始分頁carousel
function activeShow($num, $chkPoint)
{
    return (($num == $chkPoint) ? "active" : "");
}
?>