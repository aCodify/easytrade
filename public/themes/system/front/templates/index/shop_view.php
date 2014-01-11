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





<content>

    <div class="row content-row">

        <div class="col-md-4 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop/detail' ) ?>"><img alt="demo image" src="<?php echo $this->theme_path; ?>images/test-image-22.png"></a>
                <div class="album-caption">
                    <h4><a href="#">Wood Floor</a></h4>
                    <span>Band Name</span>
                </div>
            </div>
        </div>

        <div class="col-md-4 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop/detail' ) ?>"><img alt="demo image" src="<?php echo $this->theme_path; ?>images/test-image-23.png"></a>
                <div class="album-caption">
                    <h4><a href="#">Blue Lights</a></h4>
                    <span>The Band</span>
                </div>
            </div>
        </div>

        <div class="col-md-4 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop/detail' ) ?>"><img alt="demo image" src="<?php echo $this->theme_path; ?>images/test-image-24.png"></a>
                <div class="album-caption">
                    <h4><a href="#">Red Lips</a></h4>
                    <span>Bando</span>
                </div>
            </div>
        </div>



        <div class="col-md-4 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop/detail' ) ?>"><img alt="demo image" src="<?php echo $this->theme_path; ?>images/test-image-25.png"></a>
                <div class="album-caption">
                    <h4><a href="#">Red Guitar</a></h4>
                    <span>Bandata</span>
                </div>
            </div>
        </div>

        <div class="col-md-4 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop/detail' ) ?>"><img alt="demo image" src="<?php echo $this->theme_path; ?>images/test-image-26.png"></a>
                <div class="album-caption">
                    <h4><a href="#">Green Grass</a></h4>
                    <span>Band Name</span>
                </div>
            </div>
        </div>

        <div class="col-md-4 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop/detail' ) ?>"><img alt="demo image" src="<?php echo $this->theme_path; ?>images/test-image-27.png"></a>
                <div class="album-caption">
                    <h4><a href="#">A cup of milk</a></h4>
                    <span>The Strange Band</span>
                </div>
            </div>
        </div>



        <div class="col-md-4 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop/detail' ) ?>"><img alt="demo image" src="<?php echo $this->theme_path; ?>images/test-image-28.png"></a>
                <div class="album-caption">
                    <h4><a href="#">Album Name</a></h4>
                    <span>Band Name</span>
                </div>
            </div>
        </div>

        <div class="col-md-4 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop/detail' ) ?>"><img alt="demo image" src="<?php echo $this->theme_path; ?>images/test-image-29.png"></a>
                <div class="album-caption">
                    <h4><a href="#">Album Name</a></h4>
                    <span>The Crazy Band</span>
                </div>
            </div>
        </div>

        <div class="col-md-4 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop/detail' ) ?>"><img alt="demo image" src="<?php echo $this->theme_path; ?>images/test-image-30.png"></a>
                <div class="album-caption">
                    <h4><a href="#">Strange Face</a></h4>
                    <span>Band Name</span>
                </div>
            </div>
        </div>

    </div>

</content>
