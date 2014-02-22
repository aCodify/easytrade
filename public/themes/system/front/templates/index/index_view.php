                <div class="col-md-12">
                    <content>

                        <!-- BEGIN slider -->

                        <div class="bb-slider-2 bluebox-slider" data-direction-nav=".arrow-links-wrap" data-control-nav=".slider-control-nav">
                            <div class="swiper-slide set_header">
                                <img src="public/images/banner01.jpg" class=" img-preload" alt="sample image" data-aspectratio="1.3333" id="img-52552406dfa3e">
                                <div class="slider-caption">
                                    <!-- <h4>
                                        <a href="#"><span>Banda - HTML5 Music Magazine<span></span></span></a>
                                    </h4> -->
                                </div>
                            </div>

                            <?php $info = $this->account_model->get_account_cookie( 'member' ) ?>

                            <?php if ( empty( $info ) ): ?>
    
                                <?php echo form_open( site_url( 'account/login' ) , array('class' => 'form-horizontal')); ?> 
                                <div style="float: left; background: none repeat scroll 0% 0% rgb(255, 255, 255); margin-left: 10px; width: 270px; border-radius: 3px; height: 150px;">
                                    <div style="float: right;">
                                        <div style="padding-top: 10px; padding-right: 10px;">
                                            <span style="position: relative; display: inline-block; width: 60px; padding-left: 0px;" >Username</span> <input name="account_username" autocomplete="off" placeholder="Enter Username" type="text" clear="set_input" style="width: 14em;">
                                        </div>
                                        <div>
                                            <span style="position: relative; width: 60px; display: inline-block;" >Password</span>  <input name="account_password" autocomplete="off" placeholder="Password" type="password" clear="set_input" style="width: 14em;">
                                        </div>
                                        <button class="btn-default cursor_pointer "  style="float: right; margin-right: 10px; padding: 5px 15px;" >Login</button>
                                        <a style="float: right; background: none repeat scroll 0% 0% transparent; margin-right: 25px;" class="btn-default" href="<?php echo site_url( 'account/register' ) ?>" style="margin-left: 120px;"> Register </a>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>       
                                
                            <?php else: ?>

                                <?php  

                                $this->db->where( 'account_id', $info['id'] );

                                $query = $this->db->get( 'accounts' );

                                $data = $query->row();

                                ?>

                                <div style="float: left; background: none repeat scroll 0% 0% rgb(255, 255, 255); margin-left: 10px; width: 270px; border-radius: 3px;">
                                    <div style="position: relative; float: left;" >
                                        <?php if ( ! empty( $data->account_avatar ) ): ?>
                                            <a href="<?php echo site_url('index/shop_detail/'.$data->account_id) ?>">
                                            <img src="<?php echo base_url( 'public/upload/img_cover/'.$data->account_avatar ) ?>" alt="" style="width: 150px; border: 5px solid rgb(255, 255, 255); border-radius: 3px;" >
                                            </a>
                                        <?php endif ?>
                                    </div>
                                    <div class="set-icon">
                                        <a href="<?php echo site_url( 'account/edit_profile' ) ?>"> <img src="public/images/icon-setting.png" title="แก้ไขข้อมูลร้านค้า"> </a>
                                    </div>
                                    <div class="text-shop">
                                        <div style="float: left; display: inline-block;" >
                                            <span style="position: relative; display: table-caption; float: left; text-align: center; width: 120px;" >ยินดีต้อนรับร้าน</span> <span></span>
                                        </div>
                                        <div>
                                            <span style="display: table; position: relative; float: left; color: rgb(231, 76, 60); height: 1px; text-align: center; width: 120px;" >
                                                <?php echo $data->name_shop ?>
                                            </span>
                                        </div>
                                        <p style="text-align: center;" ><a href="<?php echo site_url('index/my_shop/'.$data->account_id) ?>">ข้อมูลร้านค้า</a></p>
                                    </div>
                                    <div>
                                        <span style="display: table-caption; position: relative; float: left; text-align: center; width: 120px;" ><a class="btn btn-primary" style="margin-top: 0px;" href="<?php echo site_url( 'account/logout' ) ?>">ออกจากระบบ</a></span>
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
                                                <img src="http://placehold.it/250x250" alt="">
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