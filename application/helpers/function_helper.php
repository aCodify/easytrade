<?php  

/**
 * Reponse data 
 *
 * @param mixed 
 * @return 
 **/
function json_response($data)
{
	// header('Content-type: application/json; charset=UTF-8');
	echo json_encode($data);
	exit;
}


function is_array_empty_validate($InputVariable)
{
	$info = array();
	if (is_array($InputVariable) && count($InputVariable) > 0)
	{

		foreach ( $InputVariable as $key => $value ) 
		{
			if ( empty( $value ) ) 
			{
				$info[] = $key;
			}
		}

	}

   return $info;


}

function check_keyword( $string = '' )
{
	$CI_SET =& get_instance();

	$CI_SET->db->where( 'status', 1 );
	$query = $CI_SET->db->get( 'webboard_block_keyword' );
	$data = $query->row();

	if ( empty( $data->tags_keyword ) ) 
	{
		return $string;
	}

	$array_key = explode( ",", $data->tags_keyword );

	$string = str_ireplace( $array_key, "***", $string );

	return $string;  

}


/**
*
*** START SET URL
*
**/

function http_check( $url = '' ) 
{
	if ( strpos( $url , 'http://' ) !== false ) 
	{
		return $url; 
	}
	else
	{
		return '//'.$url ;
	}
}

/** END SET URL **/



/**
*
* Block comment
*
**/
function set_time_to_strtotime( $time , $tag = '/' )
{
	if ( empty( $time ) ) 
	{
		echo "this time is empty";
		die();
	}

	$array_time = explode( $tag , $time );
	return $array_time[2].'-'.$array_time[1].'-'.$array_time[0];

}
	


//------------------------------------------------------------------------
/**
 * truncate text to a specific length
 *
 * @param String $string
 * @param Integer $limit
 * @param String $suffix
 * @return String truncated string
 */
function limit_text($string, $limit, $suffix = '&hellip;')
{
	if (mb_strlen($string, 'UTF-8') > $limit)
	{
		$string = mb_substr($string, 0, $limit, 'UTF-8') . $suffix;
	}
	
	return $string;
}

/**
*
* Block comment
*
**/
function getDateFull($myDate, $Lang='th'){
	if($Lang=='th'){

		$myDateArray=explode("-",$myDate);
		if ($myDateArray[1] == 00) {
			return false;
		}
		$myDay = sprintf("%d",$myDateArray[2]);
		switch($myDateArray[1]) 
		{
			case "01" : $myMonth = "มกราคม";  break;
			case "02" : $myMonth = "กุมภาพันธ์";  break;
			case "03" : $myMonth = "มีนาคม"; break;
			case "04" : $myMonth = "เมษายน"; break;
			case "05" : $myMonth = "พฤษภาคม";   break;
			case "06" : $myMonth = "มิถุนายน";  break;
			case "07" : $myMonth = "กรกฎาคม";   break;
			case "08" : $myMonth = "สิงหาคม";  break;
			case "09" : $myMonth = "กันยายน";  break;
			case "10" : $myMonth = "ตุลาคม";  break;
			case "11" : $myMonth = "พฤศจิกายน";   break;
			case "12" : $myMonth = "ธันวาคม";  break;
		}
		$myYear = sprintf("%d",$myDateArray[0])+543;
        return($myDay . " " . $myMonth . " " . $myYear);	
	}
}

/**
*
* Block comment
*
**/
function show_date($date_create){
	
	$date_m = explode(' ',$date_create);
	$ex_date = explode('-',$date_m[0]);

	if($ex_date[1] == '01'){
		$month = 'Jan';
	}else if($ex_date[1] == '02'){
		$month = 'Feb';
	}else if($ex_date[1] == '03'){
		$month = 'Mar';
	}else if($ex_date[1] == '04'){
		$month = 'Apr';
	}else if($ex_date[1] == '05'){
		$month = 'May';
	}else if($ex_date[1] == '06'){
		$month = 'Jun';
	}else if($ex_date[1] == '07'){
		$month = 'Jul';
	}else if($ex_date[1] == '08'){
		$month = 'Aug';
	}else if($ex_date[1] == '09'){
		$month = 'Sep';
	}else if($ex_date[1] == '10'){
		$month = 'Oct';
	}else if($ex_date[1] == '11'){
		$month = 'Nov';
	}else if($ex_date[1] == '12'){
		$month = 'Dec';
	}
	 
	echo $month.' '.$ex_date[2];
}

/**
*
* Block comment
*
**/
function preview_error( $info = array() ) 
{

	$html = '';

	if ( ! empty( $info ) ) 
	{
	   	$html .= '<div class="alert alert-error">';
	   	$html .=     '<button class="close" data-dismiss="alert"></button>';

	   	foreach ( $info as $key => $value ) 
	   	{
		   	$html .=     '<strong>Error! </strong>';
		   	$html .=     $value;
		   	if ( end($info) != $value ) 
		   	{
		   		$html .= '<br>';
		   	}

	   	}

	   	$html .= '</div>';
	}

	return $html;
}

/**
*
* Block comment
*
**/
function preview_success() 
{
	$html = '';	
	$html .= '<div class="alert alert-success">';
	$html .= '<button class="close" data-dismiss="alert"></button>';
	$html .= '<strong>Success! </strong>';
	$html .= 'The page has been save success.';
	$html .= '</div>';

	return $html;

}

/**
*
*** START DELETE SUCCESS
*
**/

function delete_success()
{
	$html = '';	
	$html .= '<div class="alert alert-success">';
	$html .= '<button class="close" data-dismiss="alert"></button>';
	$html .= '<strong>Success! </strong>';
	$html .= 'Delete content and save success.';
	$html .= '</div>';

	return $html;
}

