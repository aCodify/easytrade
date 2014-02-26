<article class="general-page-container col-md-12">
	
	<h1>ข้อมูลร้านค้า</h1>

	<?php echo form_open_multipart('', array('class' => 'form-horizontal')); ?> 
		<?php if (isset($form_status) && isset($form_status_message)) { ?> 
		<div class="alert alert-<?php echo $form_status; ?>"><button type="button" class="close" data-dismiss="alert">&times;</button><?php echo $form_status_message; ?></div>
		<?php } ?> 

		<div class="page-account-register">

			<div class="overset_image" >
				
				<span>
					<?php if ( !empty( $show_data->account_avatar ) ): ?><br />
						<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/upload/img_cover/'.$show_data->account_avatar; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp1" /></div>
					<?php else: ?>
						<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/images/no_image.png'; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp1" /></div>
					<?php endif ?>
				</span>	

				<span id="upload_img" href="#" class="btn btn-mini upload_img1">ภาพร้านค้า 1</span> <span class="text-input-icon"></span>

				<span id="status_expert" style="color:red;"></span>
				<span class="wait_loader" style="display:none;"> <img src="<?php echo base_url();?>public/images/icon_loading.gif" /></span>
				<div style="color:#999; margin:5px 0 5px 0;">ควรใช้รูปภาพขนาด 150 x 150 px</div>
				<input class="cover_img_name1" type="hidden" name="image_shop[]" value="<?php echo $account_avatar = ( ! empty( $show_data->account_avatar ) ) ? $show_data->account_avatar : '' ; ?>">
				<span class="image_delete cursor_pointer" style="display:none" >ลบรูป</span>	
				<br>

			</div>

			<div class="overset_image" >
				
				<span>
					<?php if ( !empty( $show_data->account_avatar ) ): ?><br />
						<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/upload/img_cover/'.$show_data->account_avatar; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp2" /></div>
					<?php else: ?>
						<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/images/no_image.png'; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp2" /></div>
					<?php endif ?>
				</span>	

				<span id="upload_img" href="#" class="btn btn-mini upload_img2">ภาพร้านค้า 2</span> <span class="text-input-icon"></span>

				<span id="status_expert" style="color:red;"></span>
				<span class="wait_loader" style="display:none;"> <img src="<?php echo base_url();?>public/images/icon_loading.gif" /></span>
				<div style="color:#999; margin:5px 0 5px 0;">ควรใช้รูปภาพขนาด 150 x 150 px</div>
				<input class="cover_img_name2" type="hidden" name="image_shop[]" value="<?php echo $account_avatar = ( ! empty( $show_data->account_avatar ) ) ? $show_data->account_avatar : '' ; ?>">
				<span class="image_delete cursor_pointer" style="display:none" >ลบรูป</span>	
				<br>

			</div>

			<div class="overset_image" >
				
				<span>
					<?php if ( !empty( $show_data->account_avatar ) ): ?><br />
						<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/upload/img_cover/'.$show_data->account_avatar; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp3" /></div>
					<?php else: ?>
						<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/images/no_image.png'; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp3" /></div>
					<?php endif ?>
				</span>	

				<span id="upload_img" href="#" class="btn btn-mini upload_img3">ภาพร้านค้า 3</span> <span class="text-input-icon"></span>

				<span id="status_expert" style="color:red;"></span>
				<span class="wait_loader" style="display:none;"> <img src="<?php echo base_url();?>public/images/icon_loading.gif" /></span>
				<div style="color:#999; margin:5px 0 5px 0;">ควรใช้รูปภาพขนาด 150 x 150 px</div>
				<input class="cover_img_name3" type="hidden" name="image_shop[]" value="<?php echo $account_avatar = ( ! empty( $show_data->account_avatar ) ) ? $show_data->account_avatar : '' ; ?>">
				<span class="image_delete cursor_pointer" style="display:none" >ลบรูป</span>	
				<br>

			</div>

			<div class="overset_image" >
				
				<span>
					<?php if ( !empty( $show_data->account_avatar ) ): ?><br />
						<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/upload/img_cover/'.$show_data->account_avatar; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp4" /></div>
					<?php else: ?>
						<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/images/no_image.png'; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp4" /></div>
					<?php endif ?>
				</span>	

				<span id="upload_img" href="#" class="btn btn-mini upload_img4">ภาพร้านค้า 4</span> <span class="text-input-icon"></span>

				<span id="status_expert" style="color:red;"></span>
				<span class="wait_loader" style="display:none;"> <img src="<?php echo base_url();?>public/images/icon_loading.gif" /></span>
				<div style="color:#999; margin:5px 0 5px 0;">ควรใช้รูปภาพขนาด 150 x 150 px</div>
				<input class="cover_img_name4" type="hidden" name="image_shop[]" value="<?php echo $account_avatar = ( ! empty( $show_data->account_avatar ) ) ? $show_data->account_avatar : '' ; ?>">
				<span class="image_delete cursor_pointer" style="display:none" >ลบรูป</span>	
				<br>

			</div>



			<div style="clear: both;" ></div>

			<hr>

			<h4>ภาพสินค้า</h4>

			<div style="padding-left: 1em;" >
				
				<span class="cover-img-tmp5" >
					
				</span>	

				<span style="display: table-cell; padding-top: 2em;" id="upload_img" href="#" class="btn btn-mini upload_img5">ภาพสินค้า</span> <span class="text-input-icon"></span>

				<span id="status_expert" style="color:red;"></span>
				<span class="wait_loader" style="display:none;"> <img src="<?php echo base_url();?>public/images/icon_loading.gif" /></span>
				<div style="color:#999; margin:5px 0 5px 0;">ควรใช้รูปภาพขนาด 150 x 150 px</div>
				<span class="image_delete cursor_pointer" style="display:none" >ลบรูป</span>	
				<br>

			</div>			

			
			<div class="control-group">
				<div class="">
					<button type="submit" class="btn btn-primary"><?php echo lang('account_save'); ?></button> 
				</div>
			</div>
		</div>
	<?php echo form_close(); ?> 


	<hr>

	<table class="table" >
		<caption><h4> <span style="float: left;padding-left: 0px;" > <a class="btn btn-primary" style="color: rgb(255, 255, 255);" href="<?php echo site_url( 'index/add_coupon' ) ?>">ADD</a> </span> Coupon Management</h4></caption>
		<thead>
			<tr>
				<th style="width: 40em;" >Coupon</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>data</td>
				<td><a href="">Edit</a> | <a href="">Delete</a></td>
			</tr>
		</tbody>
	</table>

	
