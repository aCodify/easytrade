                <div class="col-md-12">
                    <content>

                        <!-- BEGIN slider -->

                        <div class="bb-slider-2 bluebox-slider" data-direction-nav=".arrow-links-wrap" data-control-nav=".slider-control-nav">
                            <div class="swiper-slide set_header">
                                <img src="public/images/banner.jpg" class=" img-preload" alt="sample image" data-aspectratio="1.3333" id="img-52552406dfa3e">
                                <div class="slider-caption">
                                    <!-- <h4>
                                        <a href="#"><span>Banda - HTML5 Music Magazine<span></span></span></a>
                                    </h4> -->
                                </div>
                            </div>

                            <?php $info = $this->account_model->get_account_cookie( 'member' ) ?>

                            <?php if ( empty( $info ) ): ?>
    
                                <?php echo form_open( site_url( 'account/login' ) , array('class' => 'form-horizontal')); ?> 
                                <div style="float: right;">
                                    <div>
                                        <span style="position: relative; width: 57px; display: inline-block;" >Login</span> <input name="account_username" type="text" clear="set_input" style="width: 15em;">
                                    </div>
                                    <div>
                                        <span style="position: relative; width: 57px; display: inline-block;" >Password</span>  <input name="account_password" type="password" clear="set_input" style="width: 15em;">
                                    </div>
                                    <button class="btn-default cursor_pointer "  style="float: right;" >Login</button>
                                    <a style="float: right; margin-right: 25px;" class="btn-default" href="<?php echo site_url( 'account/register' ) ?>" style="margin-left: 120px;"> Register </a>
                                </div>
                                <?php echo form_close(); ?>       
                                
                            <?php else: ?>

                                <?php  

                                $this->db->where( 'account_id', $info['id'] );

                                $query = $this->db->get( 'accounts' );

                                $data = $query->row();

                                ?>

                                <div style="float: right;">
                                    <div style="position: relative; float: left; left: -3em;" >
                                        <?php if ( ! empty( $data->account_avatar ) ): ?>
                                            <img src="<?php echo base_url( 'public/upload/img_cover/'.$data->account_avatar ) ?>" alt="" style="width: 150px;" >
                                        <?php endif ?>
                                    </div>
                                    <div style="float: left; display: inline-block;" >
                                        <span style="display: table-caption; position: relative; width: 90px; margin-left: -44px;" >ร้าน</span> <span></span>
                                    </div>
                                    <div>
                                        <span style="display: table-caption; position: relative; width: 69px; margin-left: -60px;" >
                                            <a href="<?php echo site_url( 'account/edit_profile' ) ?>"><?php echo $data->name_shop ?></a>
                                        </span>
                                    </div>

                                    <div>
                                        <span style="display: table-caption; position: relative; width: 69px; margin-left: -44px;" ><a class="btn btn-primary" style="margin-top: 1em;margin-left:14px;" href="<?php echo site_url( 'account/logout' ) ?>">ออกจากระบบ</a></span>
                                    </div>
                                    
                                </div>

                            <?php endif ?>



                        </div>

                        <!-- END slider -->

                        <div class="bluebox-heading">
                            <h3>Featured</h3>
                            <!-- <a href="#"></i>All News +</a> -->
                        </div>

                        <div class="row content-row">

                            <?php foreach ( $show_account as $key => $value ): ?>
                                
                            <div class="col-md-4">
                                <div class="gallery-wrap">
                                    <div class="image-wrap">
                                        <a class="image-link" href="<?php echo site_url( 'index/shop_detail/'.$value->account_id ) ?>">
                                            <?php if ( ! empty( $value->account_avatar ) ): ?>
                                                <img src="<?php echo base_url( 'public/upload/img_cover/'.$value->account_avatar ) ?>" alt="demo image">
                                            <?php else: ?>
                                                <img src="http://fpoimg.com/150x150?text=Logo" alt="">
                                            <?php endif ?>
                                            <span class="image-details"></span> 
                                        </a>
                                        <div class="gallery-caption">
                                            <div>
                                                <h4><a href="#"><?php echo $value->name_shop ?></a></h4>
                                                <span><?php echo $value->detail_shop ?></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <?php endforeach ?>

                        </div>

                        <div class="row content-row">

                            <div class="col-md-4">
                                <div class="bluebox-heading">
                                    <h3>Latest Shop</h3>
                                    <a href="#"></i>All +</a>
                                </div>
                                <ul class="news-list">

                                    <?php foreach ( $latest_shop as $key => $value ): ?>
                                        
                                    <li>
                                        <a href="<?php echo site_url( 'index/shop_detail/'.$value->account_id ) ?>" class="image-wrap">
                                            <?php if ( ! empty( $value->account_avatar ) ): ?>
                                                <img src="<?php echo base_url( 'public/upload/img_cover/'.$value->account_avatar ) ?>" alt="" style="width:60px;">
                                            <?php else: ?>
                                                <img src="<?php echo base_url( 'public/images/shop.jpg' ) ?>" alt="demo image" style="width:60px;">
                                            <?php endif ?>
                                            <span class="image-details"></span>
                                        </a>
                                        <h4><a href="<?php echo site_url( 'index/shop_detail/'.$value->account_id ) ?>"><?php echo $value->name_shop ?></a></h4>
                                        <span><?php echo limit_text( $value->detail_shop , 40 ) ?></span>
                                    </li>
                                    <?php endforeach ?>



                                </ul>
                                <span class="clear"></span>
                            </div>


                            <div class="col-md-4">
                                <div class="bluebox-heading">
                                    <h3>Most Popular</h3>
                                    <a href="#"></i>All +</a>
                                </div>

                                <ul class="news-list">
                                    <?php foreach ( $most_popular as $key => $value ): ?>
                                    <li>
                                        <a href="<?php echo site_url( 'index/shop_detail/'.$value->account_id ) ?>" class="image-wrap">
                                            <?php if ( ! empty( $value->account_avatar ) ): ?>
                                                <img src="<?php echo base_url( 'public/upload/img_cover/'.$value->account_avatar ) ?>" alt="" style="width:60px;">
                                            <?php else: ?>
                                                <img src="<?php echo base_url( 'public/images/shop.jpg' ) ?>" alt="demo image" style="width:60px;">
                                            <?php endif ?>
                                            <span class="image-details"></span>
                                        </a>
                                        <h4><a href="<?php echo site_url( 'index/shop_detail/'.$value->account_id ) ?>"><?php echo $value->name_shop ?></a></h4>
                                        <span><?php echo limit_text( $value->detail_shop , 40 ) ?></span>
                                    </li>
                                    <?php endforeach ?>

                                </ul>
                                <span class="clear"></span>
                            </div>

                            <div class="col-md-4">
                                <div class="bluebox-heading">
                                    <h3>Coupon</h3>
                                    <a href="#"></i>All +</a>
                                </div>

                                <ul class="news-list">

                                    <li>
                                        <a href="#" class="image-wrap">
                                            <img src="public/images/shop.jpg" alt="demo image">
                                            <span class="image-details"></span>
                                        </a>
                                        <h4><a href="#">SHOP Name</a></h4>
                                        <span>SHOP Detail...</span>
                                    </li>

                                    <li>
                                        <a href="#" class="image-wrap">
                                            <img src="public/images/shop.jpg" alt="demo image">
                                            <span class="image-details"></span>
                                        </a>
                                        <h4><a href="#">SHOP Name</a></h4>
                                        <span>SHOP Detail...</span>
                                    </li>
                                    <li>
                                        <a href="#" class="image-wrap">
                                            <img src="public/images/shop.jpg" alt="demo image">
                                            <span class="image-details"></span>
                                        </a>
                                        <h4><a href="#">SHOP Name</a></h4>
                                        <span>SHOP Detail...</span>
                                    </li>
                                </ul>
                                <span class="clear"></span>
                            </div>
                        </div>
                    </content>
                </div>