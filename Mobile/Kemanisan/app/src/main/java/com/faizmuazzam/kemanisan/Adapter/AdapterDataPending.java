package com.faizmuazzam.kemanisan.Adapter;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.faizmuazzam.kemanisan.Model.ModelDataPending;
import com.faizmuazzam.kemanisan.R;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_KEMANISAN;
import static com.faizmuazzam.kemanisan.Util.ServerAPIKemanisan.URL_REGISTER;

public class AdapterDataPending extends RecyclerView.Adapter<AdapterDataPending.HolderDataPending>{
    private List<ModelDataPending> mItemsPending ;
    private Context contextPending;
    private CardView cardPending;

    public AdapterDataPending(List<ModelDataPending> mItemsPending, Context contextPending) {
        this.mItemsPending = mItemsPending;
        this.contextPending = contextPending;
    }

    @NonNull
    @Override
    public HolderDataPending onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View layoutPending = LayoutInflater.from(parent.getContext()).inflate(R.layout.card_pending,parent,false);
        AdapterDataPending.HolderDataPending holderDataPending = new AdapterDataPending.HolderDataPending(layoutPending);
        return holderDataPending;
    }

    @Override
    public void onBindViewHolder(@NonNull HolderDataPending holder, int position) {
        ModelDataPending mdPending  = mItemsPending.get(position);
        Locale localeID = new Locale("in", "ID");
        NumberFormat rupiah = NumberFormat.getCurrencyInstance(localeID);
        holder.tvNo_Transaksi_Pending.setText(mdPending.getNo_transaksi_pending());
        holder.tv_NamaAgen_Pending.setText(mdPending.getNama_agen_pending());
        holder.tv_NamaBarang_Pending.setText(mdPending.getNama_barang_pending());
        double harga = Double.parseDouble(mdPending.getTotal_harga_pending());
        holder.tv_Total_Harga_Pending.setText(rupiah.format(harga));
        int cekStatusDikirim = Integer.parseInt(mdPending.getStatus_pending());
        if (cekStatusDikirim == 0){
            String statusDikirim = "Pending";
            holder.tv_Status_Pending.setText(statusDikirim);
        }

        holder.mdPending = mdPending;

        cardPending.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String url = URL_KEMANISAN;
                Intent bukabrowser = new Intent(Intent.ACTION_VIEW);
                bukabrowser.setData(Uri. parse(url));
                contextPending.startActivity(bukabrowser);
            }
        });

    }

    @Override
    public int getItemCount() {
        return mItemsPending.size();
    }

    public class HolderDataPending extends RecyclerView.ViewHolder {
        public ModelDataPending mdPending;
        TextView tvNo_Transaksi_Pending, tv_NamaBarang_Pending, tv_NamaAgen_Pending, tv_Total_Harga_Pending, tv_Status_Pending;
        public HolderDataPending(View view) {
            super(view);
            tvNo_Transaksi_Pending = view.findViewById(R.id.no_Transaksi_Pending);
            tv_NamaBarang_Pending = view.findViewById(R.id.nama_produk_Pending);
            tv_NamaAgen_Pending = view.findViewById(R.id.Nama_Agen_Pending);
            tv_Total_Harga_Pending = view.findViewById(R.id.total_harga_Pending);
            tv_Status_Pending = view.findViewById(R.id.status_Pending);
            cardPending = view.findViewById(R.id.listPendingCard);

            /** Digunakan untuk menampung data untuk di bawa ke */
            view.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    String url = URL_REGISTER;
                    Intent bukabrowser = new Intent(Intent.ACTION_VIEW);
                    bukabrowser.setData(Uri. parse(url));
                    contextPending.startActivity(bukabrowser);
                }
            });
        }



    }
}
