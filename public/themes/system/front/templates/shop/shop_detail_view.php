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

        <?php for ( $i=1; $i <= 8; $i++ ) { ?>    

            <div class="col-md-3 box-page-shop" >
                <div class="album-wrap">
                    <a href=""><img alt="demo image" src="http://placehold.it/200x200"></a>
                </div>
            </div>

        <?php } ?>

    </div>
    
    <h4>คูปองส่วนลด</h4>
    
    <div class="events-list events-page">

        <section class="event">
            <div class="date">
              <!--   <strong>11</strong>
                <span class="month">Oct</span>
                <span class="details"></span> -->
            </div>
            <div class="details" style="min-height: 9em;">
                <h1><a href="#">ส่วนลดส่งท้ายปี 15%</a></h1>
                <span>เมื่อซื้อสินค้า ตั้งแต่ 5,000 บาท ขึ้นไป รับส่วนลดทันที 15 %</span>
                <div class="buttons">
                    เริ่ม 10/01/2557 &nbsp;&nbsp;&nbsp; สิ้นสุด 31/01/2557
                </div>


            </div>
        </section>

    </div>

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