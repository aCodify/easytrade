<article class="general-page-container col-md-12">
	
	<h1>
		คูปอง
	</h1>

	<?php echo $error = ( ! empty( $error ) ) ? $error : '' ; ?>

	<?php echo form_open_multipart('', array('class' => 'form_coupon')); ?> 


		<div class="" >
			
			<span>
				<?php if ( !empty( $show_data->image_coupon ) ): ?><br />
					<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/upload/img_cover/'.$show_data->image_coupon; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp1" /></div>
				<?php else: ?>
					<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/images/no_image.png'; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp1" /></div>
				<?php endif ?>
			</span>	

			<span id="upload_img" href="#" class="btn btn-mini upload_img1">ภาพคูปอง</span> <span class="text-input-icon"></span>

			<span id="status_expert" style="color:red;"></span>
			<span class="wait_loader" style="display:none;"> <img src="<?php echo base_url();?>public/images/icon_loading.gif" /></span>
			<div style="color:#999; margin:5px 0 5px 0;">ควรใช้รูปภาพขนาด 150 x 150 px</div>
			<input class="cover_img_name1" type="hidden" name="image_coupon" value="<?php echo $image_coupon = ( ! empty( $show_data->image_coupon ) ) ? $show_data->image_coupon : '' ; ?>">
			<span class="image_delete cursor_pointer" style="display:none" >ลบรูป</span>	
			<br>

		</div>

		<div class="control-group">
			<label class="control-label" for="name">ชื่อโปรโมชั่น: <span class="txt_require">*</span></label>
			<div class="controls">
				<input type="text" class="persen span4" name="name_coupon" value="<?php if (isset($show_data->name_coupon)) {echo $show_data->name_coupon;} ?>"  id="" /><span></span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="name">ราคาส่วนลด: <span class="txt_require">*</span></label>
			<div class="controls">
				<input type="text" class="persen" name="discount" value="<?php if (isset($show_data->discount)) {echo $show_data->discount;} ?>"  id="" /><span> %</span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="name">รายละเอียด: <span class="txt_require">*</span></label>
			<div class="controls">
				<textarea name="detail" style="width: 35em; height: 8em;"><?php if (isset($show_data->detail)) {echo $show_data->detail;} ?></textarea>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="name">ระยะเวลาเริ่ม: <span class="txt_require">*</span></label>
			<div class="controls">
				<input type="text" class="span3 persen" id="datepicker" name="start_date" value="<?php if (isset($show_data->start_date)) {echo $show_data->start_date;} ?>"  id="" /><span></span>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="name">ระยะเวลาสิ้นสุด: <span class="txt_require">*</span></label>
			<div class="controls">
				<input type="text" class="span3 persen" name="end_date" id="datepicker2" value="<?php if (isset($show_data->end_date)) {echo $show_data->end_date;} ?>"  id="" /><span></span>
			</div>
		</div>



		<div class="control-group">
			<div class="">
				<button type="submit" class="btn btn-primary"><?php echo lang('account_save'); ?></button> 
			</div>
		</div>





	<?php echo form_close(); ?>

</article>



<script>
	

jQuery(document).ready(function($) {
	
	$( "#datepicker" ).datepicker( { dateFormat: 'dd/mm/yy' } );

	$( "#datepicker2" ).datepicker( { dateFormat: 'dd/mm/yy' } );


  	$('.image_delete').click(function(event) {
  		$(this).parent().find('div img').attr( 'src' , "<?php echo $this->base_url.'public/images/no_image.png'; ?>" );
  		$(this).hide();
  	});


	$.ajaxUploadSettings.name = 'uploadfile';
	$('.upload_img1').ajaxUploadPrompt({
		url : '<?php echo base_url() ?>upload.php?info=img_cover',
		error : function () 
		{
			alert( 'upload error please try again' )
		},
		success : function (data) 
		{
			name_old = $('.cover_img_name1').val();
			
			if ( name_old != '' ) 
			{

			};
			// console.log(data);

			

			$('.upload_img1').parent().find('.image_delete').show();

			data = JSON.parse( data );
			$('.cover-img-tmp1').attr( 'src' , '<?php echo base_url( "public/upload/img_cover" ) ?>/'+data.name_filemid ); 
			$('.cover_img_name1').val( data.name_filemid );

		}
	});

});

</script>
