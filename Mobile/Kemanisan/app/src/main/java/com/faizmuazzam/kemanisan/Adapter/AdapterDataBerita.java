package com.faizmuazzam.kemanisan.Adapter;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.faizmuazzam.kemanisan.MainActivity;
import com.faizmuazzam.kemanisan.Model.ModelData;
import com.faizmuazzam.kemanisan.NewsActivity;
import com.faizmuazzam.kemanisan.R;

import java.util.List;

public class AdapterDataBerita extends RecyclerView.Adapter<AdapterDataBerita.HolderDataBerita>{
    /** Identifikasi Variabel yang akan di gunkan*/
    private List<ModelData> mItemsBerita ;
    private Context contextBerita;
    private CardView produk;
    /** Membuat kontruksi yang dimana fungsi ini akan di jalankan secara otomatis ketika class di panggil*/
    public AdapterDataBerita(Context context, List<ModelData> items)
    {
        this.mItemsBerita = items;
        this.contextBerita = context;
    }
    /** Menghubungkan class dengan layout yang di tuju*/
    @Override
    public HolderDataBerita onCreateViewHolder(ViewGroup parent, int viewType) {
        View layoutBerita = LayoutInflater.from(parent.getContext()).inflate(R.layout.card_berita,parent,false);
        HolderDataBerita holderDataBerita = new HolderDataBerita(layoutBerita);
        return holderDataBerita;
    }


    @Override
    /** Digunakan untuk menyimpan data yang berhasil di tangkap*/
    public void onBindViewHolder(AdapterDataBerita.HolderDataBerita holder, int position) {
        ModelData mdBerita  = mItemsBerita.get(position);
        holder.tvberita.setText(mdBerita.getJudul_berita());
        holder.tvsub_judul.setText(mdBerita.getSub_judul_berita());
        holder.tvisi_berita.setText(mdBerita.getIsi_berita());
        holder.mdBerita = mdBerita;
    }

    @Override
    public int getItemCount() {
        return mItemsBerita.size();
    }

    class HolderDataBerita extends RecyclerView.ViewHolder
    {
        TextView tvsub_judul, tvberita, tvisi_berita;
        ModelData mdBerita;

        public  HolderDataBerita (View view)
        {
            super(view);
            produk = view.findViewById(R.id.produk);
            tvsub_judul = view.findViewById(R.id.sub_judul);
            tvberita = view.findViewById(R.id.judul_berita);
            tvisi_berita = view.findViewById(R.id.isi_berita);

            /** Digunakan untuk menampung data untuk di bawa ke */
            view.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent update = new Intent(contextBerita, NewsActivity.class);
                    update.putExtra("update",1);
                    update.putExtra("sub_judul",mdBerita.getSub_judul_berita());
                    update.putExtra("judul",mdBerita.getJudul_berita());
                    update.putExtra("isi_berita",mdBerita.getIsi_berita());
                    contextBerita.startActivity(update);
                }
            });
        }
    }
}
