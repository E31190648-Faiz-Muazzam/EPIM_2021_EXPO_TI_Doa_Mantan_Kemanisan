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
import com.faizmuazzam.kemanisan.Adapter.AdapterDataPending;
import com.faizmuazzam.kemanisan.Model.ModelDataDikirim;
import com.faizmuazzam.kemanisan.Model.ModelDataPending;
import com.faizmuazzam.kemanisan.Util.AppController;
import com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PendingActivity extends AppCompatActivity {
    private RecyclerView mViewsPending;
    private RecyclerView.Adapter mAdapterPending;
    private RecyclerView.LayoutManager mManagerPending;
    private ProgressDialog pdPending;
    private List<ModelDataPending> mItemsPending;
    private Animation AnimDev;
    private LinearLayout ltDev;
    private String UserID_Pending;
    private Integer jumlah, harga, totalHarga;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pending);

        /*get data from intent*/
        Intent dataKirim = getIntent();
        UserID_Pending = dataKirim.getStringExtra("id_userPending");

        mViewsPending = findViewById(R.id.listPending);
        pdPending = new ProgressDialog(PendingActivity.this);
        mItemsPending = new ArrayList<>();

        loadPending();

        mManagerPending = new LinearLayoutManager(PendingActivity.this, LinearLayoutManager.VERTICAL,false);
        mViewsPending.setLayoutManager(mManagerPending);
        mViewsPending.setItemAnimator(new DefaultItemAnimator());
        mAdapterPending = new AdapterDataPending(mItemsPending, PendingActivity.this);
        mViewsPending.setAdapter(mAdapterPending);

    }

    private void loadPending() {
        StringRequest reqDataBerita = new StringRequest(Request.Method.POST, ServerAPIKemanisan.URL_PENDING,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject data = new JSONObject(response);
                            JSONObject jsonObject = new JSONObject(response);
                            String value = jsonObject.getString("value");
                            String pesan = jsonObject.getString("pesan");
                            JSONArray hasil = jsonObject.getJSONArray("hasil");

                            if (value.equals("1")) {
                                if (hasil == null) {
                                    Toast.makeText(PendingActivity.this, "Data Kosong", Toast.LENGTH_LONG).show();
                                } else {
                                    for (int i = 0; i < ((JSONArray) hasil).length(); i++) {
                                        JSONObject object = hasil.getJSONObject(i);
                                        ModelDataPending mdPending = new ModelDataPending();
                                        mdPending.setNo_transaksi_pending(object.getString("kode_transaksi"));
                                        mdPending.setNama_barang_pending(object.getString("nama_produk"));
                                        mdPending.setNama_agen_pending(object.getString("nama_reseller"));
                                        jumlah = Integer.parseInt(object.getString("jumlah"));
                                        harga = Integer.parseInt(object.getString("harga_jual"));
                                        totalHarga = jumlah * harga;
                                        mdPending.setTotal_harga_pending(totalHarga.toString());
                                        mdPending.setStatus_pending(object.getString("proses"));
                                        mItemsPending.add(mdPending);
                                    }
                                }
                            } else {
                                Toast.makeText(PendingActivity.this, pesan, Toast.LENGTH_LONG).show();
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        System.out.println("Length :" + response.length());
                        mAdapterPending.notifyDataSetChanged();
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        pdPending.cancel();
                        Log.d("volley", "error : " + error.getMessage());
                    }
                }) {
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("user", UserID_Pending);
                return params;
            }
        };
        AppController.getInstance().addToRequestQueue(reqDataBerita);
    }
}