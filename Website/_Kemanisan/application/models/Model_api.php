<?php 
// membuat class model, dengan syarat nama file sama dengan nama Class
class Model_api extends CI_Model {
	// membuat fungsi getAll untuk menangkap data yang ada dalam database
	public function getAll(){
		// membuat build query untuk menampilkan semua isi database
		$this->db->select('*');
		$this->db->from('rb_penjualan_detail');
		$this->db->join('rb_produk','rb_penjualan_detail.id_produk = rb_produk.id_produk');//menggabungkan tabel tm_user dan tb_grub berdasarkan id_grub 
		$query = $this->db->get(); //Digunakan untuk menyeleksi seluruh data pada suatu table di database, jika kosong berarti menampilkan semua data tabel yang sudah digabungkan
		// mengembalikan varibel query
		return $query;
	}

	public function view($table){
        return $this->db->get($table);
    }

	public function getProduk($table1,$table2,$field){
		$this->db->select('*');
        $this->db->from($table1);
        $this->db->join($table2, $table1.'.'.$field.'='.$table2.'.'.$field);
		$query = $this->db->get();
		return $query;
	}



	
	public function input_data($data,$table)
	{
		$this->db->insert($table,$data);
	}

	public function edit_data($where,$table){
		return $this->db->get_where($table,$where);
	} 

	// menjalankan query update untuk mengubah data
	public function update_data($where,$data,$table){
		// menangkap id yang di pilih
		$this->db->where($where);
		// menjalankan query updtae
		$this->db->update($table,$data);
	}

	// menjalankan query delete untuk menghapus data
	public function hapus_data($where,$table)
	{
		// menangkap id yang di pilih
		$this->db->where($where);
		// menghapus data berdasrkan id yang di pilih
		$this->db->delete($table);
	} 

	// Membuat fungsi login untuk implementasi aksi login
	public function login($user,$pass,$table) {
		$this->db->select('*'); //build query untuk menampilkan data
		$this->db->from($table); //build query untuk menentukan table yang akan di gunakan
		$this->db->where('username',$user); //build query untuk mencari username dan membandingkanya dengan input user
		$this->db->where('password',$pass); //build query untuk mencari password dan membandingkanya dengan input user
		$query = $this->db->get(); //menangkap semua aksi di atas dan menyimpanya di dalam variabel $query
		return $query; //mengembalikan variabel $query
	}

	public function cek_login()
    {
        if(empty($this->session->userdata('status')))
        {
			redirect('Login');
		}
    }

    public function cek_logout()
    {
    	if(!empty($this->session->userdata('status')))
        {
            redirect('Mahasiswa');
        }
    }

    public function cekProfil($data)
    {
    	return $this->db->query("SELECT username FROM rb_konsumen WHERE username = '$data'");
    }

    public function get_nama_user($data)
    {
    	return $this->db->query("SELECT nama_lengkap FROM rb_konsumen WHERE username = '$data'")->row()->nama_lengkap;
    }

    public function get_email_user($data)
    {
    	return $this->db->query("SELECT email FROM rb_konsumen WHERE username = '$data'")->row()->email;
    }


    public function getMax($field, $tabel)
    {
    	return $this->db->query("SELECT MAX($field) AS id_penjualan FROM $tabel")->row_array()['id_penjualan'];    
    }

    public function hitungAgen()
    {
    	$this->db->select('*'); //build query untuk menampilkan data
		$this->db->from('rb_reseller');
		return $this->db->count_all_results();
    }

	public function get_id_user($data)
    {
    	return $this->db->query("SELECT id_konsumen FROM rb_konsumen WHERE username = '$data'")->row()->id_konsumen;
    }

 //    public function input_data($data,$table)
	// {
	// 	// build query untuk insert(menambahkan data)
	// 	$this->db->insert($table,$data);
	// }

	function get_diterima($id,$level){
        return $this->db->query("SELECT * FROM `rb_penjualan` a JOIN rb_reseller b JOIN rb_penjualan_detail c JOIN rb_produk d ON a.id_penjual=b.id_reseller AND a.id_penjualan=c.id_penjualan AND c.id_produk=d.id_produk where a.status_penjual='$level' AND a.id_pembeli='$id' AND a.proses='2' ORDER BY a.id_penjualan DESC");
    }

    function get_dikirim($id,$level){
        return $this->db->query("SELECT * FROM `rb_penjualan` a JOIN rb_reseller b JOIN rb_penjualan_detail c JOIN rb_produk d ON a.id_penjual=b.id_reseller AND a.id_penjualan=c.id_penjualan AND c.id_produk=d.id_produk where a.status_penjual='$level' AND a.id_pembeli='$id' AND a.proses='1' ORDER BY a.id_penjualan DESC");
    }

    function get_pending($id,$level){
        return $this->db->query("SELECT * FROM `rb_penjualan` a JOIN rb_reseller b JOIN rb_penjualan_detail c JOIN rb_produk d ON a.id_penjual=b.id_reseller AND a.id_penjualan=c.id_penjualan AND c.id_produk=d.id_produk where a.status_penjual='$level' AND a.id_pembeli='$id' AND a.proses='0' ORDER BY a.id_penjualan DESC");
    }


}
?>