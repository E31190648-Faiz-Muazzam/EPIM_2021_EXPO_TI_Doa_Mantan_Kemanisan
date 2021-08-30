<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
// membuat class controller, dengan syarat nama file sama dengan nama Class
class Api_Server extends CI_Controller {
	// Membuat fungsi consturct digunakan untuk menjalankan perintah yang dibuat di dalamnya ketika class pertama kali di panggil
	function __construct()
	{
		parent::__construct();
		// memanggil class Mahasiswa_model dari folder models
		$this->load->model('Model_api');
	}

	public function index(){

	}

	public function Api(){
		// memanggil fungsi yang ada di mahasiswa yang bertujuan untuk menampilkan data yang ada pada tabel data base
		$data = $this->Model_api->getAll();
		// mengubahnya menjadi bahasa json
		echo json_encode($data->result_array());
	}

	public function produkAPI(){
		$data = $this->Model_api->getProduk('rb_produk','rb_reseller','id_reseller')->result_array();
	// $jual = $this->model_reseller->jual_reseller(12,36)->row_array();
  //   	$beli = $this->model_reseller->beli_reseller(12,36)->row_array();
  //   	$stok = $beli['beli']-$jual['jual'];
		// $data['stok']= strval($stok);
		echo json_encode($data);
	}

	public function beritaAPI()
	{
		$data = $this->Model_api->view('berita');
		echo json_encode($data->result_array());
	}



	public function jumlahStok(){
		$reseller = $this->input->post('id_agen');
		$produk = $this->input->post('id_produk');
		$jual = $this->model_reseller->jual_reseller($reseller,$produk)->row_array();
    	$beli = $this->model_reseller->beli_reseller($reseller,$produk)->row_array();
    	$result['stok'] = $beli['beli']-$jual['jual'];
    	echo json_encode($result);
	}

	public function loginAPI()
	{
		$user_login = $this->input->post('user_login');
		$email = $this->input->post('email');
		$cek = $this->Model_api->login($user_login,$email,'rb_konsumen')->result();
		if($cek != FALSE){
			foreach ($cek as $row) {
				$user = $row->username;
			}
			$result['value'] = "1";
			$result['user'] = $user;
			$result['pesan'] = "Login Berhasil";
		}else{
			$result['value'] = "0";
			$result['pesan'] = "Password atau Username Salah";
		}
		echo json_encode($result);
	}

	public function profilAPI()
	{
		$user = $this->input->post('user_login');
		$result['hasil'] = null;
		if ($this->Model_api->cekProfil($user)->num_rows() != 0) {
			$result['value'] = '1';
			$result['pesan'] = 'Data ne wes metu su!';
			$result['hasil'] = [
				'nama_user' => $this->Model_api->get_nama_user($user),
				'email_user' => $this->Model_api->get_email_user($user),
				'id_user' => $this->Model_api->get_id_user($user)
			];
		} else {
			$result['value'] = "0";
			$result['pesan'] = 'Guoblok sek urung metu su!';
		}
		echo json_encode($result);
	}

	public function kodeTransaksi()
	{
		$tabel = "rb_penjualan";
		$field = "id_penjualan";

		$lastID = $this->Model_api->getMax($field, $tabel);
		$noUrut = substr($lastID, -4, 4);
		$noUrut++;
		$bulan = date('m');
		$tahun = date('Y');
		$format = "ANDRO-".$tahun.$bulan;
		$noTransaksi = $format.sprintf('%004s', $noUrut);
		$result['kode'] = $noTransaksi;
		echo json_encode($result);
		
	}

	public function JumlahAgen()
	{
		$result['jumlahAgen'] = $this->Model_api->hitungAgen();
		echo json_encode($result);

	}

	// public function ApiPenjualan(){
	// 		$kode_transaksi = $this->input->POST('kode_transaksi');
	// 		$id_pembeli = $this->input->POST('id_pembeli');
	// 		$id_penjual = $this->input->POST('id_penjual');
	// 		$status_pembeli = 'konsumen';
	// 		$status_penjual = 'reseller';
	// 		$kurir = '-';
	// 		$service = 'Via_Android';
	// 		$ongkir = '0';



	// 		$data = array(
	// 			'username' => $username,
	// 			'password' => $password,
	// 			'nama' => $nama,
	// 			'grub' => $grubp
	// 		);
			
	// 		$this->Mahasiswa_model->input_data($data,'tm_user');
	// 		echo json_encode($array);
	// 	}


	// public function tanggalSimpan()
	// {
	// 	$date = tgl_simpan(date('Y-m-d'));
	// 	echo $date;
	// }

}
?>