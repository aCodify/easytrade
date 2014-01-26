<div class="col-md-12">


<h4>ร้านค้า : <span style="color:#E74C3C"><?php echo $type->name_shop ?></span></h4>
<hr>
<content>

    <div class="row content-row">

        
        <?php foreach ( $show_data as $key => $value ): ?>
            
        

        <div class="col-md-3 box-page-shop" >
            <div class="album-wrap">
                <a href="<?php echo site_url( 'index/shop_detail/'.$value->account_id ) ?>">
                <?php if ( ! empty( $value->account_avatar ) ): ?>
                    <img src="<?php echo base_url( 'public/upload/img_cover/'.$value->account_avatar ) ?>" alt="" style="width:200px;">
                <?php else: ?>
                    <img alt="demo image" src="http://fpoimg.com/200x200?text=Preview">
                <?php endif ?>    
                </a>
                <div class="album-caption">
                <h4><a href="<?php echo site_url( 'index/shop_detail/'.$value->account_id ) ?>"><?php echo $value->name_shop ?></a></h4>
                <span><?php echo limit_text( $value->detail_shop , 40 ) ?></span>
                </div>
            </div>
        </div>

        <?php endforeach ?>

        

    </div>

</content>
</div>