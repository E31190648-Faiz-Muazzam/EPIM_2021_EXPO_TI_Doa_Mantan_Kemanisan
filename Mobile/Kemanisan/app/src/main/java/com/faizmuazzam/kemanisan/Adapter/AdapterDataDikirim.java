package com.faizmuazzam.kemanisan.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;


import com.faizmuazzam.kemanisan.Model.ModelDataDikirim;
import com.faizmuazzam.kemanisan.R;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

public class AdapterDataDikirim extends RecyclerView.Adapter<AdapterDataDikirim.HolderDataDikirim>{
    private List<ModelDataDikirim> mItemsDikirim ;
    private Context contextDikirim;

    public AdapterDataDikirim(List<ModelDataDikirim> mItemsDikirim, Context contextDikirim) {
        this.mItemsDikirim = mItemsDikirim;
        this.contextDikirim = contextDikirim;
    }


    @NonNull
    @Override
    public AdapterDataDikirim.HolderDataDikirim onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View layoutDikirim = LayoutInflater.from(parent.getContext()).inflate(R.layout.card_dikirim,parent,false);
        AdapterDataDikirim.HolderDataDikirim holderDataDikirim = new AdapterDataDikirim.HolderDataDikirim(layoutDikirim);
        return holderDataDikirim;
    }

    @Override
    public void onBindViewHolder(@NonNull AdapterDataDikirim.HolderDataDikirim holder, int position) {
        ModelDataDikirim mdDikirim  = mItemsDikirim.get(position);
        Locale localeID = new Locale("in", "ID");
        NumberFormat rupiah = NumberFormat.getCurrencyInstance(localeID);
        holder.tvNo_Transaksi_Dikirim.setText(mdDikirim.getNo_transaksi_dikirim());
        holder.tv_NamaAgen_Dikirim.setText(mdDikirim.getNama_agen_dikirim());
        holder.tv_NamaBarang_Dikirim.setText(mdDikirim.getNama_barang_dikirim());
        double harga = Double.parseDouble(mdDikirim.getTotal_harga_dikirim());
        holder.tv_Total_Harga_Dikirim.setText(rupiah.format(harga));
        int cekStatusDikirim = Integer.parseInt(mdDikirim.getStatus_dikirim());
        if (cekStatusDikirim == 1){
            String statusDikirim = "Dikirim";
            holder.tv_Status_Dikirim.setText(statusDikirim);
        }

        holder.mdDikirim = mdDikirim;
    }

    @Override
    public int getItemCount() {
        return mItemsDikirim.size();
    }

    public class HolderDataDikirim extends RecyclerView.ViewHolder {
        TextView tvNo_Transaksi_Dikirim, tv_NamaBarang_Dikirim, tv_NamaAgen_Dikirim, tv_Total_Harga_Dikirim, tv_Status_Dikirim;
        ModelDataDikirim mdDikirim;
        public HolderDataDikirim(View view) {
            super(view);
            tvNo_Transaksi_Dikirim = view.findViewById(R.id.no_Transaksi_Dikirim);
            tv_NamaBarang_Dikirim = view.findViewById(R.id.nama_produk_Dikirim);
            tv_NamaAgen_Dikirim = view.findViewById(R.id.Nama_Agen_Dikirim);
            tv_Total_Harga_Dikirim = view.findViewById(R.id.total_harga_Dikirim);
            tv_Status_Dikirim = view.findViewById(R.id.status_Dikirim);

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