/** END DELETE SUCCESS **/


/**
*
* Block comment
*
**/
function reset_format_date( $date = '' , $info_old = '/' , $info_new = '-' , $format_old = 'd-m-y' , $format_new = 'y-m-d' ) 
{
	$array_date = explode( $info_old , $date );

	$format_old = explode( '-' , $format_old );

	$format_new = explode( '-' , $format_new );

	foreach ( $array_date as $key => $value ) 
	{
		$set[ $format_old[$key] ] = $value ;
	}

	foreach ( $format_new as $key => $value ) 
	{
		$new[] = $set[ $value ];
	}	

	return implode( $info_new , $new );
		
}




/**
*
* Block comment
*
**/
function repair_string( $info = '' , $number = 0 ) 
{
	
	$array_info = explode("-", $info);

	$number++;

	if ( ! empty( $number ) )
	{
		$number = '-'.$number;
	}
	else
	{
		$number = '';
	}

	$string = $array_info[0].$number;

	return $string;
}

/**
*
* Block comment
*
**/
function make_url($string, $length = 0, $separator = '-')
{
	$string = make_plain($string);
	$string = preg_replace('~[^a-z0-9ก-๙\s\-]~iu', '', $string);
	
	if (is_numeric($length) AND $length > 0 AND mb_strlen($string, 'UTF-8') > $length)
	{
		$string = mb_substr($string, 0, $length);
	}
		
	$string = trim($string);
	$string = preg_replace('~\s+~', $separator, $string);
	$string = strtolower($string);
	
	return $string;
}

/**
*
* Block comment
*
**/
function make_plain($string)
{
	$string = strip_tags($string);
	$string = html_entity_decode($string, ENT_QUOTES, 'UTF-8');
	// clean whitespace
	$string = preg_replace('~\s+~', ' ', $string);
	// clean whitespace again for heading and trailing whitespace
	$string = trim($string, ' '.chr(194).chr(160));
	$string = htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
	
	return $string;
}

/**
*
* Block comment
*
**/
function remove_underscore( $string )
{
	$string = str_replace("_", " ", $string );		
	return $string;
}


/**
*
* functon alphanumeric_rand has return random char A-z and 0-9
*
**/
function alphanumeric_rand($num_require=8) {
	$randomstring = '';

	$arr1 = range( 'A' , 'Z');
	$arr2 = range( 'a' , 'z');
	$arr3 = range( '0' , '9');
    $alphanumeric =	array_merge( $arr1 , $arr2 , $arr3 );

	if($num_require > sizeof($alphanumeric)){
		echo "Error alphanumeric_rand(\$num_require) : \$num_require must less than " . sizeof($alphanumeric) . ", $num_require given";
		return;
	}

	// set string
	$randomstring = '';
	for ( $i=0; $i < $num_require; $i++ ) 
	{ 
		$index_arr = array_rand( $alphanumeric );
		$randomstring .= $alphanumeric[$index_arr];
	}

	return $randomstring;
}


function set_time_format( $info = '' ) 
{
	$array_date = explode("/", $info);
	return $array_date[2].'-'.$array_date[1].'-'.$array_date[0];
}

function call_image_site( $path = '' , $width = 0 , $height = 0 , $no_image = '' , $show = 'admin' , $account = false ) 
{
 	$tmp_path = $path;

 
	// CHECK PATH HAS EMPTY
	if ( empty( $path ) ) 
	{
		return false;
	}

	// CHECK '/' IN FIRST PATH
	if ( $path[0] == '/' ) 
	{
		$path = substr( $path , 1 );
	}


	if ( ! is_file( $path ) ) 
	{
		$path = $no_image;
	}


	// START SET INCLUDE PHPTHUMB
	include_once APPPATH.'libraries/phpthumb/ThumbLib.inc.php';

	//  GET PATH ARRAY
	$path_parts = pathinfo( $path );
	// --- EXP
	// --- echo $path_parts['dirname'], "<br>";
	// --- echo $path_parts['basename'], "<br>";
	// --- echo $path_parts['filename'], "<br>";
	// --- echo $path_parts['extension'], "<br>";

	// CHECK NAME FILE IS NOT EMPTY
	if ( empty( $path_parts['basename'] ) AND empty( $path_parts['filename'] ) ) 
	{
		return false;
	}

	// // CHECK AND CREATE FOLDER
	makeAll( 'cache/'.$path_parts['dirname'] );
	
	// SET NEW NAME FILE
	$new_name = 'cache/'.$path_parts['dirname'].'/'.$path_parts['filename'].$width.'x'.$height.'.'.$path_parts['extension'];


	// CHECK FILE HAS NOT EMPTY
	if ( is_file( $new_name ) ) 
	{
		return  $new_name;
	}

	$over_set = $new_name;


	// RENDER FILE RESIZE
	$thumb = PhpThumbFactory::create( $path );  

	if ( $account != false ) 
	{
		$thumb->cropFromCenter( $width )->save( $new_name );
	} 
	else 
	{
		$thumb->resize( $width ,  $height )->save( $new_name );
	}
	

	// // SAVE FILE IN FOLDER UPLOAD 
	// if ( $show != 'admin' ) 
	// {
	// 	// RENDER FILE RESIZE

	// 	// $path_parts['dirname'] = str_replace( "cache/uploads/", "", $path_parts['dirname'] ); 

	// 	makeAll( $path_parts['dirname'] );
	// 	$new_name = $path_parts['dirname'].'/'.$path_parts['filename'].$width.'x'.$height.'.'.$path_parts['extension'];
	// 	$thumb = PhpThumbFactory::create( $tmp_path ); 


	// 	$thumb->resize( $width ,  $height )->save( $new_name );



	// 	$over_set = $new_name;
	// }  

	return $new_name;
}





?>