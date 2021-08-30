package com.faizmuazzam.kemanisan;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.Html;
import android.widget.TextView;

public class NewsActivity extends AppCompatActivity {
    TextView textjudulberita, textisiberita;
    String ubahHtml;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_news);
        /*get data from intent*/
        Intent data = getIntent();
        final int update = data.getIntExtra("update",0);
        String intent_detail_judul_berita = data.getStringExtra("judul");
        String intent_detail_isi_berita = data.getStringExtra("isi_berita");
        /*end get data from intent*/
        textjudulberita = findViewById(R.id.tampilan_judul);
        textisiberita = findViewById(R.id.tampilan_isi_berita);

        /**kondisi update / insert*/
        if(update == 1)
        {
//            btnsimpan.setText("Update Data");
            textjudulberita.setText(intent_detail_judul_berita);
//            username.setVisibility(View.GONE);
            ubahHtml = Html.fromHtml(intent_detail_isi_berita).toString();
            textisiberita.setText(ubahHtml);

        }

    }
}