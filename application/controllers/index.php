<?php if (! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 
 * PHP version 5
 * 
 * @package agni cms
 * @author vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 */

class index extends MY_Controller 
{
	
	
	public function __construct() 
	{
		parent::__construct();
		
		// load model
		$this->load->model(array('posts_model'));
		
		// set post_type
		$this->posts_model->post_type = 'article';
		
		// load helper
		$this->load->helper(array('date', 'language'));
		
		// load language
		$this->lang->load('post');
	}// __construct
	
	
	// public function _remap($att1 = '', $att2 = '') 
	// {
	// 	// if there is uri like this http://domain/installed_dir/index, http://domain/installed_dir/index/index
	// 	// redirect to base url to prevent duplicate content. good for seo.
	// 	if ($this->uri->segment(1) != null) {
	// 		redirect(base_url());
	// 	}
		
	// 	$this->index();
	// }// _remap
	
	
	public function index() 
	{
		// if there is custom home module plug.
		if ($this->modules_plug->has_action('front_home_controller')) {
			return $this->modules_plug->do_action('front_home_controller');
		}
		
		// get frontpage category from config
		$fp_category = $this->config_model->loadSingle('content_frontpage_category', $this->lang->get_current_lang());
		
		if ($fp_category != null) {
			// load category for title, metas
			$this->db->where('tid', $fp_category);
			$query = $this->db->get('taxonomy_term_data');
			if ($query->num_rows() <= 0) {
				// not found category
				unset($_GET['tid']);
			} else {
				$row = $query->row();
				if ($row->theme_system_name != null) {
					// set theme
					$this->theme_path = base_url().config_item('agni_theme_path').$row->theme_system_name.'/';// for use in css
					$this->theme_system_name = $row->theme_system_name;// for template file.
				}
			}
			$query->free_result();
			unset($query);			
		}
		
		// list posts---------------------------------------------------------------
		if ($fp_category != null && is_numeric($fp_category)) {
			$_GET['tid'] = $fp_category;
		}
		$output['list_item'] = $this->posts_model->listPost('front');
		if (is_array($output['list_item'])) {
			$output['pagination'] = $this->pagination->create_links();
		}
		// end list posts---------------------------------------------------------------
		
		// head tags output ##############################
		if (isset($row) && $row->meta_title != null) {
			$output['page_title'] = $row->meta_title;
		} else {
			$output['page_title'] = $this->html_model->gen_title();
		}
		// meta tags
		$meta = '';
		if (isset($row) && $row->meta_description != null) {
			$meta[] = '<meta name="description" content="'.$row->meta_description.'" />';
		}
		if (isset($row) && $row->meta_keywords != null) {
			$meta[] = '<meta name="keywords" content="'.$row->meta_keywords.'" />';
		}
		$output['page_meta'] = $this->html_model->gen_tags($meta);
		unset($meta);
		// link tags
		// script tags
		// end head tags output ##############################
		
		$output['hover_menu'] = 'HOME';



		$this->db->where( 'account_id !=', 1 );
		$this->db->where( 'account_status', 1 );
		$this->db->order_by('account_id', 'RANDOM');
		$this->db->limit(6);
		$query = $this->db->get( 'accounts' );
		$output['show_account'] = $query->result();


		$this->db->where( 'account_id !=', 1 );
		$this->db->where( 'account_status', 1 );
		$this->db->order_by('count_view', 'DESC');
		$this->db->limit(3);
		$query = $this->db->get( 'accounts' );
		$output['most_popular'] = $query->result();

		$this->db->where( 'account_id !=', 1 );
		$this->db->where( 'account_status', 1 );
		$this->db->order_by('account_id', 'DESC');
		$this->db->limit(3);
		$query = $this->db->get( 'accounts' );
		$output['latest_shop'] = $query->result();


		$this->db->order_by('id', 'RANDOM');
		$query = $this->db->get( 'banner' );
		$data = $query->row();

		$output['image_banner'] = $data;



		// output
		$this->generate_page('front/templates/index/index_view', $output);
	}// index
	


	public function register()
	{
		$output = '';
		$output['success'] = '';
		$output['hover_menu'] = '';
		$this->load->helper( 'form' );

		if ( $this->input->post() ) 
		{
			$data = $this->input->post();

			$this->db->insert( 'data_account' , $data );

			$output['success'] = 'ได้ทำการบันทึกข้อมูลแล้ว';

		}

		$this->generate_page('front/templates/index/register_view', $output);
	
	} // END FUNCTION register


	public function shop( $id = '' )
	{

		if ( empty( $id ) ) 
		{
			redirect( site_url() );
		}

		$output = '';
		$output['hover_menu'] = 'SHOP';

		$this->db->where( 'account_id !=', 1 );
		$this->db->where( 'account_status', 1 );
		$this->db->where( 'type', $id );

		if ( $this->input->get( 'province' ) ) 
		{
			$this->db->where( 'province', (int)$this->input->get( 'province' ) );
		}


		$query = $this->db->get( 'accounts' );
		$data = $query->result();
		$output['show_data'] = $data;

		$this->db->where( 'id', $id );
		$query = $this->db->get( 'type_shop' );
		$data = $query->row();
		$output['type'] = $data;


		$query = $this->db->get( 'province' );
		$output['province_list'] = $query->result();


		$this->generate_page('front/templates/index/shop_view', $output);
	
	} // END FUNCTION shop


	public function shop_detail( $id = '' )
	{

		$output['shop_id'] = $id;

		$output['hover_menu'] = 'SHOP';
		if ( empty( $id ) ) 
		{
			redirect( site_url() );
		}

		$this->db->where( 'account_id', $id );
		$this->db->set( 'count_view', 'count_view+1', false );
		$this->db->update( 'accounts' );

		$this->db->where( 'account_id', $id );
		$query = $this->db->get( 'accounts' );
		$data = $query->row();

		$output['show_data'] = $data;


		$this->db->where( 'account_id', $id );
		$query = $this->db->get( 'account_image_shop' );
		$output['image_shop'] = $query->result();

		$this->db->where( 'account_id', $id );
		$query = $this->db->get( 'account_image_product' );
		$output['image_product'] = $query->result();



		/**
		*
		*** START get data coupon
		*
		**/
		
		$this->db->from( 'account_coupon AS ac' );
		$this->db->where( 'ac.status', 1 );
		$this->db->join( 'accounts AS a', 'a.account_id = ac.account_id', 'left' );
		$this->db->where( 'a.account_id', $id );

		$query = $this->db->get();
		$output['coupon_list'] = $query->result();
		
		/** END get data coupon **/
		
		// -------------------------------------
		


		$this->generate_page('front/templates/shop/shop_detail_view', $output);

	
	} // END FUNCTION shop_detail


	public function news()
	{
	
		$output = '';

		$output['hover_menu'] = 'NEWS';

		$this->generate_page('front/templates/news/news_index_view', $output);
	
	} // END FUNCTION news


	public function coupon( $id = '' )
	{
	
		$output = '';

		$output['id_coupon'] = $id;

		$output['hover_menu'] = 'COUPON';

		$query = $this->db->get( 'province' );
		$output['province_list'] = $query->result();

		$this->db->from( 'account_coupon AS ac' );
		$this->db->where( 'ac.status', 1 );
		$this->db->join( 'accounts AS a', 'a.account_id = ac.account_id', 'left' );
		$this->db->where( 'a.type', $id );

		if ( $this->input->get( 'province' ) ) 
		{
			$this->db->where( 'province', (int)$this->input->get( 'province' ) );
		}

		$query = $this->db->get();
		$output['data_list'] = $query->result();

		$this->generate_page('front/templates/coupon/index_coupon_view', $output);
	
	} // END FUNCTION coupon

	public function contact( )
	{
	
		$output = '';

		$output['hover_menu'] = 'CONTACT US';

		$this->generate_page('front/templates/contact/index_contact_view', $output);
	
	} // END FUNCTION contact



	public function my_shop( $id )
	{
		$output = '';
		$output['hover_menu'] = '';

		$data_account = $this->account_model->get_account_cookie( 'member' );

		if ( empty( $data_account ) ) 
		{
			redirect( site_url() );
		}

		if ( $this->input->post() ) 
		{


			$image_shop = $this->input->post('image_shop');
			$image_product = $this->input->post('image_product');
		
			$this->db->where( 'account_id', $data_account['id'] );	
			$this->db->delete( 'account_image_shop' );

			$this->db->where( 'account_id', $data_account['id'] );	
			$this->db->delete( 'account_image_product' );

			foreach ( $image_shop as $key => $value ) 
			{
				$this->db->set( 'account_id', $data_account['id'] );
				$this->db->set( 'image', $value );
				$this->db->insert( 'account_image_shop' );
			}

			if ( ! empty( $image_product ) ) 
			{
				foreach ( $image_product as $key => $value ) 
				{
					$this->db->set( 'account_id', $data_account['id'] );
					$this->db->set( 'image_product', $value );
					$this->db->insert( 'account_image_product' );
				}
			}

		}



		$this->db->where( 'account_id', $data_account['id'] );
		$query = $this->db->get( 'account_image_shop' );
		$output['image_shop'] = $query->result();

		$this->db->where( 'account_id', $data_account['id'] );
		$query = $this->db->get( 'account_image_product' );
		$output['image_product'] = $query->result();


		$this->db->where( 'account_id', $data_account['id'] );
		$query = $this->db->get( 'account_coupon' );
		$output['coupon_list'] = $query->result();

		$this->generate_page('front/templates/account/my_shop_view', $output);	
	
	} // END FUNCTION my_shop


	public function add_coupon()
	{
		$output = '';

		$output['hover_menu'] = '';

		$data_account = $this->account_model->get_account_cookie( 'member' );

		if ( empty( $data_account ) ) 
		{
			redirect( site_url() );
		}

		$id = $data_account['id'];

		if ( $this->input->post() ) 
		{
			
			/**
			*
			*** START ADD CONTENT
			*
			**/
				// CHECK ID EMPTY
				if ( empty( $id ) ) 
				{
					$error_validation[] = 'System error , Please try again';
				}


				$data_post = $this->input->post();


		 		$array_validation = array( "image_coupon" => "Image coupon", "name_coupon" => "Name coupon", "discount" => "Discount", "detail" => "Detail", "start_date" => "Start date", "end_date" => "End date" );

		 		foreach ( $array_validation as $key => $value ) 
		 		{

		 			// AND is_array_empty( $this->input->post( $key )
		 			if ( ! $this->input->post( $key )  ) 
		 			{
		 				$error_validation[] = 'Please enter information '.$array_validation[ $key ];
		 			}
		 			else if ( is_array( $this->input->post( $key ) ) ) 
		 			{
		 				$set_error = is_array_empty_validate( $this->input->post( $key ) );

		 				foreach ( $set_error as $key_lang => $value_lang ) 
	 					{
	 						$error_validation[] = 'Please enter information '.$array_validation[ $key ].' for language '.$this->lang_model->get_name_lang( $value_lang );
	 					}	
		 			}

		 		}	

		 		if ( ! empty( $error_validation )  ) 
		 		{
		 			$output['show_data'] = json_decode(json_encode( $this->input->post() ), FALSE);
		 			$output[ 'error' ] = preview_error( $error_validation );
		 		}
		 		else
		 		{
		 			$data_post['account_id'] = $id;
		 			$data_post['start_date'] = strtotime( reset_format_date($data_post['start_date']) );
		 			$data_post['end_date'] = strtotime( reset_format_date($data_post['end_date']) ); 
		 			$this->db->insert( 'account_coupon', $data_post );

					$this->session->set_flashdata( 'form_status', preview_success() );
					redirect( 'index/my_shop/'.$id );
		 		}
			
			/** END ADD CONTENT **/
			
			// -------------------------------------



		}

		$this->generate_page('front/templates/coupon/form_coupon_view', $output);		
	
	} // END FUNCTION add_coupon

	public function edit_coupon( $id_coupon = '' )
	{

		$output = '';

		$output['hover_menu'] = '';

		$data_account = $this->account_model->get_account_cookie( 'member' );

		if ( empty( $data_account ) ) 
		{
			redirect( site_url() );
		}

		$id = $data_account['id'];

		if ( $this->input->post() ) 
		{
			
			/**
			*
			*** START ADD CONTENT
			*
			**/
				// CHECK ID EMPTY
				if ( empty( $id ) ) 
				{
					$error_validation[] = 'System error , Please try again';
				}


				$data_post = $this->input->post();


		 		$array_validation = array( "image_coupon" => "Image coupon", "name_coupon" => "Name coupon", "discount" => "Discount", "detail" => "Detail", "start_date" => "Start date", "end_date" => "End date" );

		 		foreach ( $array_validation as $key => $value ) 
		 		{

		 			// AND is_array_empty( $this->input->post( $key )
		 			if ( ! $this->input->post( $key )  ) 
		 			{
		 				$error_validation[] = 'Please enter information '.$array_validation[ $key ];
		 			}
		 			else if ( is_array( $this->input->post( $key ) ) ) 
		 			{
		 				$set_error = is_array_empty_validate( $this->input->post( $key ) );

		 				foreach ( $set_error as $key_lang => $value_lang ) 
	 					{
	 						$error_validation[] = 'Please enter information '.$array_validation[ $key ].' for language '.$this->lang_model->get_name_lang( $value_lang );
	 					}	
		 			}

		 		}	

		 		if ( ! empty( $error_validation )  ) 
		 		{
		 			$output['show_data'] = json_decode(json_encode( $this->input->post() ), FALSE);
		 			$output[ 'error' ] = preview_error( $error_validation );
		 		}
		 		else
		 		{
		 			
		 			$data_post['start_date'] = strtotime( reset_format_date($data_post['start_date']) );
		 			$data_post['end_date'] = strtotime( reset_format_date($data_post['end_date']) ); 
		 			$this->db->where( 'account_id', $id );
		 			$this->db->where( 'id', $id_coupon );
		 			$this->db->update( 'account_coupon', $data_post );

					$this->session->set_flashdata( 'form_status', preview_success() );
					redirect( 'index/my_shop/'.$id );
		 		}
			
			/** END ADD CONTENT **/
			
			// -------------------------------------



		}
		else
		{
			$this->db->where( 'account_id', $id );
			$this->db->where( 'id', $id_coupon );
			$query = $this->db->get( 'account_coupon' );
			$output['show_data'] = $query->row();


			$output['show_data']->start_date = date( 'd/m/Y' , $output['show_data']->start_date );

			$output['show_data']->end_date = date( 'd/m/Y' , $output['show_data']->end_date );
		}

	
		$this->generate_page('front/templates/coupon/form_coupon_view', $output);	
	
	} // END FUNCTION add_coupon

	public function delete_coupon( $id = '' )
	{
	
		$data_account = $this->account_model->get_account_cookie( 'member' );

		if ( empty( $data_account ) ) 
		{
			redirect( site_url() );
		}

		$account_id = $data_account['id'];

		$this->db->where( 'id', $id );
		$this->db->where( 'account_id', $account_id );
		$this->db->delete( 'account_coupon' );

		redirect( 'index/my_shop/'.$account_id );
	
	} // END FUNCTION add_coupon



	public function page_print( $id = '' )
	{
	
		$output['hover_menu'] = 'SHOP';
		if ( empty( $id ) ) 
		{
			redirect( site_url() );
		}

		$this->db->where( 'account_id', $id );
		$this->db->set( 'count_view', 'count_view+1', false );
		$this->db->update( 'accounts' );

		$this->db->where( 'account_id', $id );
		$query = $this->db->get( 'accounts' );
		$data = $query->row();

		$output['show_data'] = $data;


		$this->db->where( 'account_id', $id );
		$query = $this->db->get( 'account_image_shop' );
		$output['image_shop'] = $query->result();

		$this->db->where( 'account_id', $id );
		$query = $this->db->get( 'account_image_product' );
		$output['image_product'] = $query->result();



		/**
		*
		*** START get data coupon
		*
		**/
		
		$this->db->from( 'account_coupon AS ac' );
		$this->db->where( 'ac.status', 1 );
		$this->db->join( 'accounts AS a', 'a.account_id = ac.account_id', 'left' );
		$this->db->where( 'a.account_id', $id );

		$query = $this->db->get();
		$output['coupon_list'] = $query->result();
		
		/** END get data coupon **/
		
		// -------------------------------------
		


		$this->generate_page('front/templates/shop/page_print_view', $output);
	
	} // END FUNCTION page_print




	public function test()
	{
		$output = '';
		$output['hover_menu'] = 'test';

		$this->generate_page( 'test' , $output );
	} // END FUNCTION FunctionName



	
}