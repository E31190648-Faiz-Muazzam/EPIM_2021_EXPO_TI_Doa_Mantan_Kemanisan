package com.faizmuazzam.kemanisan.Adapter;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.faizmuazzam.kemanisan.Model.ModelData;
import com.faizmuazzam.kemanisan.OrderActivity;
import com.faizmuazzam.kemanisan.R;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;


public class AdapterData extends RecyclerView.Adapter<AdapterData.HolderData> {
   /** Identifikasi Variabel yang akan di gunkan*/
    private List<ModelData> mItems ;
    private Context context;
    private CardView produk;
    /** Membuat kontruksi yang dimana fungsi ini akan di jalankan secara otomatis ketika class di panggil*/
    public AdapterData(Context context, List<ModelData> items)
    {
        this.mItems = items;
        this.context = context;
    }
    /** Menghubungkan class dengan layout yang di tuju*/
    @Override
    public HolderData onCreateViewHolder(ViewGroup parent, int viewType) {
        View layout = LayoutInflater.from(parent.getContext()).inflate(R.layout.card_product,parent,false);
        HolderData holderData = new HolderData(layout);
        return holderData;
    }

    /** Digunakan untuk menyimpan data yang berhasil di tangkap*/
    @Override
    public void onBindViewHolder(HolderData holder, int position) {
        ModelData md  = mItems.get(position);
        Locale localeID = new Locale("in", "ID");
        NumberFormat rupiah = NumberFormat.getCurrencyInstance(localeID);
        holder.tvidproduk.setText(md.getId_produk());
        holder.tvidagen.setText(md.getUser_agen());
        holder.tvnamaproduk.setText(md.getNama_produk());
        holder.tvalamatkantor.setText(md.getAlamat_kantor());
        holder.tvstok.setText(md.getStok());
        double harga = Double.parseDouble(md.getHarga());
        holder.tvharga.setText(rupiah.format(harga));
        holder.md = md;
    }

    @Override
    public int getItemCount() {
        return mItems.size();
    }

    class HolderData extends RecyclerView.ViewHolder
    {
        TextView tvnamaproduk,tvalamatkantor,tvstok, tvharga, tvidproduk, tvidagen;
        ModelData md;

        public  HolderData (View view)
        {
            super(view);
            produk = view.findViewById(R.id.produk);
            tvidproduk = view.findViewById(R.id.txt_id_produk_card);
            tvidagen = view.findViewById(R.id.txt_id_agen_card);
            tvnamaproduk = (TextView) view.findViewById(R.id.nama_produk);
            tvalamatkantor = (TextView) view.findViewById(R.id.alamat_kantor);
            tvstok = (TextView) view.findViewById(R.id.stok);
            tvharga = (TextView) view.findViewById(R.id.harga);

            /** Digunakan untuk menampung data untuk di bawa ke */
            view.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent update = new Intent(context, OrderActivity.class);
                    update.putExtra("update",1);
                    update.putExtra("id_produk",md.getId_produk());
                    update.putExtra("id_reseller",md.getUser_agen());
                    update.putExtra("nama_produk",md.getNama_produk());
                    update.putExtra("nama_reseller",md.getAlamat_kantor());
                    update.putExtra("no_telpon",md.getStok());
                    update.putExtra("harga_konsumen",md.getHarga());

                    context.startActivity(update);
                }
            });
        }
    }
}