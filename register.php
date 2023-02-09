<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once('split_file/php_lib_new.php'); ?>
<!doctype html>

<html lang="zh-TW">

<head>
    <!-- <meta http-equiv="Content-Type:" content="text/html; charset=big5"> -->
    <!-- 引入網頁標頭 -->
    <?php require_once("./split_file/headfile.php"); ?>
    <script type="text/javascript" src="./js/commlib.js"></script>

</head>

<body>
    <div>
        <section id="header">
            <!-- 開頭 -->
            <?php require_once("./split_file/header.php"); ?>
            <!-- 引入導覽列 -->
            <?php require_once("./split_file/navbar.php"); ?>
        </section>
        <section id="content">
        </section>
        <?php
        if (isset($_POST['formctl']) && $_POST['formctl'] == 'reg') {
            $email = $_POST['email'];
            $pw1 = md5($_POST['pw1']);
            $cname = $_POST['cname'];
            $tssn = $_POST['tssn'];
            $birthday = $_POST['birthday'];
            $mobile = $_POST['mobile'];
            $tel = $_POST['tel'];
            $myzip = $_POST['myZip'] == '' ? NULL : $_POST['myZip'];
            $address = $_POST['address'] == '' ? NULL : $_POST['address'];
            $imgname = $_POST['uploadname'] == '' ? NULL : $_POST['uploadname'];
            $insertsql = "INSERT INTO member(email,pw1,cname,tssn,birthday,imgname) VALUES ('" . $email . "','" . $pw1 . "','" . $cname . "','" . $tssn . "','" . $birthday . "','" . $imgname . "')";
            $Result = $link->query($insertsql);
            if ($Result) {
                //讀剛新增會員編號
                $SQLstring = sprintf("SELECT emailid FROM member WHERE email='%s'", $email);
                $Result = $link->query($SQLstring);
                $data = $Result->fetch();
                //將會員的姓名、電話、地址寫入addbook
                $insertsql = "INSERT INTO addbook (emailid,setdefault,cname,mobile,tel,myzip,address) VALUES ('" . $data['emailid'] . "','1','" . $cname . "','" . $mobile . "','" . $tel . "','" . $myzip . "','" . $address . "')";
                $Result = $link->query($insertsql);
                //設定會員註冊完直接登入
                $_SESSION['login'] = true;
                $_SESSION['emailid'] = $data['emailid'];
                $_SESSION['email'] = $email;
                $_SESSION['cname'] = $cname;
                echo "<script language='javascript'>alert('謝謝您，會員資料已完成註冊');location.href='index.php';</script>";
            }
        }
        ?>
        <section id="content-mid">
            <div class="container" style="margin-top: 12vh;">
                <div class="row mt-5 mx-auto col-md-7">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title mt-2 text-center">加入會員</h2>
                            <form id="reg" name="reg" action="register.php" method="post">
                                <div class="form-group mt-3">
                                    <h5 for="email">帳號(請填Email)<span class="registermust fa-lg">*</span></h5>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="請填寫有效的email">
                                </div>
                                <div class="form-group mt-3">
                                    <h5 for="pw1">密碼<span class="registermust fa-lg">*</span></h5>
                                    <input type="password" class="form-control" id="pw1" name="pw1" placeholder="請輸入6-20位英文字母與數字的組合">
                                </div>
                                <div class="form-group mt-3">
                                    <h5 for="pw2">再次輸入密碼<span class="registermust fa-lg">*</span></h5>
                                    <input type="password" class="form-control" id="pw2" name="pw2" placeholder="請填寫確認密碼">
                                </div>
                                <div class="form-group mt-3">
                                    <h5 for="cname">姓名<span class="registermust fa-lg">*</span></h5>
                                    <input type="text" class="form-control" id="cname" name="cname" placeholder="請輸入姓名">
                                </div>
                                <div class="form-group mt-3">
                                    <h5 for="cname">身份證字號(非必填)</h5>
                                    <input type="text" class="form-control" id="tssn" name="tssn" placeholder="請輸入身份證字號">
                                </div>
                                <div class="form-group mt-3">
                                    <h5 for="birthday">生日(非必填)</h5>
                                    <input type="text" class="form-control" id="birthday" name="birthday" onfocus="(this.type='date')" placeholder="請選擇生日">
                                </div>
                                <div class="form-group mt-3">
                                    <h5 for="mobile">手機號碼<span class="registermust fa-lg">*</span></h5>
                                    <input type="tel" class="form-control" id="mobile" name="mobile" placeholder="請輸入手機號碼">
                                </div>
                                <div class="form-group mt-3">
                                    <h5 for="tel">市內電話(非必填)</h5>
                                    <input type="tel" class="form-control" id="tel" name="tel" placeholder="請填寫市內電話號碼">
                                </div>
                                <div class="form-group mt-3">
                                    <h5 for="myCity">居住地(非必填)</h5>
                                    <select class="form-select" id="myCity" name="myCity">
                                        <option value="">請選擇縣市</option>
                                        <?php $city = "SELECT * FROM city WHERE State=0";
                                        $city_rs = $link->query($city);
                                        while ($city_rows = $city_rs->fetch()) {
                                        ?>
                                            <option value="<?php echo $city_rows['AutoNo']; ?>"><?php echo $city_rows['Name']; ?></option>
                                        <?php } ?>
                                    </select>
                                    <select class="form-select" id="myTown" name="myTown">
                                        <option value="">請選擇鄉、鎮、市、區</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <p class="mt-2" id="zipcode" name="zipcode">郵遞區號：地址</p>
                                    <input type="hidden" id="myZip" name="myZip" value="">
                                    <input type="text" class="form-control" id="address" name="address" placeholder="請輸入後續地址">
                                </div>
                                <div class="form-guoup mt-3">
                                    <h5 style="margin-bottom: 0px;">上傳會員圖片(非必填)</h5>
                                    <input type="file" class="form-control" name="fileToUpload" id="fileToUpload" title="請上傳會員圖片" accept="image/x-png,image/jpeg,image/gif,image/ipg">
                                    <p><button type="button" class="btn btn-danger mt-2" id="uploadForm" name="uploadForm">開始上傳</button></p>
                                    <div id="progress-div01" class="progress mt-2" style="width: 100%;display:none">
                                        <div id="progress-bar01" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">0%
                                        </div>
                                    </div>
                                    <input type="hidden" id="uploadname" name="uploadname" value="">
                                    <img id="showimg" name="showimg" src="" class="img-fluid" alt="photo" style="display: none;">
                                </div>
                                <div class="form-group mt-3">
                                    <input type="hidden" id="captcha" name="captcha" value="">
                                    <a href="javascript:void(0);" onclick="gencode01(60,25,8,5,'black','white',5,250,5,'captcha','renew');" title="按我更新認證碼">
                                        <script type="text/javascript">
                                            gencode01(60, 25, 8, 5, 'black', 'white', 5, 250, 5, 'captcha', 'new');
                                        </script>
                                    </a>
                                    <a href="javascript:void(0);" onclick="gencode01(60,25,8,5,'black','white',5,250,5,'captcha','renew');" title="按我更新認證碼"><i class="fa-solid fa-arrows-rotate fa-fw fa-lg"></i></a>
                                    <input type="text" class="form-control mt-2" id="recaptcha" name="recaptcha" placeholder="請輸入驗證碼">
                                </div>
                                <input type="hidden" id="formctl" name="formctl" value="reg">
                                <div class="mx-auto col-5 col-md-3 d-grid gap-2 mt-3">
                                    <button type="submit" class="btn btn-green btn-lg">註冊
                                    </button>
                                </div>
                            </form>
                            <div class="text-center mt-3"><span>已經是會員？</span><a href="./login.php"><span class="color-form-text ms-3">請點我登入</span></a></div>
                        </div>
                    </div>
                </div>
            </div>
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
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <script type="text/javascript">
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
                        $('#myZip').val(""); //避免重新選擇縣市後郵遞區號還存在，所以在重新選擇縣市後郵遞區號欄位先清空
                    } else {
                        $('#zipcode').html('');
                    }
                },
                error: function(data) {
                    alert("ajax request error");
                }
            });
        });
        //取得縣市碼後查詢鄉鎮市名稱放入#myZip,#zipcode
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
                        $('#zipcode').html(data.Post + data.Cityname + data.Name);
                    } else {
                        $('#zipcode').html('');
                    }
                },
                error: function(data) {
                    alert("ajax request error");
                }
            });
        });
        //------------------
        $(function() {
            $('#uploadForm').click(function(e) {
                var fileName = $('#fileToUpload').val();
                var idxDot = fileName.lastIndexOf(".") + 1;
                var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                if (extFile == "jpg" || extFile == "jpeg" || extFile == "png" || extFile == "gif") {
                    $("#progress-div01").css("display", "flex");
                    var file1 = getId("fileToUpload").files[0];
                    var formdata = new FormData();
                    formdata.append("file1", file1);
                    var ajax = new XMLHttpRequest();
                    ajax.upload.addEventListener("progress", progressHandler, false);
                    ajax.addEventListener("load", completeHandler, false);
                    ajax.addEventListener("error", errorHandler, false);
                    ajax.addEventListener("abort", abortHandler, false);
                    ajax.open("POST", "./split_file/file_upload_parser.php");
                    ajax.send(formdata);
                    return false;
                } else {
                    alert("目前只支援jpg,jpeg,png,gif檔案格式上傳!");
                }
            });
        });
        //取得元件Id
        function getId(el) {
            return document.getElementById(el);
        }
        //上傳過程顯示%百分比
        function progressHandler(event) {
            var percent = Math.round((event.loaded / event.total) * 100);
            $("#progress-bar01").css("width", percent + "%");
            $("#progress-bar01").html(percent + "%");
        }
        //上傳完成處理顯示圖片
        function completeHandler(event) {
            var data = JSON.parse(event.target.responseText);
            if (data.success == 'true') {
                $('#uploadname').val(data.filename);
                $('#showimg').attr({
                    'src': './uploads/' + data.filename,
                    'style': 'display:block;'
                });
                $('button.btn.btn-danger').attr({
                    'style': 'display:none;'
                });
            } else {
                alert(data.error);
            }
        }
        //Upload Failed:上傳發生錯誤處理
        function errorHandler(event) {
            alert("Upload Failed:上傳發生錯誤");
        }
        //Upload Aborted:上傳作業取消處理
        function abortHandler(event) {
            alert("Upload Aborted:上傳作業取消");
        }
        //驗證form #reg表單
        $('#reg').validate({
            rules: {
                email: {
                    required: true,
                    email: true,
                    remote: './split_file/checkemail.php'
                },
                pw1: {
                    required: true,
                    maxlength: 20,
                    minlength: 6,
                },
                pw2: {
                    required: true,
                    equalTo: '#pw1'
                },
                cname: {
                    required: true,
                },
                tssn: {
                    //required: true,
                    tssn: true
                },
                birthday: {
                    //required: true,
                },
                mobile: {
                    required: true,
                    checkphone: true,
                },
                tel: {
                },
                address: {
                    //required: true,
                },
                recaptcha: {
                    required: true,
                    equalTo: '#captcha'
                },
            },
            messages: {
                email: {
                    required: '<i class="fa-solid fa-bell fa-fw"></i>email信箱不得為空白',
                    email: '<i class="fa-solid fa-bell fa-fw"></i>email信箱格式有誤',
                    remote: '<i class="fa-solid fa-bell fa-fw"></i>email信箱已經註冊'
                },
                pw1: {
                    required: '<i class="fa-solid fa-bell fa-fw"></i>密碼不得為空白',
                    maxlength: '<i class="fa-solid fa-bell fa-fw"></i>密碼最大長度為20位(6-20位英文字母與數字的組合)',
                    minlength: '<i class="fa-solid fa-bell fa-fw"></i>密碼最小長度為6位(6-20位英文字母與數字的組合)',
                },
                pw2: {
                    required: '<i class="fa-solid fa-bell fa-fw"></i>確認密碼不得為空白',
                    equalTo: '<i class="fa-solid fa-bell fa-fw"></i>兩次輸入的密碼必須一致！'
                },
                cname: {
                    required: '<i class="fa-solid fa-bell fa-fw"></i>使用者名稱不得為空白',
                },
                tssn: {
                    //required: '身份證ID不得為空白',
                    tssn: '<i class="fa-solid fa-bell fa-fw"></i>身份證格式有誤!'
                },
                birthday: {
                    //required: '<i class="fa-solid fa-bell fa-fw"></i>生日不得為空白',
                },
                mobile: {
                    required: '<i class="fa-solid fa-bell fa-fw"></i>手機號碼不得為空白',
                    checkphone: '<i class="fa-solid fa-bell fa-fw"></i>手機號碼格式有誤',
                },
                tel: {
                    //required: '<i class="fa-solid fa-bell fa-fw"></i>市話號碼不得為空白',
                },
                address: {
                    //required: '地址不得為空白',
                },
                recaptcha: {
                    required: '<i class="fa-solid fa-bell fa-fw"></i>驗證碼不得為空白！',
                    equalTo: '<i class="fa-solid fa-bell fa-fw"></i>驗證碼需相同！ '
                },
            },
        });
        //自訂身份證格式驗證
        jQuery.validator.addMethod("tssn", function(value, element, param) {
            var tssn = /^[a-zA-Z]{1}[1-2]{1}[0-9]{8}$/;
            return this.optional(element) || (tssn.test(value));
        }, "身份證格式有誤!");
        //自訂電話驗證
        jQuery.validator.addMethod("checkphone", function(value, element, param) {
            var checkphone = /^[0]{1}[9]{1}[0-9]{8}$/;
            return this.optional(element) || (checkphone.test(value));
        }, "電話格式有誤!");
        //自訂驗證碼格式認證
        jQuery.validator.addMethod("captcha", function(value, element, param) {
            // var captcha = /^[0-9-a-z_A-Z]{4}$/;
            var captcha = /^[0-9a-z_A-Z]{5}$/;
            return this.optional(element) || (captcha.test(value));
        }, "驗證碼格式有誤!");
    </script>
</body>


</html>
<?php
//判斷$num是否等於$chkPoint，若是則回傳active，可用於設定起始分頁carousel
function activeShow($num, $chkPoint)
{
    return (($num == $chkPoint) ? "active" : "");
}
?>