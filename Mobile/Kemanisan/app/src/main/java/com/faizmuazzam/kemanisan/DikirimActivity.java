package com.faizmuazzam.kemanisan;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.animation.Animation;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.StringRequest;
import com.faizmuazzam.kemanisan.Adapter.AdapterDataDikirim;
import com.faizmuazzam.kemanisan.Model.ModelDataDikemas;
import com.faizmuazzam.kemanisan.Model.ModelDataDikirim;
import com.faizmuazzam.kemanisan.Util.AppController;
import com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DikirimActivity extends AppCompatActivity {
    private RecyclerView mViewsDikirim;
    private RecyclerView.Adapter mAdapterDikirim;
    private RecyclerView.LayoutManager mManagerDikirim;
    private ProgressDialog pdDikirim;
    private List<ModelDataDikirim> mItemsDikirim;
    private Animation AnimDev;
    private LinearLayout ltDev;
    private String UserIDKirim;
    private Integer jumlah, harga, totalHarga;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dikirim);

        /*get data from intent*/
        Intent dataKirim = getIntent();
        UserIDKirim = dataKirim.getStringExtra("id_userDikirim");

        mViewsDikirim = findViewById(R.id.listDikirim);
        pdDikirim = new ProgressDialog(DikirimActivity.this);
        mItemsDikirim = new ArrayList<>();

        loadDikirim();

        mManagerDikirim = new LinearLayoutManager(DikirimActivity.this, LinearLayoutManager.VERTICAL,false);
        mViewsDikirim.setLayoutManager(mManagerDikirim);
        mViewsDikirim.setItemAnimator(new DefaultItemAnimator());
        mAdapterDikirim = new AdapterDataDikirim(mItemsDikirim, DikirimActivity.this);
        mViewsDikirim.setAdapter(mAdapterDikirim);
    }

    private void loadDikirim() {
        StringRequest reqDataBerita = new StringRequest(Request.Method.POST, ServerAPIKemanisan.URL_DIKIRIM,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject data = new JSONObject(response);
                            JSONObject jsonObject = new JSONObject(response);
                            String value = jsonObject.getString("value");
                            String pesan = jsonObject.getString("pesan");
                            JSONArray hasil = jsonObject.getJSONArray("hasil");

                            if (value.equals("1")){
                                if(hasil==null){
                                    Toast.makeText(DikirimActivity.this, "Data Kosong", Toast.LENGTH_LONG).show();
                                }else {
                                    for (int i = 0; i < ((JSONArray) hasil).length(); i++) {
                                        JSONObject object = hasil.getJSONObject(i);
                                        ModelDataDikirim mdDikirim = new ModelDataDikirim();
                                        mdDikirim.setNo_transaksi_dikirim(object.getString("kode_transaksi"));
                                        mdDikirim.setNama_barang_dikirim(object.getString("nama_produk"));
                                        mdDikirim.setNama_agen_dikirim(object.getString("nama_reseller"));
                                        jumlah = Integer.parseInt(object.getString("jumlah"));
                                        harga = Integer.parseInt(object.getString("harga_jual"));
                                        totalHarga = jumlah*harga;
                                        mdDikirim.setTotal_harga_dikirim(totalHarga.toString());
                                        mdDikirim.setStatus_dikirim(object.getString("proses"));
                                        mItemsDikirim.add(mdDikirim);
                                    }
                                }
                            } else {
                                Toast.makeText(DikirimActivity.this, pesan, Toast.LENGTH_LONG).show();
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        System.out.println("Length :" + response.length());
                        mAdapterDikirim.notifyDataSetChanged();
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        pdDikirim.cancel();
                        Log.d("volley", "error : " + error.getMessage());
                    }
                })
        {
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("user", UserIDKirim);
                return params;
            }
        };
        AppController.getInstance().addToRequestQueue(reqDataBerita);
    }

}