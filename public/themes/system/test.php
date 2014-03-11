<?php 


if ( $this->input->post() ) 
{
	echo '<pre>';
	print_r( $this->input->post() );
	echo '</pre>';

	die();
}






// foreach ( $data as $key => $value ) 
// {
// 	echo $key->account_id;
// 	echo "<br />";
// }

?>


<?php echo form_open(); ?>

<input type="text" name="name1" >
<input type="text" name="name2" >
<input type="text" name="name3" >
<input type="text" name="name4" >
<button type="">ok</button>

<?php echo form_close(); ?>