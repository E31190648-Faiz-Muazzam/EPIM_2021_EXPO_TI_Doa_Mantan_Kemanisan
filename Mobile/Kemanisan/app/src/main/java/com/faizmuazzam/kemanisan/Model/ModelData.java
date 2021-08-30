package com.faizmuazzam.kemanisan.Model;

public class ModelData {
    /**Inisialisasi Varisabel*/
    String nama_produk, alamat_kantor,
            stok, harga, user_agen, user_konsumen
            ,id_produk, judul_berita, sub_judul_berita
            ,isi_berita;

    /**Membuat kontruksi*/
    public ModelData(){

    }

    public ModelData(String nama_produk, String alamat_kantor, String stok, String harga, String user_agen, String user_konsumen, String id_produk, String judul_berita, String sub_judul_berita, String isi_berita) {
        this.nama_produk = nama_produk;
        this.alamat_kantor = alamat_kantor;
        this.stok = stok;
        this.harga = harga;
        this.user_agen = user_agen;
        this.user_konsumen = user_konsumen;
        this.id_produk = id_produk;
        this.judul_berita = judul_berita;
        this.sub_judul_berita = sub_judul_berita;
        this.isi_berita = isi_berita;
    }

    /**Membuat Getter Setter yang dimana di gunkanakan untuk mengambil dan mengisi nilai pada suatu objek.*/
    public String getNama_produk() {
        return nama_produk;
    }

    public void setNama_produk(String nama_produk) {
        this.nama_produk = nama_produk;
    }

    public String getAlamat_kantor() {
        return alamat_kantor;
    }

    public void setAlamat_kantor(String alamat_kantor) {
        this.alamat_kantor = alamat_kantor;
    }

    public String getStok() {
        return stok;
    }

    public void setStok(String stok) {
        this.stok = stok;
    }

    public String getHarga() {
        return harga;
    }

    public void setHarga(String harga) {
        this.harga = harga;
    }

    public String getUser_agen() {
        return user_agen;
    }

    public void setUser_agen(String user_agen) {
        this.user_agen = user_agen;
    }

    public String getUser_konsumen() {
        return user_konsumen;
    }

    public void setUser_konsumen(String user_konsumen) {
        this.user_konsumen = user_konsumen;
    }

    public String getId_produk() {
        return id_produk;
    }

    public void setId_produk(String id_produk) {
        this.id_produk = id_produk;
    }

    public String getJudul_berita() {
        return judul_berita;
    }

    public void setJudul_berita(String judul_berita) {
        this.judul_berita = judul_berita;
    }

    public String getSub_judul_berita() {
        return sub_judul_berita;
    }

    public void setSub_judul_berita(String sub_judul_berita) {
        this.sub_judul_berita = sub_judul_berita;
    }

    public String getIsi_berita() {
        return isi_berita;
    }

    public void setIsi_berita(String isi_berita) {
        this.isi_berita = isi_berita;
    }
}