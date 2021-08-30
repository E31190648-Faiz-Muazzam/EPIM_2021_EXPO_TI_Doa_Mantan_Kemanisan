package com.faizmuazzam.kemanisan;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.faizmuazzam.kemanisan.Util.AppController;
import com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_PROFILE;

public class BayarActivity extends AppCompatActivity implements View.OnClickListener {
    TextView txtnamaProduk, txtnamaAgen, txtIDagen, txtIDproduk, txtTotalHarga, txtJumlah, txtKode, txtUser;
    private String id_agen_detail, id_produk_detail, kode_transaksi, userKonsumen, nama_produk_detail,
            nama_agen_detail, harga_produk_detail, jumlah_beli;
    private Button confirmBayar;
    private int totalHarga, intJumlah, intHarga;
    private String PREF_USERNAME;
    private ProgressDialog loadSimpan;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bayar);
        txtIDagen = findViewById(R.id.txt_id_agen_bayar);
        txtIDproduk = findViewById(R.id.txt_id_produk_bayar);
        txtnamaProduk = findViewById(R.id.nama_produk_bayar);
        txtnamaAgen = findViewById(R.id.nama_agen_bayar);
        txtTotalHarga = findViewById(R.id.total_harga);
        txtJumlah = findViewById(R.id.jumlah_beli);
        txtKode = findViewById(R.id.kode_transaksi_bayar_detail);
        txtUser = findViewById(R.id.username);
        confirmBayar = findViewById(R.id.btn_confirm_bayar);
        loadSimpan = new ProgressDialog(BayarActivity.this);

        confirmBayar.setOnClickListener(this);

        SharedPreferences sharedPreferences = BayarActivity.this.getSharedPreferences("KONSUMEN", Context.MODE_PRIVATE);
        PREF_USERNAME = sharedPreferences.getString(getString(R.string.PREF_USERNAME), "Hoe Keks!!");

        dataProfile(PREF_USERNAME);
        setData();
    }

    private void dataProfile(String pref_username) {
        StringRequest reqLogin = new StringRequest(Request.Method.POST, URL_PROFILE,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject jsonObject = new JSONObject(response);
                            String value = jsonObject.getString("value");
                            String pesan = jsonObject.getString("pesan");
                            JSONObject hasil = jsonObject.getJSONObject("hasil");
                            if (value.equals("1")) {
                                txtUser.setText(hasil.getString("id_user").trim());
                            } else {
                                Toast.makeText(BayarActivity.this, "Ora Metu Keks", Toast.LENGTH_SHORT).show();

                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(BayarActivity.this, "Hayok Ora Metu!", Toast.LENGTH_SHORT).show();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(BayarActivity.this, "Hayok Ora Metu!" + error.toString(), Toast.LENGTH_SHORT).show();
                    }
                })
        {
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("user_login", PREF_USERNAME);
                return params;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(BayarActivity.this);
        requestQueue.add(reqLogin);
    }

    private void setData() {
        Intent intent = getIntent();
        id_agen_detail = intent.getStringExtra("id_agen");
        id_produk_detail = intent.getStringExtra("id_produk");
        kode_transaksi = intent.getStringExtra("kode_transaksi");
        nama_agen_detail = intent.getStringExtra("nama_agen");
        nama_produk_detail = intent.getStringExtra("nama_produk");
        harga_produk_detail = intent.getStringExtra("harga_produk");
        jumlah_beli = intent.getStringExtra("jumlah");
        intJumlah = Integer.parseInt(jumlah_beli);
        intHarga = Integer.parseInt(harga_produk_detail);
        totalHarga = intJumlah * intHarga;
        txtIDagen.setText(id_agen_detail);
        txtIDproduk.setText(id_produk_detail);
        txtnamaProduk.setText(nama_produk_detail);
        txtnamaAgen.setText(nama_agen_detail);
        txtTotalHarga.setText("Rp. " + totalHarga);
        txtJumlah.setText(jumlah_beli+" Kg");
        txtKode.setText(kode_transaksi);

    }


    @Override
    public void onClick(View view) {
        simpanDataPenjualan();
        simpanDataPenjualanDetail();
    }



    private void simpanDataPenjualan() {
        /**memberikan informasi ketika loading*/
        loadSimpan.setMessage("Menyimpan Data");
        loadSimpan.setCancelable(false);
        loadSimpan.show();

        StringRequest sendData = new StringRequest(Request.Method.POST, ServerAPIKemanisan.URL_SAVEJUAL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        loadSimpan.cancel();
                        try {
                            JSONObject res = new JSONObject(response);
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

//                        startActivity( new Intent(BayarActivity.this,PaymentSuccsessActivity.class));
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        loadSimpan.cancel();
                        Toast.makeText(BayarActivity.this, "pesan : Gagal Insert Data (rb_penjualan)", Toast.LENGTH_SHORT).show();
                    }
                }){
            /**Menambahkan data sesuai dengan kolom yang ada di data base*/
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> map = new HashMap<>();
                map.put("kode_transaksi",txtKode.getText().toString());
                map.put("id_pembeli",txtUser.getText().toString());
                map.put("id_penjual",txtIDagen.getText().toString());

                return map;
            }
        };

        AppController.getInstance().addToRequestQueue(sendData);
    }

    private void simpanDataPenjualanDetail() {
        /**memberikan informasi ketika loading*/
        loadSimpan.setMessage("Menyimpan Data");
        loadSimpan.setCancelable(false);
        loadSimpan.show();

        StringRequest sendData = new StringRequest(Request.Method.POST, ServerAPIKemanisan.URL_SAVEJUALDETAIL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        loadSimpan.cancel();
                        try {
                            JSONObject res = new JSONObject(response);
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                        startActivity( new Intent(BayarActivity.this,PaymentSuccsessActivity.class));
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        loadSimpan.cancel();
                        Toast.makeText(BayarActivity.this, "pesan : Gagal Insert Data (rb_penjualan_detail)", Toast.LENGTH_SHORT).show();
                    }
                }){
            /**Menambahkan data sesuai dengan kolom yang ada di data base*/
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> map = new HashMap<>();
                map.put("id_produk",txtIDproduk.getText().toString());
                map.put("jumlah",jumlah_beli);
                map.put("harga_jual",harga_produk_detail);

                return map;
            }
        };

        AppController.getInstance().addToRequestQueue(sendData);
    }

}