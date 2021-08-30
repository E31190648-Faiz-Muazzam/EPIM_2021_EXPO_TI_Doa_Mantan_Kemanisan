package com.faizmuazzam.kemanisan;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;

import androidx.cardview.widget.CardView;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
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

import java.util.HashMap;
import java.util.Map;

import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_KEMANISAN;
import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_LOGIN;
import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_PROFILE;
import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_REGISTER;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link Profile_Fragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class Profile_Fragment extends Fragment implements View.OnClickListener {

    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;
    private TextView txtNamaUser, txtEmail;
    private String PREF_USERNAME, IdUser;
    private CardView goWeb, goDikemas, goDikirim, goPending;

    public Profile_Fragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment Profile_Fragment.
     */
    // TODO: Rename and change types and number of parameters
    public static Profile_Fragment newInstance(String param1, String param2) {
        Profile_Fragment fragment = new Profile_Fragment();
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
        // Inflate the layout for this fragment
        View view;
        view = inflater.inflate(R.layout.fragment_profile_, container, false);

//        Deklarasi Variabel
        txtNamaUser = view.findViewById(R.id.nama_user);
        txtEmail = view.findViewById(R.id.email_user);
        goWeb = view.findViewById(R.id.web_kemanisan);
        goDikemas = view.findViewById(R.id.btn_dikemas);
        goDikirim = view.findViewById(R.id.btn_dikirim);
        goPending = view.findViewById(R.id.btn_pending);

        goWeb.setOnClickListener(this);
        goDikemas.setOnClickListener(this);
        goDikirim.setOnClickListener(this);
        goPending.setOnClickListener(this);

        SharedPreferences sharedPreferences = getActivity().getSharedPreferences("KONSUMEN", Context.MODE_PRIVATE);
        PREF_USERNAME = sharedPreferences.getString(getString(R.string.PREF_USERNAME), "Hoe Keks!!");

        dataProfile(PREF_USERNAME);

        return view;
    }

    private void dataProfile(String PREF_USERNAME) {
        StringRequest reqProfil = new StringRequest(Request.Method.POST, URL_PROFILE,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject jsonObject = new JSONObject(response);
                            String value = jsonObject.getString("value");
                            String pesan = jsonObject.getString("pesan");
                            JSONObject hasil = jsonObject.getJSONObject("hasil");
                            if (value.equals("1")) {
                                txtNamaUser.setText(hasil.getString("nama_user").trim());
                                IdUser = hasil.getString("id_user").trim();
                            } else {
                                Toast.makeText(getActivity(), "Ora Metu Keks", Toast.LENGTH_SHORT).show();

                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(getActivity(), "Hayok Ora Metu!", Toast.LENGTH_SHORT).show();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(getActivity(), "Hayok Ora Metu!" + error.toString(), Toast.LENGTH_SHORT).show();
                    }
                })
        {
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("user_login", PREF_USERNAME);
                return params;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(getContext());
        requestQueue.add(reqProfil);
    }

    @Override
    public void onClick(View view) {
        if (view == goWeb){
            String url = URL_KEMANISAN;
            Intent bukabrowser = new Intent(Intent.ACTION_VIEW);
            bukabrowser.setData(Uri. parse(url));
            startActivity(bukabrowser);
        }

        if (view == goDikemas){
            Intent masukDikemas = new Intent(getActivity().getApplication(),DikemasActivity.class);
            masukDikemas.putExtra("id_user", IdUser);
            startActivity(masukDikemas);
        }

        if (view == goDikirim){
            Intent masukDikemas = new Intent(getActivity().getApplication(),DikirimActivity.class);
            masukDikemas.putExtra("id_userDikirim", IdUser);
            startActivity(masukDikemas);
        }

        if (view == goPending){
            Intent masukDikemas = new Intent(getActivity().getApplication(),PendingActivity.class);
            masukDikemas.putExtra("id_userPending", IdUser);
            startActivity(masukDikemas);
        }

    }
}