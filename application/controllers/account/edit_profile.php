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

class edit_profile extends MY_Controller 
{

	
	public function __construct() 
	{
		parent::__construct();
		
		// load helper
		$this->load->helper(array('date', 'form', 'language'));
		
		// load language
		$this->lang->load('account');
	}// __construct
	
	
	public function _remap($att1 = '', $att2 = '') 
	{
		if ($att1 == 'delete-avatar') {
			$this->delete_avatar();
		} else {
			$this->index();
		}
	}// _remap
	
	
	public function delete_avatar() 
	{
		// get id
		$account_id = trim($this->input->post('account_id'));
		
		// delete avatar
		$this->account_model->deleteAccountAvatar($account_id);
		
		// return
		if (!$this->input->is_ajax_request()) {
			redirect('account/edit-profile');
		} else {
			$output['result'] = true;
			$this->output->set_content_type('application/json');
			$this->output->set_output(json_encode($output));
			unset($output);
		}
	}// delete_avatar
	
	
	public function index() 
	{
		$output['hover_menu'] = '';
		// is member login?
		if (!$this->account_model->isMemberLogin()) {redirect(site_url());}
		
		// set breadcrumb ----------------------------------------------------------------------------------------------------------------------
		$breadcrumb[] = array('text' => $this->lang->line('frontend_home'), 'url' => '/');
		$breadcrumb[] = array('text' => lang('account_edit_profile'), 'url' => current_url());
		$output['breadcrumb'] = $breadcrumb;
		unset($breadcrumb);
		// set breadcrumb ----------------------------------------------------------------------------------------------------------------------
		
		// load configurations
		$cfg = $this->config_model->load(array('allow_avatar', 'avatar_size', 'avatar_allowed_types'));
		$output['allow_avatar'] = $cfg['allow_avatar']['value'];
		$output['avatar_size'] = $cfg['avatar_size']['value'];
		$output['avatar_allowed_types'] = $cfg['avatar_allowed_types']['value'];
		unset($cfg);
		
		// load session for flashdata
		$this->load->library('session');
		$form_status = $this->session->flashdata('form_status');
		if (isset($form_status['form_status']) && isset($form_status['form_status_message'])) {
			$output['form_status'] = $form_status['form_status'];
			$output['form_status_message'] = $form_status['form_status_message'];
		}
		unset($form_status);
		
		// get id
		$cm_account = $this->account_model->getAccountCookie('member');
		
		// check from db
		$data['account_id'] = $cm_account['id'];
		$data['account_username'] = $cm_account['username'];
		$row = $this->account_model->getAccountData($data);
		unset($data);
		
		if ($row != null) {
			$output['row'] = $row;
			$output['account_id'] = $row->account_id;
			$output['account_username'] = $row->account_username;
			$output['account_email'] = $row->account_email;
			$output['account_fullname'] = $row->account_fullname;
			$output['account_birthdate'] = $row->account_birthdate;
			$output['account_avatar'] = $row->account_avatar;
			$output['account_timezone'] = $row->account_timezone;
		} else {
			// not found.
			unset($cm_account, $output);
			redirect(site_url());
		}
		
		// save action
		if ($this->input->post()) {

			$data_post = $this->input->post();

			$data = $data_post;

			$data['account_id'] = $row->account_id;
			$data['account_email'] = $row->account_email;
			$data['account_username'] = $row->account_username;
			$data['account_email'] = strip_tags(trim($this->input->post('account_email', true)));
			$data['account_password'] = trim($this->input->post('account_password'));
			$data['account_fullname'] = htmlspecialchars(trim($this->input->post('account_fullname')),ENT_QUOTES, config_item('charset'));
				if (empty($data['account_fullname'])) {$data['account_fullname'] = null;}
			$data['account_birthdate'] = strip_tags(trim($this->input->post('account_birthdate')));
				if (empty($data['account_birthdate'])) {$data['account_birthdate'] = null;}
			$data['account_timezone'] = trim($this->input->post('account_timezone'));
				if (empty($data['account_timezone'])) {$data['account_timezone'] = $this->config_model->loadSingle('site_timezone');}
			
			// load form validation
			$this->load->library('form_validation');

			$this->form_validation->set_rules('name', 'lang:ชื่อ', 'trim|required|xss_clean|min_length[1]|no_space_between_text');
			$this->form_validation->set_rules('last_name', 'lang:นามสกุล', 'trim|required|xss_clean|min_length[1]|no_space_between_text');
			$this->form_validation->set_rules('name_shop', 'lang:ชื่อร้านค้า', 'trim|required|xss_clean|min_length[1]');

			$this->form_validation->set_rules('account_username', 'lang:account_username', 'trim|required|xss_clean|min_length[1]|no_space_between_text');
			$this->form_validation->set_rules('account_email', 'lang:account_email', 'trim|required|valid_email|xss_clean');

			if ($this->form_validation->run() == false) {
				$output['form_status'] = 'error';
				$output['form_status_message'] = '<ul>'.validation_errors('<li>', '</li>').'</ul>';
			} else {
				// save
				// $result = $this->account_model->memberEditProfile($data);

				$output['form_status_message'] = '';

				$this->db->where('account_id != ', $data['account_id']);
				$this->db->where('account_email', $data['account_email']);
				$query = $this->db->select('account_id, account_email')->get('accounts');
				if ($query->num_rows() > 0) {
					$query->free_result();

					$output['form_status'] = 'error';
					$output['form_status_message'] .= $this->lang->line('account_email_already_exists').'<br>';

				}

				$this->db->where('account_id != ', $data['account_id']);
				$this->db->where('account_username', $data['account_username']);
				$query = $this->db->select('account_id, account_email, account_username')->get('accounts');
				if ($query->num_rows() > 0) {
					$query->free_result();

					$output['form_status'] = 'error';
					$output['form_status_message'] .= $this->lang->line('account_email_already_exists');

				}	

				if ( empty( $data['account_password'] ) ) 
				{
					unset( $data['account_password'] );
				}

				if ( empty( $output['form_status_message'] ) ) 
				{
					$data['account_password'] = $this->encryptPassword($data['account_password']);
					$id_account = $data['account_id'];
					unset( $data['account_id'] );
					$this->db->where( 'account_id', $id_account );
					$this->db->update( 'accounts', $data );

					$output['form_status'] = 'success';
					$output['form_status_message'] .= $this->lang->line('account_success');


					$result = true;


				}			

				
				if ($result === true) {
					// flash success msg to session
					$this->session->set_flashdata(
						'form_status',
						array(
							'form_status' => 'success',
							'form_status_message' => $this->lang->line('account_saved')
						)
					);
					redirect(current_url());
				} else {
					$output['form_status'] = 'error';
					$output['form_status_message'] = $result;
				}
				unset($result);
			}
			
			// re-populate form
			$output['account_email'] = $data['account_email'];
			$output['account_fullname'] = $data['account_fullname'];
			$output['account_birthdate'] = $data['account_birthdate'];
			$output['account_timezone'] = $data['account_timezone'];
		}
		unset($cm_account, $query);
		
		// head tags output ##############################
		$output['page_title'] = $this->html_model->gen_title($this->lang->line('account_edit_profile'));
		// meta tags
		// link tags
		// script tags
		// end head tags output ##############################
		

		/**
		*
		*** START GET PROVINCE
		*
		**/
		
		$query = $this->db->get( 'province' );
		$output['province'] = $query->result();
		
		
		/** END GET PROVINCE **/


		/**
		*
		*** START GET TYPE SHOP
		*
		**/
	
		$query = $this->db->get( 'type_shop' );
		$output['type_shop'] = $query->result();
		
		/** END GET TYPE SHOP **/
		
		// -------------------------------------
		

		$info = $this->account_model->get_account_cookie( 'member' );


		$this->db->where( 'account_id', $info['id'] );
		$query = $this->db->get( 'accounts' );
		$data = $query->row();

		$output['show_data'] = $data;


		// output
		$this->generate_page('front/templates/account/edit_profile_view', $output);
	}// index
	

	/**
	 * encrypt password
	 * @param string $password
	 * @return string
	 */
	public function encryptPassword($password = '') 
	{
		if (property_exists($this, 'modules_plug') && $this->modules_plug->has_filter('account_generate_hash_password')) {
			return $this->modules_plug->do_filter('account_generate_hash_password', $password);
		} else {
			include dirname(dirname(__FILE__)).'/../libraries/PasswordHash.php';
			$PasswordHash = new PasswordHash(12, false);
			return $PasswordHash->HashPassword($password);
		}
	}// encryptPassword
	

}

