package com.example.init_app;

import android.app.Activity;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.android.billingclient.api.SkuDetails;
import com.example.init_app.utils.in_app.InAppUtil;
import com.google.gson.Gson;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterView;

public class InAppMetholCallHandler implements MethodChannel.MethodCallHandler, PurchasesUpdatedListener {
    private static final String TAG = "InAppMetholCallHandler";
    Activity activity;
    static EventChannel eventChannel;
    static EventChannel.EventSink eventSink;

    void initEventChannel(String channelName, FlutterView flutterEngine) {
        eventChannel = new EventChannel(flutterEngine.getDartExecutor(), channelName);
        eventChannel.setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                InAppMetholCallHandler.eventSink = events;
            }

            @Override
            public void onCancel(Object arguments) {
                InAppMetholCallHandler.eventSink = null;
            }
        });
    }

    public InAppMetholCallHandler(Activity activity) {
        this.activity = activity;
        InAppUtil.setPurchaseUpdatedListener((PurchasesUpdatedListener) this);
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

    private void buyInapp(String id, MethodChannel.Result result) {
        InAppUtil.buy(activity, id);
    }

    private void configInapp(List<String> list, MethodChannel.Result result) {
        InAppUtil.configPurchase(activity, new InAppUtil.ConnectSuccessListener() {
            @Override
            public void onSuccess() {
                List<String> skus = new ArrayList<>();
                for (Map.Entry<String, SkuDetails> entry : InAppUtil.mapSkus.entrySet()) {
                    skus.add(entry.getValue().getSku());
                }
                Log.e(TAG, "onSuccess: Gson().toJson(skus)" );
                try{
                    result.success(new Gson().toJson(skus));
                }catch (Exception e){
                    Log.e(TAG, "onSuccess: " + e.getMessage() );
                }
            }

            @Override
            public void disConnected() {
                result.error("", "", "");
            }
        }, list);
    }

    @Override
    public void onPurchasesUpdated(@NonNull BillingResult
                                           billingResult, @Nullable List<Purchase> list) {
        switch (billingResult.getResponseCode()) {
            case BillingClient.BillingResponseCode.OK: {
                Log.d(TAG, "onPurchasesUpdated: " + "OK");
                if (list != null) {
                    if (eventSink != null) {
                        for (Purchase item : list) {
//                            UNSPECIFIED_STATE
                            eventSink.success(new EventModel(item.getSku(),
                                    item.getPurchaseState() == Purchase.PurchaseState.PENDING
                                            ? "pending"
                                            : item.getPurchaseState() == Purchase.PurchaseState.PURCHASED
                                            ? "purchased" : "unspecified"));
                        }
                    }
                }
                break;
            }
            case BillingClient.BillingResponseCode.ITEM_UNAVAILABLE: {
                Log.e(TAG, "onPurchasesUpdated: ITEM_UNAVAILABLE");
                break;
            }
            case BillingClient.BillingResponseCode.ITEM_ALREADY_OWNED: {
//                Toast.makeText(this, "ITEM_ALREADY_OWNED", Toast.LENGTH_SHORT).show();
                break;
            }
            case BillingClient.BillingResponseCode.USER_CANCELED: {
//                Toast.makeText(this, "USER_CANCELED", Toast.LENGTH_SHORT).show();
                break;
            }

        }
    }

    public class EventModel {
        public EventModel(String sku, String status) {
            this.sku = sku;
            this.status = status;
        }

        @SerializedName("sku")
        @Expose
        private String sku;
        @SerializedName("status")
        @Expose
        private String status;

        public String getSku() {
            return sku;
        }

        public void setSku(String sku) {
            this.sku = sku;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

    }
}


