                <div class="col-md-12">
                    <content>


                        <div class="bluebox-heading">
                            <h3>Featured</h3>
                            <!-- <a href="#"><i class="icon-list-ul"></i>All News +</a> -->
                        </div>

                        <div class="row content-row">

                            <?php if ( $show_data ): ?>
                                

                            <?php foreach ( $show_data as $key => $value ): ?>
                                

                            <div class="col-md-4">
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