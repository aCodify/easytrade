<article class="general-page-container col-md-12">
	
	<h1><?php echo lang('account_edit_profile'); ?></h1>

	<?php echo form_open_multipart('', array('class' => 'form-horizontal')); ?> 
		<?php if (isset($form_status) && isset($form_status_message)) { ?> 
		<div class="alert alert-<?php echo $form_status; ?>"><button type="button" class="close" data-dismiss="alert">&times;</button><?php echo $form_status_message; ?></div>
		<?php } ?> 

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
		

			<?php echo $this->modules_plug->do_filter('account_edit_profile_form_bottom'); ?> 
			
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary"><?php echo lang('account_save'); ?></button> <?php //echo anchor('account/view-logins', lang('account_view_logins')); ?>
				</div>
			</div>
		</div>
	<?php echo form_close(); ?> 
	
</article>

<script type="text/javascript">
$(document).ready(function() {
	$("input[name=account_birthdate]").datepicker({ 
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
		changeYear: true,
		yearRange: '1900:'+(new Date).getFullYear()
	});
});// jquery document ready

function ajax_delete_avatar() {
	$confirm = confirm('<?php echo lang('account_are_you_sure_delete_avatar'); ?>');
	
	if ($confirm == true) {
		$('.remove-status-container').html('<img src="<?php echo $this->theme_path; ?>site-admin/images/loading.gif" alt="" />');
		
		$.ajax({
			url: site_url+'account/edit-profile/delete-avatar',
			type: 'POST',
			data: csrf_name+'='+csrf_value+'&account_id=<?php echo $account_id; ?>',
			dataType: 'json',
			success: function(data) {
				if (data.result == true) {
					$('.account-avatar-wrap').remove();
				}
				$('.remove-status-container').html('');
			},
			error: function(data, status, e) {
				alert(e);
				$('.remove-status-container').html('');
			}
		});
		return false;
	} else {
		return false;
	}
}
</script>




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