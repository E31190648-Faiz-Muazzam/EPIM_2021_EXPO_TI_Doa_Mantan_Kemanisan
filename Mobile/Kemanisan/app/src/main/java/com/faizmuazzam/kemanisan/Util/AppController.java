package com.faizmuazzam.kemanisan.Util;

import android.app.Application;
import android.text.TextUtils;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.Volley;


public class AppController extends Application {
    private static final String TAG = com.faizmuazzam.kemanisan.Util.AppController.class.getSimpleName();
    private static com.faizmuazzam.kemanisan.Util.AppController instance  ;
    RequestQueue mRequestQueue;
    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
    }

    public static synchronized com.faizmuazzam.kemanisan.Util.AppController getInstance()
    {
        return instance;
    }

    private RequestQueue getRequestQueue()
    {
        if(mRequestQueue == null)
        {
            mRequestQueue = Volley.newRequestQueue(getApplicationContext());
        }

        return mRequestQueue;
    }

    public <T> void addToRequestQueue(Request<T> req, String tag)
    {
        req.setTag(TextUtils.isEmpty(tag) ? TAG : tag);
        getRequestQueue().add(req);
    }

    public <T> void addToRequestQueue (Request<T> req)
    {
        req.setTag(TAG);
        getRequestQueue().add(req);
    }

    public void cancelAllRequest(Object req)
    {
        if (mRequestQueue != null)
        {
            mRequestQueue.cancelAll(req);
        }
    }


}
