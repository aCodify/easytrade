<h2>Bannner</h2>
<div style="padding: 5em 3em;" >
	
	<?php echo form_open(); ?>

	<span class="show_image_view" >

			<?php foreach ( $list_image as $key => $value ): ?>
				
				<img style="width: 7em; margin: 10px;" src="<?php echo base_url('public/upload/img_cover/'.$value->image) ?>" alt=""><input type="hidden" name="image[]" class="name_img" value="<?php echo $value->image ?>" >
			
			<?php endforeach ?>

		
	</span>	

	<span id="upload_img" href="#" class="btn btn-mini">เลือกรูปภาพ</span> <span class="text-input-icon"></span>

	<span id="status_expert" style="color:red;"></span>
	<span class="wait_loader" style="display:none;"> <img src="<?php echo base_url();?>public/images/icon_loading.gif" /></span>
	<div style="color:#999; margin:5px 0 5px 0;">ควรใช้รูปภาพขนาด 150 x 150 px</div>
	<input class="cover_img_name" type="hidden" name="account_avatar" value="<?php echo $account_avatar = ( ! empty( $show_data->account_avatar ) ) ? $show_data->account_avatar : '' ; ?>">
	<br>


	<button type="">Save</button>

	<?php echo form_close(); ?>

</div>



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
			// console.log(data);
			// data = JSON.parse( data );
			// $('.cover-img-tmp').attr( 'src' , '<?php echo base_url( "public/upload/img_cover" ) ?>/'+data.name_filemid ); 
			// $('.cover_img_name').val( data.name_filemid );

			data = JSON.parse( data );
			

			$('.show_image_view').append('<img style="width: 7em; margin: 10px;" src="http://easytrade.dev/public/upload/img_cover/'+data.name_filemid+' " alt=""><input type="hidden" name="image[]" class="name_img" value="'+data.name_filemid+'" > '); 



		}
	});




	/* Comment */
	// $('.upload_img5').ajaxUploadPrompt({
	// 	url : 'http://easytrade.dev/upload.php?info=img_cover',
	// 	error : function () 
	// 	{
	// 		alert( 'upload error please try again' )
	// 	},
	// 	success : function (data) 
	// 	{
	// 		name_old = $('.cover_img_name5').val();
			
	// 		if ( name_old != '' ) 
	// 		{

	// 		};
	// 		// console.log(data);
			

	// 		data = JSON.parse( data );
			

	// 		$('.cover-img-tmp5').append('<img style="width: 7em; margin: 10px;" src="http://easytrade.dev/public/upload/img_cover/'+data.name_filemid+' " alt=""><input type="hidden" name="image_product[]" class="name_img" value="'+data.name_filemid+'" > '); 

	// 	}
	// });	
	

    
  });



</script>