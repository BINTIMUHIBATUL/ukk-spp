<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Welcome extends CI_Controller{
    
    public function index(){

        $data['title'] = 'Landing Page';
        $this->load->view('templates/header_landing', $data);
        $this->load->view('welcome/index');
        $this->load->view('templates/footer_landing');
    }
}

?>