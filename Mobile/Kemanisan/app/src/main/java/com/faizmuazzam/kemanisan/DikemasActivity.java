package com.faizmuazzam.kemanisan;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.animation.Animation;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.faizmuazzam.kemanisan.Adapter.AdapterDataDikemas;
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

import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_PROFILE;

public class DikemasActivity extends AppCompatActivity {

    private RecyclerView mViewsDikemas;
    private RecyclerView.Adapter mAdapterDikemas;
    private RecyclerView.LayoutManager mManagerDikemas;
    private ProgressDialog pdDikemas;
    private TextView txtUser;
    private List<ModelDataDikemas> mItemsDikemas;
    private String PREF_USERNAME, UserID;
    private Animation AnimDev;
    private LinearLayout ltDev;
    private Integer jumlah, harga, totalHarga;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dikemas);

        /*get data from intent*/
        Intent data = getIntent();
        UserID = data.getStringExtra("id_user");





        mViewsDikemas = findViewById(R.id.listDikemas);
        pdDikemas = new ProgressDialog(DikemasActivity.this);
        mItemsDikemas = new ArrayList<>();

        loadDikemas();


        mManagerDikemas = new LinearLayoutManager(DikemasActivity.this, LinearLayoutManager.VERTICAL,false);
        mViewsDikemas.setLayoutManager(mManagerDikemas);
        mViewsDikemas.setItemAnimator(new DefaultItemAnimator());
        mAdapterDikemas = new AdapterDataDikemas(mItemsDikemas, DikemasActivity.this);
        mViewsDikemas.setAdapter(mAdapterDikemas);
    }


    private void loadDikemas() {
        StringRequest reqDataBerita = new StringRequest(Request.Method.POST, ServerAPIKemanisan.URL_DIKEMAS,
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
                                        Toast.makeText(DikemasActivity.this, "Data Kosong", Toast.LENGTH_LONG).show();
                                    }else {
                                        for (int i = 0; i < ((JSONArray) hasil).length(); i++) {
                                            JSONObject object = hasil.getJSONObject(i);
                                            ModelDataDikemas mdDikemas = new ModelDataDikemas();
                                            mdDikemas.setNo_transaksi_dikemas(object.getString("kode_transaksi"));
                                            mdDikemas.setNama_barang_dikemas(object.getString("nama_produk"));
                                            mdDikemas.setNama_agen_dikemas(object.getString("nama_reseller"));
                                            jumlah = Integer.parseInt(object.getString("jumlah"));
                                            harga = Integer.parseInt(object.getString("harga_jual"));
                                            totalHarga = jumlah*harga;
                                            mdDikemas.setTotal_harga_dikemas(totalHarga.toString());
                                            mdDikemas.setStatus_dikemas(object.getString("proses"));
                                            mItemsDikemas.add(mdDikemas);
                                        }
                                    }
                                } else {
                                    Toast.makeText(DikemasActivity.this, pesan, Toast.LENGTH_LONG).show();
                                }
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        System.out.println("Length :" + response.length());
                        mAdapterDikemas.notifyDataSetChanged();
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        pdDikemas.cancel();
                        Log.d("volley", "error : " + error.getMessage());
                    }
                })
        {
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("user", UserID);
                return params;
            }
        };

        AppController.getInstance().addToRequestQueue(reqDataBerita);
    }
}