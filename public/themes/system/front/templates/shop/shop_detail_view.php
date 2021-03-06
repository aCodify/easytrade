<div class="col-md-12">
<?php
$this->db->where( 'id', $show_data->type );
$query = $this->db->get( 'type_shop' );
$data_type = $query->row();
?>

<h4>ร้านค้า : <?php echo $data_type->name_shop ?> / <span style="color:#E74C3C"><?php echo $show_data->name_shop ?></span></h4>
<hr>

<content>

    <div class="row content-row">
                        
        <h4>&nbsp;&nbsp;&nbsp;&nbsp;บรรยากาศภายในร้าน</h4>

        <?php foreach ( $image_shop as $key => $value ): ?>
            
            <div class="col-md-3 box-page-shop" >
                <div class="album-wrap">

                    <?php if ( ! empty( $value->image ) ): ?>
                        <a class="fancybox" href="<?php echo $this->base_url.'public/upload/img_cover/'.$value->image; ?>"><img alt="demo image" style="max-height: 10em;" src="<?php echo $this->base_url.'public/upload/img_cover/'.$value->image; ?>"></a>
                    <?php else: ?>
                        <!-- <a href=""><img alt="demo image" src="http://placehold.it/200x200"></a> -->
                    <?php endif ?>
                </div>
            </div>

        <?php endforeach ?>

    </div>

    <div class="row content-row"> 

        <h4>&nbsp;&nbsp;&nbsp;&nbsp;สินค้าแนะนำ</h4>

        <?php foreach ( $image_product as $key => $value ): ?>
            
            <div class="col-md-3 box-page-shop" >
                <div class="album-wrap">

                    <?php if ( ! empty( $value->image_product ) ): ?>
                        <a class="fancybox" href="<?php echo $this->base_url.'public/upload/img_cover/'.$value->image_product; ?>"><img alt="demo image" style="max-height: 10em;" src="<?php echo $this->base_url.'public/upload/img_cover/'.$value->image_product; ?>"></a>
                    <?php else: ?>
                        <!-- <a href=""><img alt="demo image" src="http://placehold.it/200x200"></a> -->
                    <?php endif ?>
                </div>
            </div>

        <?php endforeach ?>

    </div>




    <h4 onclick="printthis()" >คูปองส่วนลด ( Print Coupon Click )</h4>
    
    <?php foreach ( $coupon_list as $key => $value ): ?>
        
    <a href="<?php echo site_url('index/shop_detail/'.$value->account_id) ?>">
    <div id="coupon-body"> 
        <div class="left-color">
        </div>
        <div style="float: left; padding: 10px;" >
            <img src="<?php echo $this->base_url.'public/upload/img_cover/'.$value->image_coupon; ?>" style="width: 180px; height: 180px;" alt="">
        </div>
        <div class="coupon-head">   
            <h4><?php echo $value->name_shop ?></h4>
            <span><?php echo $value->detail ?></span>
            <hr>
        </div>
        <div class="coupon-percent">
                <h4>ส่วนลด</h4>
                <h1 style="font-size: 4em;" ><?php echo $value->discount ?>%</h1>
        </div>
        <div class="coupon-text">
            <span><?php echo $value->name_coupon ?></span>
        </div>
        <div class="coupon-date">
            เริ่ม <?php echo date( 'd/m/Y' , $value->start_date ) ?> &nbsp;&nbsp;&nbsp; สิ้นสุด <?php echo date( 'd/m/Y' , $value->end_date ) ?>
        </div>
    </div>
    </a>

    <?php endforeach ?>

    <hr>

    <h4 style="margin-bottom: 20px;">สถานที่ตั้ง</h4>   

    <div class="add-text">
        <div style="float: left; padding-right: 30px;" >
            <!-- <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d15502.726811604723!2d100.52897651672507!3d13.737710587382729!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sth!2sth!4v1389437512032" width="500" height="400" frameborder="0" style="border:0"></iframe> -->
            <?php if ( ! empty( $show_data->code_map ) ): ?>
                <?php echo $show_data->code_map; ?>                 
             <?php else: ?>
                 <img src="http://fpoimg.com/500x400?text=Google Map" alt="">
             <?php endif ?> 
        </div> 

        <h5>ที่ตั้ง</h5>

        <p><?php echo $show_data->address ?></p>

        <hr>

        <h5>ชื่อผู้ติดต่อ</h5>

        <p>คุณ <?php echo $show_data->name . ' ' . $show_data->last_name ?></p>

        <hr>

        <h5>เบอร์โทร</h5>

        <p><?php echo $show_data->phone ?></p>

        <hr>

        <h5>E-mail</h5>
        <p><?php echo $show_data->account_email ?></p>

    </div>

</content>
</div>


<script>
    

function printthis()
{

     var w = window.open('<?php echo site_url( "index/page_print/".$shop_id ) ?>', '', 'width=800,height=600,resizeable,scrollbars');
     // w.document.write($("#printthis").html());

if ( w ) {
    w.onload = function() {
        // Do stuff
         w.document.close(); // needed for chrome and safari
         javascript:w.print();
         w.close();
    };
}

     return false;

}



jQuery(document).ready(function($) {
    

    $(".fancybox").fancybox({
        fitToView   : false,
        autoSize    : false,
        closeClick  : false,
        openEffect  : 'fade',
        closeEffect : 'fade',
        helpers : {
            overlay: {
                css : {
                    'background' : 'rgba(0, 0, 0, 0.8)'
                }
            }
        }
    });

});


</script>
