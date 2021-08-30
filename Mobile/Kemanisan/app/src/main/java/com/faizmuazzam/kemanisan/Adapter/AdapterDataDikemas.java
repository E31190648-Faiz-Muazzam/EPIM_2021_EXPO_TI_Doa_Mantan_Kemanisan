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

import com.faizmuazzam.kemanisan.Model.ModelDataDikemas;
import com.faizmuazzam.kemanisan.R;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

public class AdapterDataDikemas extends RecyclerView.Adapter<AdapterDataDikemas.HolderDataDikemas>{

    private List<ModelDataDikemas> mItemsDikemas ;
    private Context contextDikemas;

    public AdapterDataDikemas(List<ModelDataDikemas> mItemsDikemas, Context contextDikemas) {
        this.mItemsDikemas = mItemsDikemas;
        this.contextDikemas = contextDikemas;
    }


    @NonNull
    @Override
    public AdapterDataDikemas.HolderDataDikemas onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View layoutDikemas = LayoutInflater.from(parent.getContext()).inflate(R.layout.card_dikemas,parent,false);
        AdapterDataDikemas.HolderDataDikemas holderDataDikemas = new AdapterDataDikemas.HolderDataDikemas(layoutDikemas);
        return holderDataDikemas;
    }

    @Override
    public void onBindViewHolder(@NonNull AdapterDataDikemas.HolderDataDikemas holder, int position) {
        ModelDataDikemas mdDikemas  = mItemsDikemas.get(position);
        Locale localeID = new Locale("in", "ID");
        NumberFormat rupiah = NumberFormat.getCurrencyInstance(localeID);
        holder.tvNo_Transaksi.setText(mdDikemas.getNo_transaksi_dikemas());
        holder.tv_NamaAgen.setText(mdDikemas.getNama_agen_dikemas());
        holder.tv_NamaBarang.setText(mdDikemas.getNama_barang_dikemas());
        double harga = Double.parseDouble(mdDikemas.getTotal_harga_dikemas());
        holder.tv_Total_Harga.setText(rupiah.format(harga));
        int cekStatusDikemas = Integer.parseInt(mdDikemas.getStatus_dikemas());
        if (cekStatusDikemas == 2){
            String statusDikemas = "Dikemas";
            holder.tv_Status_Dikemas.setText(statusDikemas);
        }

        holder.mdDikemas = mdDikemas;
    }

    @Override
    public int getItemCount() {
        return mItemsDikemas.size();
    }

    public class HolderDataDikemas extends RecyclerView.ViewHolder {
        TextView tvNo_Transaksi, tv_NamaBarang, tv_NamaAgen, tv_Total_Harga, tv_Status_Dikemas;
        ModelDataDikemas mdDikemas;
        public HolderDataDikemas(View view) {
            super(view);
            tvNo_Transaksi = view.findViewById(R.id.no_Transaksi_Dikemas);
            tv_NamaBarang = view.findViewById(R.id.nama_produk_dikemas);
            tv_NamaAgen = view.findViewById(R.id.Nama_Agen_Dikemas);
            tv_Total_Harga = view.findViewById(R.id.total_harga_dikemas);
            tv_Status_Dikemas = view.findViewById(R.id.status_dikemas);

//            /** Digunakan untuk menampung data untuk di bawa ke */
//            view.setOnClickListener(new View.OnClickListener() {
//                @Override
//                public void onClick(View view) {
//                    Intent update = new Intent(contextDikemas, NewsActivity.class);
//                    update.putExtra("update",1);
//                    update.putExtra("sub_judul",mdDikemas.getNo_transaksi_dikemas());
//                    update.putExtra("judul",mdDikemas.getNama_agen_dikemas());
//                    update.putExtra("isi_berita",mdDikemas.getNama_barang_dikemas());
//                    contextDikemas.startActivity(update);
//                }
//            });
        }

    }
}