</article>



<script>
	
  jQuery(document).ready(function($) {


  	$('.image_delete').click(function(event) {
  		$(this).parent().find('div img').attr( 'src' , "<?php echo $this->base_url.'public/images/no_image.png'; ?>" );
  		$(this).hide();
  	});

  
	// Set fieldname
	$.ajaxUploadSettings.name = 'uploadfile';
	// Set promptzone
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

	/* Comment */
	$('.upload_img2').ajaxUploadPrompt({
		url : '<?php echo base_url() ?>upload.php?info=img_cover',
		error : function () 
		{
			alert( 'upload error please try again' )
		},
		success : function (data) 
		{
			name_old = $('.cover_img_name2').val();
			
			if ( name_old != '' ) 
			{

			};
			// console.log(data);
			$('.upload_img2').parent().find('.image_delete').show();

			data = JSON.parse( data );
			$('.cover-img-tmp2').attr( 'src' , '<?php echo base_url( "public/upload/img_cover" ) ?>/'+data.name_filemid ); 
			$('.cover_img_name2').val( data.name_filemid );

		}
	});

	/* Comment */
	$('.upload_img3').ajaxUploadPrompt({
		url : '<?php echo base_url() ?>upload.php?info=img_cover',
		error : function () 
		{
			alert( 'upload error please try again' )
		},
		success : function (data) 
		{
			name_old = $('.cover_img_name3').val();
			
			if ( name_old != '' ) 
			{

			};
			// console.log(data);
			$('.upload_img3').parent().find('.image_delete').show();

			data = JSON.parse( data );
			$('.cover-img-tmp3').attr( 'src' , '<?php echo base_url( "public/upload/img_cover" ) ?>/'+data.name_filemid ); 
			$('.cover_img_name3').val( data.name_filemid );

		}
	});

	/* Comment */
	$('.upload_img4').ajaxUploadPrompt({
		url : '<?php echo base_url() ?>upload.php?info=img_cover',
		error : function () 
		{
			alert( 'upload error please try again' )
		},
		success : function (data) 
		{
			name_old = $('.cover_img_name4').val();
			
			if ( name_old != '' ) 
			{

			};
			// console.log(data);
			$('.upload_img4').parent().find('.image_delete').show();

			data = JSON.parse( data );
			$('.cover-img-tmp4').attr( 'src' , '<?php echo base_url( "public/upload/img_cover" ) ?>/'+data.name_filemid ); 
			$('.cover_img_name4').val( data.name_filemid );

		}
	});




	/* Comment */
	$('.upload_img5').ajaxUploadPrompt({
		url : '<?php echo base_url() ?>upload.php?info=img_cover',
		error : function () 
		{
			alert( 'upload error please try again' )
		},
		success : function (data) 
		{
			name_old = $('.cover_img_name5').val();
			
			if ( name_old != '' ) 
			{

			};
			// console.log(data);
			

			data = JSON.parse( data );


			// $('.cover-img-tmp5').attr( 'src' , '<?php echo base_url( "public/upload/img_cover" ) ?>/'+data.name_filemid ); 
			

			$('.cover-img-tmp5').append('<img style="width: 7em; margin: 10px;" src="<?php echo base_url( "public/upload/img_cover" ) ?>/'+data.name_filemid+' " alt=""><input type="hidden" name="image_product[]" class="name_img" value="'+data.name_filemid+'" > '); 

		}
	});	
	
    
  });



</script>