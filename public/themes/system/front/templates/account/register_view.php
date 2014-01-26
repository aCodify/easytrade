<article class="general-page-container col-md-12 ">
	
	<h1><?php echo lang('account_register'); ?></h1>

	<?php echo form_open('', array('class' => 'form-horizontal')); ?> 
		<div class="form-status-placeholder">
			<?php if (isset($form_status) && isset($form_status_message)) { ?> 
			<div class="alert alert-<?php echo $form_status; ?>"><button type="button" class="close" data-dismiss="alert">&times;</button><?php echo $form_status_message; ?></div>
			<?php } ?> 
		</div>

		<?php if (!isset($hide_register_form) || (isset($hide_register_form) && $hide_register_form == false)): ?> 
		<div class="page-account-register">

			<div style="padding-left: 10em;" >
				
				<span>
					<?php if ( !empty( $show_data->account_avatar ) ): ?><br />
						<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/upload/img_cover/'.$show_data->account_avatar; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp" /></div>
					<?php else: ?>
						<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/images/no_image.png'; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp" /></div>
					<?php endif ?>
				</span>	

				<span id="upload_img" href="#" class="btn btn-mini">เลือกรูปภาพ</span> <span class="text-input-icon"></span>

				<span id="status_expert" style="color:red;"></span>
				<span class="wait_loader" style="display:none;"> <img src="<?php echo base_url();?>public/images/icon_loading.gif" /></span>
				<div style="color:#999; margin:5px 0 5px 0;">ควรใช้รูปภาพขนาด 150 x 150 px</div>
				<input class="cover_img_name" type="hidden" name="account_avatar" value="<?php echo $account_avatar = ( ! empty( $show_data->account_avatar ) ) ? $show_data->account_avatar : '' ; ?>">
				<br>

			</div>


			<div class="control-group">
				<label class="control-label" for="name"><?php echo lang('ชื่อ'); ?>: <span class="txt_require">*</span></label>
				<div class="controls">
					<input type="text" name="name" value="<?php if (isset($show_data->name)) {echo $show_data->name;} ?>"  id="" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="last_name"><?php echo lang('นามสกุล'); ?>: <span class="txt_require">*</span></label>
				<div class="controls">
					<input type="text" name="last_name" value="<?php if (isset($show_data->last_name)) {echo $show_data->last_name;} ?>"  id="" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="address"><?php echo lang('ที่อยู่ร้าน'); ?>:</label>
				<div class="controls">
					<input type="text" name="address" value="<?php if (isset($show_data->address)) {echo $show_data->address;} ?>"  id="" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="province"><?php echo lang('จังหวัด'); ?>: </label>
				<div class="controls">
					<select name="province">
						<?php foreach ( $province as $key => $value ): ?>
							
							<?php  
							$select = '';	
							if ( ! empty( $show_data->province ) ) 
							{
								if ( $show_data->province == $value->id ) 
								{
									$select = 'selected';
								} 
								else 
								{
									$select = '';
								}
								
							}


							?>

							<option <?php echo $select ?> value="<?php echo $value->id ?>"><?php echo $value->name_province ?></option>
						<?php endforeach ?>

					</select>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="postcode"><?php echo lang('รหัสไปรษณีย์'); ?>:</label>
				<div class="controls">
					<input type="text" name="postcode" value="<?php if (isset($show_data->postcode)) {echo $show_data->postcode;} ?>"  id="account_username" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="phone"><?php echo lang('เบอร์โทร'); ?>:</label>
				<div class="controls">
					<input type="text" name="phone" value="<?php if (isset($show_data->phone)) {echo $show_data->phone;} ?>"  id="account_username" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="name_shop"><?php echo lang('ชื่อร้านค้า'); ?>: <span class="txt_require">*</span></label>
				<div class="controls">
					<input type="text" name="name_shop" value="<?php if (isset($show_data->name_shop)) {echo $show_data->name_shop;} ?>"  id="account_username" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="detail_shop"><?php echo lang('ข้อมูลร้านค้า'); ?>: </label>
				<div class="controls">
					<input type="text" name="detail_shop" value="<?php if (isset($show_data->detail_shop)) {echo $show_data->detail_shop;} ?>"  id="account_username" />
				</div>
			</div>


			<div class="control-group">
				<label class="control-label" for="province"><?php echo lang('ชนิดร้านค้า'); ?>: </label>
				<div class="controls">
					<select name="type">
						<?php foreach ( $type_shop as $key => $value ): ?>
							
							<?php  
							$select = '';	
							if ( ! empty( $show_data->type ) ) 
							{
								if ( $show_data->type == $value->id ) 
								{
									$select = 'selected';
								} 
								else 
								{
									$select = '';
								}
								
							}
							?>

							<option <?php echo $select ?> value="<?php echo $value->id ?>"><?php echo $value->name_shop ?></option>
						<?php endforeach ?>

					</select>
				</div>
			</div>


			

			<div class="control-group">
				<label class="control-label" for="detail_shop"><?php echo lang('Google Map'); ?>: </label>
				<div class="controls">
					<textarea style="height:auto" rows="4" name="code_map"><?php if (isset($show_data->code_map)) {echo $show_data->code_map;} ?></textarea>
				</div>
			</div>



			<hr>
			
			<div class="control-group">
				<label class="control-label" for="account_username"><?php echo lang('account_username'); ?>: <span class="txt_require">*</span></label>
				<div class="controls">
					<input type="text" name="account_username" value="<?php if (isset($show_data->account_username)) {echo $show_data->account_username;} ?>"  id="account_username" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="account_email"><?php echo lang('account_email'); ?>: <span class="txt_require">*</span></label>
				<div class="controls">
				<input type="email" name="account_email" value="<?php if (isset($show_data->account_email)) {echo $show_data->account_email;} ?>"  id="account_email" />
				</div>	
			</div>
			
			<div class="control-group">
				<label class="control-label" for="account_password"><?php echo lang('account_password'); ?>: <span class="txt_require">*</span></label>
				<div class="controls">
					<input type="password" name="account_password" value=""  id="account_password" />
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="account_confirm_password"><?php echo lang('account_confirm_password'); ?>: <span class="txt_require">*</span></label>
				<div class="controls">
					<input type="password" name="account_confirm_password" value=""  id="account_confirm_password" />
				</div>
			</div>
			
			<div class="control-group">
				<?php if ($plugin_captcha != null) {
					echo $plugin_captcha;
				} else { ?> 
				<label class="control-label captcha-field" for="captcha">
					<?php echo lang('account_captcha'); ?>:
				</label>
				<div class="controls">
					<img src="<?php echo $this->base_url; ?>public/images/securimage_show.php" alt="securimage" class="captcha" />
					<a href="#" onclick="$('.captcha').attr('src', '<?php echo $this->base_url; ?>public/images/securimage_show.php?' + Math.random()); return false" tabindex="-1"><img src="<?php echo $this->base_url; ?>public/images/reload.gif" alt="" /></a>
					<div>
						<input style="margin-top: 1em;" type="text" name="captcha" value="<?php if (isset($captcha)) {echo $captcha;} ?>" class="input-captcha" autocomplete="off" id="captcha" />
					</div>
				</div>
				<?php } ?> 
			</div>

			<?php echo $this->modules_plug->do_filter('account_register_form_bottom'); ?> 
			
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary"><?php echo lang('account_register'); ?></button> 
					<?php // if ($this->config_model->loadSingle('member_verification') == '1') {echo anchor('account/resend-activate', lang('account_not_get_verify_email'));} ?>
				</div>
			</div>
			
		</div>
		<?php endif; ?> 
	<?php echo form_close(); ?> 
	
</article>



<script>
	
  jQuery(document).ready(function($) {
  
	// Set fieldname
	$.ajaxUploadSettings.name = 'uploadfile';
	// Set promptzone
	$('#upload_img').ajaxUploadPrompt({
		url : '<?php echo base_url() ?>upload.php?info=img_cover',
		error : function () 
		{
			alert( 'upload error please try again' )
		},
		success : function (data) 
		{
			name_old = $('.cover_img_name').val();
			
			if ( name_old != '' ) 
			{

			};
			console.log(data);
			data = JSON.parse( data );
			$('.cover-img-tmp').attr( 'src' , '<?php echo base_url( "public/upload/img_cover" ) ?>/'+data.name_filemid ); 
			$('.cover_img_name').val( data.name_filemid );

		}
	});
    
  });



</script>
