<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Swiper demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="../css/swiper.min.css">    

    <!-- Demo styles -->
    <style>
    html, body {
        position: relative;
        height: 100%;
    }
/*     body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color:#000;
        margin: 0;
        padding: 0;
    } */
    .swiper-container {
        width: 1140px;
        height: 487px;
/*         width: 100%;
        height: 100%; */
        margin-left: auto;
        margin-right: auto;
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    </style>
</head>
<body>
    <!-- Swiper -->
    <div class="swiper-container">
		
        <div class="swiper-wrapper">        
            <div class="swiper-slide">
            <a href="../feed/feed_list.do"><img src="feedcompare.png" alt=""></a>
            </div>       
            <div class="swiper-slide">
             <a href="../hospital/hospital_list.do"><img src="hospital.png" alt=""></a>
            </div>        
            <div class="swiper-slide">
            <a href="../adminboard/adminboard_list.do"><img src="doginfo.png" alt=""></a>
            </div>        
            <div class="swiper-slide">
            <a href="../dogboard/dogboard_list.do"><img src="Organicdog.png" alt=""></a>
            </div>
        </div>
        </div>
        <!-- Add Pagination -->
   <!--      <div class="swiper-pagination"></div> -->

    <!-- Swiper JS -->
	<script src="../js/swiper.min.js"></script>
	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper('.swiper-container', {
			direction : 'vertical',
			slidesPerView : 1,
			spaceBetween : 30,
			mousewheel : true,
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
		});
	</script>
</body>
</html>