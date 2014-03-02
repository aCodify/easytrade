<div class="col-md-12">
<h4>
    คูปองส่วนลด : <span style="color:#E74C3C">อุปกรณ์แต่งบ้าน</span>&nbsp;&nbsp;&nbsp;
    <select class="province" name="" class="span2" style="margin: 0px; position: absolute; top: 2em; width: 11em;" >
        <option value="">ค้นหาจังหวัด</option>
        <?php foreach ( $province_list as $key => $value ): ?>
            
	        <?php 

	        if ( $this->input->get( 'province' ) )  
	        {
	            $id_province = $this->input->get( 'province' );
	        }
	        else
	        {
	            $id_province = '';  
	        }


	        ?>  

            <option <?php echo $select = ( $id_province == $value->id ) ? 'selected' : '' ; ?> value="<?php echo $value->id ?>"><?php echo $value->name_province ?></option>

        <?php endforeach ?>
    </select>
</h4>
<hr>

	<?php foreach ( $data_list as $key => $value ): ?>
		
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




</div>



<script>
	
jQuery(document).ready(function($) {
    
    $('.province').change(function(event) {
        a = $(this).val();
        window.location = "<?php echo site_url( 'index/coupon/'.$id_coupon ) ?>?province="+a+""

    });

});

</script>
