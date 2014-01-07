<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Easy Trade</title>

        <!-- Bootstrap core CSS -->
        <link href="<?php echo $this->theme_path; ?>bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<?php echo $this->theme_path; ?>style.css" rel="stylesheet">
        <link href="<?php echo $this->theme_path; ?>front/templates/adminstyle_less.css" rel="stylesheet">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;subset=latin,cyrillic-ext,cyrillic' rel='stylesheet' type='text/css'>

    	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
        <link href="<?php echo $this->theme_path; ?>js/swiperjs/idangerous.swiper.css" rel="stylesheet">
        <link href="<?php echo $this->theme_path; ?>js/big-video/css/bigvideo.css" rel="stylesheet">

        
        <!-- Client side less compiling 
        <link rel="stylesheet/less" type="text/css" href="style.less">-->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="<?php echo $this->theme_path; ?>bootstrap-3.0.0/assets/js/html5shiv.js"></script>
          <script src="<?php echo $this->theme_path; ?>bootstrap-3.0.0/assets/js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

    <!-- BEGIN banner area -->

    <div class="top-banner-area">
        <a href="#"><img src="<?php echo $this->theme_path; ?>images/logo_web.png" alt="Logo"></a>
        <span class="box-register">
            <a href="<?php echo site_url( 'index/register' ) ?>">Register</a>&nbsp; | &nbsp;
            <a href="#">Login</a>
        </span>
    </div>

    <!-- END banner area -->

    <div class="content-wrap">
        <div class="main-container">
            <header>
                <nav>
                    <ul>
                        <li class="current-item">
                            <a href="<?php echo site_url(); ?>"><i class="icon-home"></i>Home</a>
                        </li>
                        <li>
                            <a href="#">NEWS</a>
                        </li>
                        <li>
                            <a href="#">SHOP</a>
                        </li>
                        <li>
                            <a href="#">COUPON</a>
                        </li>
                        <li>
                            <a href="#">CONTACT US</a>
                        </li>
  
                    </ul>
                </nav>
            </header>
            
            

            <span class="clear"></span>

            <!-- BEGIN page content -->

            <div class="row">

            <!-- BEGIN content -->

                <?php echo $page_content; ?> 

            <!-- END content -->


            </div>
            <span class="clear"></span>

            <!-- END page content -->

        </div>

        <!-- BEGIN footer -->

        <footer>


        </footer>

        <!-- END footer -->

        <div class="copyrights-content">
            CREATE BY GROUP STUDEN SIAM UNIVERSITY
        </div>
    </div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<?php echo $this->theme_path; ?>bootstrap-3.0.0/assets/js/jquery.js"></script>
    <script src="<?php echo $this->theme_path; ?>bootstrap-3.0.0/dist/js/bootstrap.min.js"></script>

    
	<script type="text/javascript" src="<?php echo $this->theme_path; ?>js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="<?php echo $this->theme_path; ?>js/jquery-ui-1.10.3.min.js"></script>
	<script type="text/javascript" src="<?php echo $this->theme_path; ?>js/custom.js"></script>
    <script type="text/javascript" src="<?php echo $this->theme_path; ?>js/jplayer/jquery.jplayer.min.js"></script>
    <script type="text/javascript" src="<?php echo $this->theme_path; ?>js/swiperjs/idangerous.swiper.js"></script>
    <script src="<?php echo $this->theme_path; ?>js/modernizr-2.5.3.min.js"></script>
    <script src="http://vjs.zencdn.net/4.0/video.js"></script>
    <script src="<?php echo $this->theme_path; ?>js/big-video/lib/bigvideo.js"></script>

    <script src="<?php echo $this->theme_path; ?>js/imagesloaded.pkgd.js"></script>
    
  </body>
</html>