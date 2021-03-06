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

class index extends admin_controller 
{

	
	public function __construct() 
	{
		parent::__construct();
	}// __construct
	
	
	public function index() 
	{
		// load session for flashdata
		$this->load->library('session');
		$form_status = $this->session->flashdata('form_status');
		if (isset($form_status['form_status']) && isset($form_status['form_status_message'])) {
			$output['form_status'] = $form_status['form_status'];
			$output['form_status_message'] = $form_status['form_status_message'];
		}
		unset($form_status);
		
		// head tags output ##############################
		$output['page_title'] = $this->html_model->gen_title($this->lang->line('admin_home'));
		// meta tags
		// link tags
		// script tags
		// end head tags output ##############################
		
		// output

		// redirect( site_url('site-admin/account') );


		$this->generate_page('site-admin/templates/index/index_view', $output);
	}// index
	


	public function banner()
	{
		$output = '';
		$output['page_title'] = $this->html_model->gen_title($this->lang->line('admin_home'));

		if ( $this->input->post() ) 
		{

			$this->db->truncate('banner'); 

			$data_post = $this->input->post();

			foreach ( $data_post['image'] as $key => $value ) 
			{
				$this->db->set( 'image', $value );
				$this->db->insert( 'banner' );
			}

		}

		$query = $this->db->get( 'banner' );
		$data = $query->result();

		$output['list_image'] = $data;

		$this->generate_page('site-admin/templates/index/banner_view', $output);
	
	} // END FUNCTION banner

}

