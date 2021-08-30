package com.faizmuazzam.kemanisan;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;
import androidx.fragment.app.Fragment;

import android.os.Bundle;
import android.widget.Toast;

import com.etebarian.meowbottomnavigation.MeowBottomNavigation;

public class MainActivity extends AppCompatActivity {
    //Inisialisasi Variabel
    MeowBottomNavigation bottomNavigation;
    String namaHalaman;
    private CardView btn_order;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //Masukkan Variabel
        bottomNavigation = findViewById(R.id.bottom_navigation);
        //btn_order = findViewById(R.id.order);


        //Menambahkan Menu Item
        bottomNavigation.add(new MeowBottomNavigation.Model(1,R.drawable.ic_person));
        bottomNavigation.add(new MeowBottomNavigation.Model(2,R.drawable.ic_home));
        bottomNavigation.add(new MeowBottomNavigation.Model(3,R.drawable.ic_info ));

        bottomNavigation.setOnShowListener(new MeowBottomNavigation.ShowListener() {
            @Override
            public void onShowItem(MeowBottomNavigation.Model item) {
                //Inisialisasi Fragment
                Fragment fragment = null;
                //Chect Kondisi
                switch (item.getId()){
                    case 1:
                        //Inisilisasi Notification Fragment
                        fragment = new Profile_Fragment();
                        namaHalaman = "Profile";
                        break;
                    case 2:
                       //Inisialisasi home fragment
                       fragment = new Home_Fragment();
                        namaHalaman = "Home";
                       break;
                    case 3:
                        //Inisialisasi home fragment
                        fragment = new News_Fragment();
                        namaHalaman = "News";
                        break;
                }
                //loadFragment
                loadFragment(fragment);
            }
        });

        //set notif count
//        bottomNavigation.setCount(3,"10");
        //set home fragment intially selected
        bottomNavigation.show(2,true);

        bottomNavigation.setOnClickMenuListener(new MeowBottomNavigation.ClickListener() {
            @Override
            public void onClickItem(MeowBottomNavigation.Model item) {
                //Display Toast
                Toast.makeText(getApplicationContext()
                        ,"Masuk Ke " + namaHalaman
                        ,Toast.LENGTH_SHORT).show();
            }
        });

        bottomNavigation.setOnReselectListener(new MeowBottomNavigation.ReselectListener() {
            @Override
            public void onReselectItem(MeowBottomNavigation.Model item) {
                //Display Toast
                Toast.makeText(getApplicationContext()
                        ,"Kemali ke " + namaHalaman
                        ,Toast.LENGTH_SHORT).show();
            }
        });

    }

    private void loadFragment(Fragment fragment) {
        //Replace Fragment
        getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.frame_layout,fragment)
                .commit();
    }


}