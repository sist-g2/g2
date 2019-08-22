<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link href="../css/animate.min.css" rel="stylesheet"> 
<link href="../css/lightbox.css" rel="stylesheet"> 
<link href="../css/main.css" rel="stylesheet">
<link href="../css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<header id="header">      
    <div class="container">
        <div class="row">
        	<!-- <div class="pull-right">
        		<ul class="nav nav-pills">
        			<li><a href="#">마이페이지</a></li>
        			<li><a href="#">로그아웃</a></li>
        			<li><a href="#">사이트 이용안내</a></li>
        		</ul>
        	</div> -->
        	<div class="pull-right">
        		<ul class="nav nav-pills">
        			<li><a href="#">로그인</a></li>
        			<li><a href="#">회원가입</a></li>
        			<li><a href="#">사이트 이용안내</a></li>
        		</ul>
        	</div>
            <!-- <div class="col-sm-12 overflow">
               <div class="social-icons pull-right">
                    <ul class="nav nav-pills">
                        <li><a href=""><i class="fa fa-facebook"></i></a></li>
                        <li><a href=""><i class="fa fa-twitter"></i></a></li>
                        <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                        <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                        <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div> 
            </div> -->
         </div>
    </div>
    <div class="navbar navbar-inverse" role="banner">
        <div class="container">
            <div class="navbar-header">
                <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button> -->
                <a class="navbar-brand" href="../main/main.jsp">
                	<h1><img src="../images/FounDog.png" alt="logo"></h1>
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="../main/main.jsp">Home</a></li>
                    <li class="dropdown"><a href="../feed/feed_list.do">사료비교 <!-- <i class="fa fa-angle-down"></i> --></a>
                        <!-- <ul role="menu" class="sub-menu">
                            <li><a href="../template/singlecolor/aboutus.html">About</a></li>
                            <li><a href="../template/singlecolor/aboutus2.html">About 2</a></li>
                            <li><a href="../template/singlecolor/service.html">Services</a></li>
                            <li><a href="../template/singlecolor/pricing.html">Pricing</a></li>
                            <li><a href="../template/singlecolor/contact.html">Contact us</a></li>
                            <li><a href="../template/singlecolor/contact2.html">Contact us 2</a></li>
                            <li><a href="../template/singlecolor/404.html">404 error</a></li>
                            <li><a href="../template/singlecolor/coming-soon.html">Coming Soon</a></li>
                        </ul> -->
                    </li>                  
                    <li class="dropdown"><a href="../hospital/sample.do">병원이용 <!-- <i class="fa fa-angle-down"></i> --></a>
                        <!-- <ul role="menu" class="sub-menu">
                            <li><a href="../template/singlecolor/blog.html">Blog Default</a></li>
                            <li><a href="../template/singlecolor/blogtwo.html">Timeline Blog</a></li>
                            <li><a href="../template/singlecolor/blogone.html">2 Columns + Right Sidebar</a></li>
                            <li><a href="../template/singlecolor/blogthree.html">1 Column + Left Sidebar</a></li>
                            <li><a href="../template/singlecolor/blogfour.html">Blog Masonary</a></li>
                            <li><a href="../template/singlecolor/blogdetails.html">Blog Details</a></li>
                        </ul> -->
                    </li>
                    <li class="dropdown"><a href="../template/singlecolor/portfolio.html">강아지와 함께 <!-- <i class="fa fa-angle-down"></i> --></a>
                        <!-- <ul role="menu" class="sub-menu">
                            <li><a href="../template/singlecolor/portfolio.html">Portfolio Default</a></li>
                            <li><a href="../template/singlecolor/portfoliofour.html">Isotope 3 Columns + Right Sidebar</a></li>
                            <li><a href="../template/singlecolor/portfolioone.html">3 Columns + Right Sidebar</a></li>
                            <li><a href="../template/singlecolor/portfoliotwo.html">3 Columns + Left Sidebar</a></li>
                            <li><a href="../template/singlecolor/portfoliothree.html">2 Columns</a></li>
                            <li><a href="../template/singlecolor/portfolio-details.html">Portfolio Details</a></li>
                        </ul> -->
                    </li>                         
                    <li><a href="../template/singlecolor/shortcodes.html ">커뮤니티</a></li>                    
                </ul>
            </div>
            <!-- <div class="search">
                <form role="form">
                    <i class="fa fa-search"></i>
                    <div class="field-toggle">
                        <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                    </div>
                </form>
            </div> -->
        </div>
    </div>
</header>
<!--/#header-->

<jsp:include page="${main_jsp }" ></jsp:include>

<footer id="footer">
    <div class="container">
        <div class="row">
            <!-- <div class="col-sm-12 text-center bottom-separator">
                <img src="../images/home/under.png" class="img-responsive inline" alt="">
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="testimonial bottom">
                    <h2>Testimonial</h2>
                    <div class="media">
                        <div class="pull-left">
                            <a href="#"><img src="../images/home/profile1.png" alt=""></a>
                        </div>
                        <div class="media-body">
                            <blockquote>Nisi commodo bresaola, leberkas venison eiusmod bacon occaecat labore tail.</blockquote>
                            <h3><a href="#">- Jhon Kalis</a></h3>
                        </div>
                     </div>
                    <div class="media">
                        <div class="pull-left">
                            <a href="#"><img src="../images/home/profile2.png" alt=""></a>
                        </div>
                        <div class="media-body">
                            <blockquote>Capicola nisi flank sed minim sunt aliqua rump pancetta leberkas venison eiusmod.</blockquote>
                            <h3><a href="">- Abraham Josef</a></h3>
                        </div>
                    </div>   
                </div> 
            </div> -->
            <!-- <div class="col-md-3 col-sm-6">
                <div class="contact-info bottom">
                    <h2>Contacts</h2>
                    <address>
                    E-mail: <a href="mailto:someone@example.com">email@email.com</a> <br> 
                    Phone: +1 (123) 456 7890 <br> 
                    Fax: +1 (123) 456 7891 <br> 
                    </address>

                    <h2>Address</h2>
                    <address>
                    Unit C2, St.Vincent's Trading Est., <br> 
                    Feeder Road, <br> 
                    Bristol, BS2 0UY <br> 
                    United Kingdom <br> 
                    </address>
                </div>
            </div> -->
            <!-- <div class="col-md-4 col-sm-12">
                <div class="contact-form bottom">
                    <h2>Send a message</h2>
                    <form id="main-contact-form" name="contact-form" method="post" action="sendemail.php">
                        <div class="form-group">
                            <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control" required="required" placeholder="Email Id">
                        </div>
                        <div class="form-group">
                            <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your text here"></textarea>
                        </div>                        
                        <div class="form-group">
                            <input type="submit" name="submit" class="btn btn-submit" value="Submit">
                        </div>
                    </form>
                </div>
            </div> -->
            <div class="col-sm-12">
                <div class="copyright-text text-center">
                    <p>&copy; Your Company 2014. All Rights Reserved.</p>
                    <p>Designed by <a target="_blank" href="http://www.themeum.com">Themeum</a></p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--/#footer-->

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/lightbox.min.js"></script>
<script type="text/javascript" src="../js/wow.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>   
</body>
</html>