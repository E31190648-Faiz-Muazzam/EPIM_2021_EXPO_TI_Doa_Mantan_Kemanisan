package com.faizmuazzam.kemanisan.Model;

public class ModelDataPending {
    String no_transaksi_pending, nama_barang_pending, nama_agen_pending, total_harga_pending, status_pending;

    /**Membuat kontruksi*/
    public ModelDataPending(){

    }

    public ModelDataPending(String no_transaksi_pending, String nama_barang_pending, String nama_agen_pending, String total_harga_pending, String status_pending) {
        this.no_transaksi_pending = no_transaksi_pending;
        this.nama_barang_pending = nama_barang_pending;
        this.nama_agen_pending = nama_agen_pending;
        this.total_harga_pending = total_harga_pending;
        this.status_pending = status_pending;
    }

    public String getNo_transaksi_pending() {
        return no_transaksi_pending;
    }

    public void setNo_transaksi_pending(String no_transaksi_pending) {
        this.no_transaksi_pending = no_transaksi_pending;
    }

    public String getNama_barang_pending() {
        return nama_barang_pending;
    }

    public void setNama_barang_pending(String nama_barang_pending) {
        this.nama_barang_pending = nama_barang_pending;
    }

    public String getNama_agen_pending() {
        return nama_agen_pending;
    }

    public void setNama_agen_pending(String nama_agen_pending) {
        this.nama_agen_pending = nama_agen_pending;
    }

    public String getTotal_harga_pending() {
        return total_harga_pending;
    }

    public void setTotal_harga_pending(String total_harga_pending) {
        this.total_harga_pending = total_harga_pending;
    }

    public String getStatus_pending() {
        return status_pending;
    }

    public void setStatus_pending(String status_pending) {
        this.status_pending = status_pending;
    }
}
