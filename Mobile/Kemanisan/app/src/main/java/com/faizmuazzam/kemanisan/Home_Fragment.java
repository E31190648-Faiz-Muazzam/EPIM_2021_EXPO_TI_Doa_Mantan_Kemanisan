package com.faizmuazzam.kemanisan;

import android.app.ProgressDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import androidx.cardview.widget.CardView;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.faizmuazzam.kemanisan.Adapter.AdapterData;
import com.faizmuazzam.kemanisan.Adapter.AdapterDataBerita;
import com.faizmuazzam.kemanisan.Model.ModelData;
import com.faizmuazzam.kemanisan.Util.AppController;
import com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_HITUNGAGEN;
import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_REGISTER;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link Home_Fragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class Home_Fragment extends Fragment implements View.OnClickListener {

    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;
    private RecyclerView mRecyclerview, mViewBerita;
    private RecyclerView.Adapter mAdapter, mAdapterBerita;
    private RecyclerView.LayoutManager mManager, mManagerBerita;
    private ProgressDialog pd, pdBerita;
    private List<ModelData> mItems, mItemsBerita;
    private TextView txtJumlahAgen;
    private CardView daftarAgen;


    public Home_Fragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment Home_Fragment.
     */
    // TODO: Rename and change types and number of parameters
    public static Home_Fragment newInstance(String param1, String param2) {
        Home_Fragment fragment = new Home_Fragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootview;
        // Inflate the layout for this fragment
        rootview = inflater.inflate(R.layout.fragment_home_, container, false);

        txtJumlahAgen = rootview.findViewById(R.id.jumlahAgen);
        daftarAgen = rootview.findViewById(R.id.Daftar_Agen);
        hitungJumlahAgen();

        daftarAgen.setOnClickListener(this);

//        Produk
        mRecyclerview = (RecyclerView) rootview.findViewById(R.id.recyclerviewTemp);
        pd = new ProgressDialog(getActivity());
        mItems = new ArrayList<>();

        loadProduk();

        mManager = new LinearLayoutManager(getActivity(), LinearLayoutManager.HORIZONTAL,false);
        mRecyclerview.setLayoutManager(mManager);
        mRecyclerview.setItemAnimator(new DefaultItemAnimator());
        mAdapter = new AdapterData(getContext(), mItems);
        mRecyclerview.setAdapter(mAdapter);

//        Berita
        mViewBerita = (RecyclerView) rootview.findViewById(R.id.recyclerviewBerita);
        pdBerita = new ProgressDialog(getActivity());
        mItemsBerita = new ArrayList<>();

        loadBerita();

        mManagerBerita = new LinearLayoutManager(getActivity(), LinearLayoutManager.HORIZONTAL,false);
        mViewBerita.setLayoutManager(mManagerBerita);
        mViewBerita.setItemAnimator(new DefaultItemAnimator());
        mAdapterBerita = new AdapterDataBerita(getContext(), mItemsBerita);
        mViewBerita.setAdapter(mAdapterBerita);

        return rootview;
    }

    private void hitungJumlahAgen() {
        StringRequest reqKode = new StringRequest(Request.Method.POST, URL_HITUNGAGEN,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject jsonObject = new JSONObject(response);
                            String jumlahAgen = jsonObject.getString("jumlahAgen");
                            txtJumlahAgen.setText(jumlahAgen.trim() +" Tersedia");

                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(getContext(), "Hayok Ora Metu!", Toast.LENGTH_SHORT).show();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(getContext(), "Hayok Ora Metu!" + error.toString(), Toast.LENGTH_SHORT).show();
                    }
                });
        RequestQueue requestQueue = Volley.newRequestQueue(getContext());
        requestQueue.add(reqKode);
    }

    private void loadBerita() {
//        pdBerita.setMessage("Mengambil Data");
//        pdBerita.setCancelable(false);
//        pdBerita.show();

//        System.out.println("Mengambil Data");

        JsonArrayRequest reqDataBerita = new JsonArrayRequest(Request.Method.POST, ServerAPIKemanisan.URL_BERITA, null,
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        System.out.println("Length :" + response.length());
                        pd.cancel();
                        Log.d("volley", "response : " + response.toString());
                        for (int i = 0; i < response.length(); i++) {
                            try {
                                JSONObject data = response.getJSONObject(i);
                                ModelData mdBerita = new ModelData();
                                mdBerita.setSub_judul_berita(data.getString("sub_judul"));
                                mdBerita.setJudul_berita(data.getString("judul"));
                                mdBerita.setIsi_berita(data.getString("isi_berita"));
                                mItemsBerita.add(mdBerita);
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                        System.out.println("Length :" + response.length());
                        mAdapterBerita.notifyDataSetChanged();
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        pd.cancel();
                        Log.d("volley", "error : " + error.getMessage());
                    }
                });

        AppController.getInstance().addToRequestQueue(reqDataBerita);
    }

    private void loadProduk() {
        pd.setMessage("Mengambil Data");
        pd.setCancelable(false);
        pd.show();

//        System.out.println("Mengambil Data");

        JsonArrayRequest reqData = new JsonArrayRequest(Request.Method.POST, ServerAPIKemanisan.URL_DATA,null,
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        System.out.println("Length :"+response.length());
                        pd.cancel();
                        Log.d("volley","response : " + response.toString());
                        for(int i = 0 ; i < response.length(); i++)
                        {
                            try {
                                JSONObject data = response.getJSONObject(i);
                                ModelData md = new ModelData();
                                md.setId_produk(data.getString("id_produk"));
                                md.setUser_agen(data.getString("id_reseller"));
                                md.setNama_produk(data.getString("nama_produk"));
                                md.setAlamat_kantor(data.getString("nama_reseller"));
                                md.setStok(data.getString("no_telpon"));
                                md.setHarga(data.getString("harga_konsumen"));
                                mItems.add(md);
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                        System.out.println("Length :"+response.length());
                        mAdapter.notifyDataSetChanged();
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        pd.cancel();
                        Log.d("volley", "error : " + error.getMessage());
                    }
                });

        AppController.getInstance().addToRequestQueue(reqData);
    }

    @Override
    public void onClick(View view) {
        if (view == daftarAgen) {
            String url = URL_REGISTER;
            Intent bukabrowser = new Intent(Intent.ACTION_VIEW);
            bukabrowser.setData(Uri. parse(url));
            startActivity(bukabrowser);
        }
    }
}