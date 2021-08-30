package com.faizmuazzam.kemanisan;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
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

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import android.net.Uri;


import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_LOGIN;
import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_REGISTER;

public class LoginActivity extends AppCompatActivity implements View.OnClickListener {
    private Button btnLogin;
    private EditText et_user, et_password;
    private ProgressBar loading;
    private TextView textDate, textDaftar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        btnLogin = findViewById(R.id.btn_login);
        et_user = findViewById(R.id.user_login);
        et_password = findViewById(R.id.password);
        loading = findViewById(R.id.loadLogin);
        textDate = findViewById(R.id.txtTanggal);
        textDaftar = findViewById(R.id.Daftar);

        Calendar date = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formatDate = format.format(date.getTime());

        textDate.setText(formatDate);

        btnLogin.setOnClickListener(this);
        textDaftar.setOnClickListener(this);

//        btnLogin.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent intent = new Intent(getApplicationContext(),MainActivity.class);
//                startActivity(intent);
//                finish();
//            }
//        });
    }

    @Override
    public void onClick(View view) {
        if (view == btnLogin) {
            String user_login = et_user.getText().toString().trim();
            String pass = et_password.getText().toString().trim();

            if (!user_login.isEmpty() && !pass.isEmpty()){
                Login(user_login, pass);
            }
            else{
                et_user.setError("Masukkan Username");
                et_password.setError("Masukkan email");
            }
        } else if (view == textDaftar) {
            Intent intent = new Intent(LoginActivity.this, RegisterActivity.class);
            startActivity(intent);
        }
    }

    private void Login(String user_login, String email) {
        loading.setVisibility(View.VISIBLE);
        btnLogin.setVisibility(View.GONE);

        StringRequest reqLogin = new StringRequest(Request.Method.POST, URL_LOGIN,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject jsonObject = new JSONObject(response);
                            String value = jsonObject.getString("value");
                            String user = jsonObject.getString("user");
                            String pesan = jsonObject.getString("pesan");
                            if (value.equals("1")) {

                                SharedPreferences sp = LoginActivity.this.getSharedPreferences("KONSUMEN", MODE_PRIVATE);
                                SharedPreferences.Editor editor = sp.edit();
                                editor.putString(getString(R.string.PREF_USERNAME), user);
                                editor.commit();

                                Toast.makeText(LoginActivity.this, "Login Berhasil", Toast.LENGTH_SHORT).show();

                                Intent intent = new Intent(LoginActivity.this, MainActivity.class);
                                startActivity(intent);

                                loading.setVisibility(View.GONE);
                                btnLogin.setVisibility(View.VISIBLE);
//
//                                finish();
                            } else {
                                Toast.makeText(LoginActivity.this, "Gagal Login", Toast.LENGTH_SHORT).show();
                                loading.setVisibility(View.GONE);
                                btnLogin.setVisibility(View.VISIBLE);
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(LoginActivity.this, "Hayok Login Error!", Toast.LENGTH_SHORT).show();
                            loading.setVisibility(View.GONE);
                            btnLogin.setVisibility(View.VISIBLE);
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(LoginActivity.this, "Hayok Login Error!" + error.toString(), Toast.LENGTH_SHORT).show();
                        loading.setVisibility(View.GONE);
                        btnLogin.setVisibility(View.VISIBLE);
                    }
                })
        {
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("user_login", user_login);
                params.put("pass", email);
                return params;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(reqLogin);
    }
}