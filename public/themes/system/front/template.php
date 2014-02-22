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


        <link href="<?php echo $this->theme_path; ?>font-awesome.css" rel="stylesheet">
        <link href="<?php echo $this->theme_path; ?>js/swiperjs/idangerous.swiper.css" rel="stylesheet">
        <link href="<?php echo $this->theme_path; ?>front/templates/adminstyle_less.css" rel="stylesheet">

    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<?php echo $this->theme_path; ?>share-js/jquery.min.js"></script>
    <script src="<?php echo $this->theme_path; ?>bootstrap-3.0.0/dist/js/bootstrap.min.js"></script>

    <!--     
    <script type="text/javascript" src="<?php echo $this->theme_path; ?>js/jquery-1.10.2.min.js"></script>
    --> 

    <script type="text/javascript" src="<?php echo $this->theme_path; ?>js/jquery-ui-1.10.3.min.js"></script>
    <script type="text/javascript" src="<?php echo $this->theme_path; ?>js/custom.js"></script>
    <script type="text/javascript" src="<?php echo $this->theme_path; ?>js/jplayer/jquery.jplayer.min.js"></script>
    <script type="text/javascript" src="<?php echo $this->theme_path; ?>js/swiperjs/idangerous.swiper.js"></script>
    <script src="<?php echo $this->theme_path; ?>js/modernizr-2.5.3.min.js"></script>

    <script src="<?php echo $this->theme_path; ?>js/imagesloaded.pkgd.js"></script>
        

    <script type="text/javascript" src="<?php echo $this->theme_path; ?>js/ajaxupload.js"></script>


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
    </div>

    <!-- END banner area -->

    <?php  

    $query = $this->db->get( 'type_shop' );
    $data_type = $query->result();


    ?>

    <div class="content-wrap">
        <div class="main-container">
            <header>
                <nav>
                    <ul>
                        <li <?php echo $hover = ( $hover_menu == 'HOME' ) ? 'class="current-item"' : '' ; ?> >
                            <a href="<?php echo site_url(); ?>">HOME</a>
                        </li>
                        <li style="display:none"> <?php echo $hover = ( $hover_menu == 'NEWS' ) ? 'class="current-item"' : '' ; ?> >
                            <a href="<?php echo site_url( 'index/news' ) ?>">NEWS</a>
                        </li>
                        <li <?php echo $hover = ( $hover_menu == 'SHOP' ) ? 'class="current-item"' : 'class="subnav"' ; ?>>
                            <a href="#">SHOP</a>
                            <ul>
                                <?php foreach ( $data_type as $key => $value ): ?>
                                    <li><a href="<?php echo site_url( 'index/shop/'.$value->id ) ?>"><?php echo $value->name_shop ?></a></li>
                                <?php endforeach ?>
                            </ul>
                        </li>
                        <li <?php echo $hover = ( $hover_menu == 'COUPON' ) ? 'class="current-item"' : 'class="subnav"' ; ?>>
                            <a href="#">COUPON</a>
                            <ul>
                                <?php foreach ( $data_type as $key => $value ): ?>
                                    <li><a href="<?php echo site_url( 'index/coupon/'.$value->id ) ?>"><?php echo $value->name_shop ?></a></li>
                                <?php endforeach ?>
                            </ul>
                        </li>
                        <li <?php echo $hover = ( $hover_menu == 'CONTACT US' ) ? 'class="current-item"' : '' ; ?> >
                            <a href="<?php echo site_url( 'index/contact' ) ?>">CONTACT US</a>
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

        <!-- <footer>

        </footer> -->

        <!-- END footer -->

        <div class="copyrights-content">
            CREATE BY GROUP STUDEN SIAM UNIVERSITY
        </div>
        
        <div class="footer-logo">
            <img src="http://localhost/easytrade-master/public/themes/system/images/logo_web_mini.png">    
        </div>

    </div>
    
  </body>
</html>