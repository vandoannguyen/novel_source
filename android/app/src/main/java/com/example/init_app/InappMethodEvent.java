package com.example.init_app;

import android.app.Activity;

import androidx.annotation.NonNull;

import com.example.init_app.utils.in_app.InAppUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.List;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class InappMethodEvent {
    public static EventChannel.EventSink emitter;

    public static class InAppMetholCallHandler implements MethodChannel.MethodCallHandler {
        Activity activity;

        public InAppMetholCallHandler(Activity activity) {
            this.activity = activity;
        }

        @Override
        public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
            switch (call.method) {
                case "initInapp": {
                    List<String> list = new Gson().fromJson(call.argument("data").toString(), new TypeToken<List<String>>() {
                    }.getType());
                    configInapp(list, result);
                    break;
                }
                case "buyInapp": {
                    buyInapp(call.argument("id"), result);
                    break;
                }
            }
        }

        private void buyInapp(Object id, MethodChannel.Result result) {

        }

        private void configInapp(List<String> list, MethodChannel.Result result) {
            InAppUtil.configPurchase(activity, new InAppUtil.ConnectSuccessListener() {
                @Override
                public void onSuccess() {
                    result.success("");
                }

                @Override
                public void disConnected() {
                    result.error("", "", "");
                }
            }, list);
        }
    }

}
