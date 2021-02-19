package com.example.init_app;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import com.example.init_app.utils.InShotAppUtils;
import com.oneadx.android.ratedialog.RatingDialog;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import com.example.init_app.utils.SharedPrefsUtils;

public class MainActivity extends FlutterActivity implements RatingDialog.RatingDialogInterFace {
    private static final String CHANNEL = "com.example.init_app";
    private static final String ONEADX_KEY="gmBUYwLTV2VDu5Y8Dg5S9WpuaNDZvRaZ";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                switch (methodCall.method) {
                    case "rateManual": {
                        rateManual();
                        break;
                    }
                    case "rateAuto": {
                        rateAuto();
                        break;
                    }
                    case "sendMess": {
                        Intent sendIntent = new Intent();
                        sendIntent.setAction(Intent.ACTION_SEND);
                        sendIntent.putExtra(Intent.EXTRA_TEXT, "This is my text to send.");
                        sendIntent.setType("text/plain");
                        startActivity(sendIntent);
                        break;
                    }
                    case "encrypt": {
                        String data = methodCall.argument("data");
                        try {
                            result.success(InShotAppUtils.encrypt(data));
                        } catch (NoSuchAlgorithmException e) {
                            e.printStackTrace();
                            result.error(e.toString(), null, null);
                        } catch (UnsupportedEncodingException e) {
                            result.error(e.toString(), null, null);
                            e.printStackTrace();
                        }
                        break;
                    }
                    case "decrpyt":{
                        String data = methodCall.argument("data");
                        Log.e("TAG", "onMethodCall: "+ data);
                        try {
                            String s =InShotAppUtils.decodeBase64(data);
                            Log.e("TAG", "onMethodCall: " + s );
                            result.success(s);
                        } catch (Exception e) {
                            Log.e("TAG", "onMethodCall: "+ e);
                            result.error(e.toString(), null, null);
                            e.printStackTrace();
                        }
                        break;
                    }
                }
            }
        });

    }

    public static void rateApp(Context context) {
        Intent intent = new Intent(new Intent(Intent.ACTION_VIEW,
                Uri.parse("http://play.google.com/store/apps/details?id=" + context.getPackageName())));
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    //Rate
    private void rateAuto() {
//        SharePre
        int rate = SharedPrefsUtils.getInstance(this).getInt("rate");
        if (rate < 1) {
            RatingDialog ratingDialog = new RatingDialog(this);
            ratingDialog.setRatingDialogListener(this);
            ratingDialog.showDialog();
        }
    }

    private void rateManual() {
        RatingDialog ratingDialog = new RatingDialog(this);
        ratingDialog.setRatingDialogListener(this);
        ratingDialog.showDialog();
    }

    @Override
    public void onDismiss() {

    }

    @Override
    public void onSubmit(float rating) {
        if (rating > 3) {
            rateApp(this);
        }
    }

    @Override
    public void onRatingChanged(float rating) {
    }
}
