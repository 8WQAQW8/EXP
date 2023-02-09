<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="./OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>

<script type="text/javascript" src="./js/wow.js"></script>
<script type="text/javascript" src="./js/morphext.js"></script>
<script type="text/javascript" src="./js/text_ctrl.js"></script>
<script type="text/javascript" src="./js/jslib.js"></script>
<script>
    //navbar
    let lastPos = 0
    const nav = document.querySelector('nav');
    document.addEventListener('scroll', function() {
        let currentPos = window.scrollY;
        if (currentPos > 38) {
            nav.style.top = "-110px";
        }
        if (currentPos <= lastPos) {
            nav.style.top = "-40px";
        }
        if (currentPos <= 38) {
            nav.style.top = "0px";
        }
        lastPos = currentPos;
    });
</script>
<script>
    //網頁載入彈出視窗
    $(window).ready(() => {
        $('#MyModal').modal('show');
    })
</script>
<script>
    $(".owl-carousel").owlCarousel({
        loop: true, // 循環播放
        margin: 10, // 外距 10px
        nav: true, // 顯示點點
        responsive: {
            0: {
                items: 2 // 螢幕大小為 0~600 顯示 1 個項目
            },
            600: {
                items: 3 // 螢幕大小為 600~1000 顯示 3 個項目
            },
            1000: {
                items: 4 // 螢幕大小為 1000 以上 顯示 4 個項目
            }
        }
    });
</script>
<button type="button" id="BackTop" class="toTop-arrow"></button>
<script>
    $(function() {
        $('#BackTop').click(function() {
            $('html,body').animate({
                scrollTop: 0
            }, 200);
        });
        $(window).scroll(function() {
            if ($(this).scrollTop() > 200) {
                $('#BackTop').fadeIn(360);
            } else {
                $('#BackTop').stop().fadeOut(360);
            }
        }).scroll();
    });
</script>
<script type="text/javascript">
    $(function() {
        $('.dropdown-submenu>a').on("click", function(e) {
            var submenu = $(this);
            $('.dropdown-submenu .dropdown-menu').removeClass('show');
            submenu.next('.dropdown-menu').addClass('show');
            e.stopPropagation();
        });
        $('.dropdown').on("hidden.bs.dropdown", function() {
            //hide any open menus when parent closes
            $('.dropdown-menu.show').removeClass('show');
        });
    });
</script>