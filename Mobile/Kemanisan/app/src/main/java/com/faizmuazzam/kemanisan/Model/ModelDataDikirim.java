package com.faizmuazzam.kemanisan.Model;

public class ModelDataDikirim {
    String no_transaksi_dikirim, nama_barang_dikirim, nama_agen_dikirim, total_harga_dikirim, status_dikirim;

    /**Membuat kontruksi*/
    public ModelDataDikirim(){

    }

    public ModelDataDikirim(String no_transaksi_dikirim, String nama_barang_dikirim, String nama_agen_dikirim, String total_harga_dikirim, String status_dikirim) {
        this.no_transaksi_dikirim = no_transaksi_dikirim;
        this.nama_barang_dikirim = nama_barang_dikirim;
        this.nama_agen_dikirim = nama_agen_dikirim;
        this.total_harga_dikirim = total_harga_dikirim;
        this.status_dikirim = status_dikirim;
    }

    public String getNo_transaksi_dikirim() {
        return no_transaksi_dikirim;
    }

    public void setNo_transaksi_dikirim(String no_transaksi_dikirim) {
        this.no_transaksi_dikirim = no_transaksi_dikirim;
    }

    public String getNama_barang_dikirim() {
        return nama_barang_dikirim;
    }

    public void setNama_barang_dikirim(String nama_barang_dikirim) {
        this.nama_barang_dikirim = nama_barang_dikirim;
    }

    public String getNama_agen_dikirim() {
        return nama_agen_dikirim;
    }

    public void setNama_agen_dikirim(String nama_agen_dikirim) {
        this.nama_agen_dikirim = nama_agen_dikirim;
    }

    public String getTotal_harga_dikirim() {
        return total_harga_dikirim;
    }

    public void setTotal_harga_dikirim(String total_harga_dikirim) {
        this.total_harga_dikirim = total_harga_dikirim;
    }

    public String getStatus_dikirim() {
        return status_dikirim;
    }

    public void setStatus_dikirim(String status_dikirim) {
        this.status_dikirim = status_dikirim;
    }
}
