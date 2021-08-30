package com.faizmuazzam.kemanisan;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_KODE;
import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_PROFILE;
import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_STOK;

public class OrderActivity extends AppCompatActivity implements View.OnClickListener {
    TextView detail_produk,detail_agen,detail_harga,no_telp_detail,txt_produk,txt_agen,txt_stok, txtkode;
    Button btnBayar;
    ProgressDialog pd;
    EditText inputStok;
    private String id_agen, id_produk, id_agen_detail, id_produk_detail, kode_transaksi_detail, id_user, nama_produk_detail,
            nama_reseller_detail, harga_produk_detail, stokdetail, jumlah_beli;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order);
        /*get data from intent*/
        Intent data = getIntent();

        final int update = data.getIntExtra("update",0);
        String intent_detail_id_produk = data.getStringExtra("id_produk");
        String intent_detail_id_agen = data.getStringExtra("id_reseller");
        String intent_detail_produk = data.getStringExtra("nama_produk");
        String intent_detail_agen = data.getStringExtra("nama_reseller");
        String intent_detail_harga = data.getStringExtra("harga_konsumen");
        String intent_no_telp_detail = data.getStringExtra("no_telpon");
        /*end get data from intent*/

        txt_produk = findViewById(R.id.txt_id_produk);
        txt_agen = findViewById(R.id.txt_id_agen);
        detail_produk = findViewById(R.id.produk_detail);
        detail_agen = findViewById(R.id.agen_detail);
        detail_harga = findViewById(R.id.harga_detail);
        no_telp_detail = findViewById(R.id.no_telp_detail);
        txt_stok = findViewById(R.id.etStok);
        btnBayar = findViewById(R.id.btn_pembayaran);
        txtkode = findViewById(R.id.kode_transaksi);
        inputStok = findViewById(R.id.input_stok);

        /**kondisi update / insert*/
        if(update == 1)
        {
//            btnsimpan.setText("Update Data");
            detail_produk.setText(intent_detail_produk);
//            username.setVisibility(View.GONE);
            detail_agen.setText(intent_detail_agen);
            detail_harga.setText(intent_detail_harga);
            no_telp_detail.setText(intent_no_telp_detail);
            txt_produk.setText(intent_detail_id_produk);
            txt_agen.setText(intent_detail_id_agen);
            id_agen = intent_detail_id_agen;
            id_produk = intent_detail_id_produk;
            tampilstok(id_agen, id_produk);
            kode_trans();

        }

        btnBayar.setOnClickListener(this);
    }

    private void kode_trans() {
        StringRequest reqKode = new StringRequest(Request.Method.POST, URL_KODE,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject jsonObject = new JSONObject(response);
                            String auto_kode_trasaksi = jsonObject.getString("kode");
                            txtkode.setText(auto_kode_trasaksi.trim());

                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(OrderActivity.this, "Hayok Ora Metu!", Toast.LENGTH_SHORT).show();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(OrderActivity.this, "Hayok Ora Metu!" + error.toString(), Toast.LENGTH_SHORT).show();
                    }
                });
        RequestQueue requestQueue = Volley.newRequestQueue(OrderActivity.this);
        requestQueue.add(reqKode);

    }

    @Override
    public void onClick(View view) {
        if (view == btnBayar) {

            id_agen_detail = id_agen;
            id_produk_detail = id_produk;
            nama_produk_detail = detail_produk.getText().toString();
            nama_reseller_detail = detail_agen.getText().toString();
            harga_produk_detail = detail_harga.getText().toString();
            jumlah_beli = inputStok.getText().toString();
            kode_transaksi_detail = txtkode.getText().toString();
            if(!jumlah_beli.isEmpty()){
                Intent intent = new Intent(OrderActivity.this, BayarActivity.class);
                intent.putExtra("id_produk", id_produk_detail);
                intent.putExtra("id_agen", id_agen_detail);
                intent.putExtra("nama_produk", nama_produk_detail);
                intent.putExtra("nama_agen", nama_reseller_detail);
                intent.putExtra("harga_produk", harga_produk_detail);
                intent.putExtra("jumlah", jumlah_beli);
                intent.putExtra("kode_transaksi", kode_transaksi_detail);
                startActivity(intent);
            }else {
                inputStok.setError( "Masukkan Jumlah Pembelian" );
            }





        }
    }


    private void tampilstok(String id_agen, String id_produk) {
        StringRequest reqLogin = new StringRequest(Request.Method.POST, URL_STOK,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject jsonObject = new JSONObject(response);
                            String stok = jsonObject.getString("stok");
                            txt_stok.setText(stok.trim());

                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(OrderActivity.this, "Hayok Ora Metu!", Toast.LENGTH_SHORT).show();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(OrderActivity.this, "Hayok Ora Metu!" + error.toString(), Toast.LENGTH_SHORT).show();
                    }
                })
        {
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("id_agen", id_agen);
                params.put("id_produk", id_produk);
                return params;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(OrderActivity.this);
        requestQueue.add(reqLogin);
    }

}