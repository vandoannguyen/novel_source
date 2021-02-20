package com.example.init_app;

import android.content.Context;

import io.flutter.app.FlutterApplication;

public class MainApplicaiton extends FlutterApplication {
    static Context instance;

    @Override
    public void onCreate() {
        super.onCreate();
        this.instance = this;
    }

    public static Context getContext() {
        return instance;
    }
}
