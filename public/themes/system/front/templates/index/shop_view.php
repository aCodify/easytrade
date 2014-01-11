<!--                 <div class="col-md-12">
                    <content>


                        <div class="bluebox-heading">
                            <h3>Featured</h3>
                        </div>

                        <div class="row content-row">

                            <?php if ( $show_data ): ?>
                                

                            <?php foreach ( $show_data as $key => $value ): ?>
                                

                            <div class="col-md-4 box-page-shop" >
                                <section class="featured-post">
                                    <a class="image-wrap" href="#">
                                        <img src="<?php echo $this->theme_path; ?>images/test-image-42.png" alt="demo image">
                                        <span class="image-details"></span>
                                    </a>
                                    <h1><a href="#"><?php echo $value->name ?></a></h1>
                                    <p><?php echo $value->store_address ?></p>
                                    <div class="bluebox-info-line">
                                        <span class="featured-post-date"><?php echo date( 'd-m-Y' ) ?></span>
                                        <span class="featured-post-author"><?php echo $value->name ?></span>
                                        <a class="more-link" href="#">Read More +</a>
                                    </div>
                                </section>
                            </div>

                            <?php endforeach ?>

                            <?php endif ?>


                        </div>

    

                    </content>
                </div>
 -->




<h4>ร้านค้า : <span style="color:#E74C3C">อุปกรณ์แต่งบ้าน</span></h4>
<hr>
<content>

    <div class="row content-row">

        <?php for ( $i=1; $i <= 9 ; $i++ ) { ?>
            
        

        <div class="col-md-3 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop/detail' ) ?>"><img alt="demo image" src="http://fpoimg.com/200x200?text=Preview"></a>
                <div class="album-caption">
                    <h4><a href="#">Wood Floor</a></h4>
                    <span>Band Name</span>
                </div>
            </div>
        </div>


        <?php } ?>

    </div>

</content>
