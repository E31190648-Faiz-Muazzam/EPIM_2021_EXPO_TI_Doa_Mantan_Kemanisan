package com.faizmuazzam.kemanisan.Model;

public class ModelDataDikemas {
    /**Inisialisasi Varisabel*/
    String no_transaksi_dikemas, nama_barang_dikemas, nama_agen_dikemas, total_harga_dikemas, status_dikemas;

    /**Membuat kontruksi*/
    public ModelDataDikemas(){

    }

    public ModelDataDikemas(String no_transaksi_dikemas, String nama_barang_dikemas, String nama_agen_dikemas, String total_harga_dikemas, String status_dikemas) {
        this.no_transaksi_dikemas = no_transaksi_dikemas;
        this.nama_barang_dikemas = nama_barang_dikemas;
        this.nama_agen_dikemas = nama_agen_dikemas;
        this.total_harga_dikemas = total_harga_dikemas;
        this.status_dikemas = status_dikemas;
    }

    public String getNo_transaksi_dikemas() {
        return no_transaksi_dikemas;
    }

    public void setNo_transaksi_dikemas(String no_transaksi_dikemas) {
        this.no_transaksi_dikemas = no_transaksi_dikemas;
    }

    public String getNama_barang_dikemas() {
        return nama_barang_dikemas;
    }

    public void setNama_barang_dikemas(String nama_barang_dikemas) {
        this.nama_barang_dikemas = nama_barang_dikemas;
    }

    public String getNama_agen_dikemas() {
        return nama_agen_dikemas;
    }

    public void setNama_agen_dikemas(String nama_agen_dikemas) {
        this.nama_agen_dikemas = nama_agen_dikemas;
    }

    public String getTotal_harga_dikemas() {
        return total_harga_dikemas;
    }

    public void setTotal_harga_dikemas(String total_harga_dikemas) {
        this.total_harga_dikemas = total_harga_dikemas;
    }

    public String getStatus_dikemas() {
        return status_dikemas;
    }

    public void setStatus_dikemas(String status_dikemas) {
        this.status_dikemas = status_dikemas;
    }
}
