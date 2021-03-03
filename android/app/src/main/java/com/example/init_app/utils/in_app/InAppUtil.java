package com.example.init_app.utils.in_app;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import androidx.annotation.Nullable;

import com.android.billingclient.api.AcknowledgePurchaseParams;
import com.android.billingclient.api.AcknowledgePurchaseResponseListener;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingFlowParams;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.ConsumeParams;
import com.android.billingclient.api.ConsumeResponseListener;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.android.billingclient.api.SkuDetails;
import com.android.billingclient.api.SkuDetailsParams;
import com.android.billingclient.api.SkuDetailsResponseListener;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;


public class InAppUtil {

    private static final String TAG = "InAppUtil";
    public static BillingClient billingClient, billingClientBuy, billingClientBuyOneTime;
    public static List<String> skusList;
    public static HashMap<String, SkuDetails> mapSkus;
    public static String product_id = "purchase_video";
    public static String bill_per_year = "id_purchase_magic_year";
    private static PurchasesUpdatedListener listener;
    private static int count = 0;
    public static boolean isRegisted = false;
    private static ConnectSuccessListener connectSuccessListener;
    private static boolean isBillingClientSuccess = false;
    private static boolean isBillingClientBuyOneTimeSuccess = false;
    private static boolean isBillingClientBuySuccess = false;

    public static void configPurchase(final Context context, ConnectSuccessListener connectSuccessListener, List<String> sku) {
        InAppUtil.connectSuccessListener = connectSuccessListener;
        skusList = sku;
        mapSkus = new HashMap<>();
        Log.d(TAG, "configPurchase: " + sku);
        if (!isBillingClientSuccess || !isBillingClientBuyOneTimeSuccess || !isBillingClientBuySuccess) {
            isBillingClientBuyOneTimeSuccess=false;
            isBillingClientSuccess = false;
            isBillingClientBuySuccess = false;
            configBillingClient(context, sku);
            configBillingClientOneTime(context, sku);
            configBillingClientBuy(context, sku);
        }
        else{
            callSuccess();
        }
    }

    /**
     * @param context
     * @param sku     dùng cho inapp mua nhiều lần
     */
    private static void configBillingClientBuy(Context context, List<String> sku) {
        billingClientBuy = BillingClient.newBuilder(context).enablePendingPurchases().setListener(new PurchasesUpdatedListener() {
            @Override
            public void onPurchasesUpdated(BillingResult billingResult, @Nullable List<Purchase> list) {
                Log.e(TAG, "onPurchasesUpdated: 1");
                if (listener != null) {
                    listener.onPurchasesUpdated(billingResult, list);
                }
                if (list != null)
                    for (Purchase purchase : list) {
                        Log.e(TAG, "onPurchasesUpdated: " + purchase.getPurchaseToken());
                        if (!verifyValidSignature(purchase.getOriginalJson(), purchase.getSignature())) {
                            Log.i(TAG, "Got a purchase: " + purchase + "; but signature is bad. Skipping...");
                            return;
                        }
                        handlePurchaseBuy(purchase);
                    }
            }
        }).build();
        billingClientBuy.startConnection(new BillingClientStateListener() {
            @Override
            public void onBillingSetupFinished(BillingResult billingResult) {
                if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                    if (billingClient.isReady()) {
                        loadAllSkulBuy(context);
                        Log.e(TAG, "onBillingSetupFinishedbillingClientBuy: ");
                        Purchase.PurchasesResult result =
                                billingClient.queryPurchases(BillingClient.SkuType.INAPP);
                        isBillingClientBuySuccess = true;
                        callSuccess();
//                        if (result.getPurchasesList().size() > 0) {
//                            isRegisted = true;
//                        }
                    }
                }
            }

            @Override
            public void onBillingServiceDisconnected() {
                connectSuccessListener.disConnected();
            }
        });
    }

    /**
     * @param context
     * @param sku     dùng cho inapp mua 1 lần
     */
    private static void configBillingClientOneTime(Context context, List<String> sku) {
        billingClientBuyOneTime = BillingClient.newBuilder(context).enablePendingPurchases().setListener(new PurchasesUpdatedListener() {
            @Override
            public void onPurchasesUpdated(BillingResult billingResult, @Nullable List<Purchase> list) {
                Log.e(TAG, "onPurchasesUpdated: 1");
                if (listener != null) {
                    listener.onPurchasesUpdated(billingResult, list);
                }
                if (list != null)
                    for (Purchase purchase : list) {
                        Log.e(TAG, "onPurchasesUpdated: " + purchase.getPurchaseToken());
                        if (!verifyValidSignature(purchase.getOriginalJson(), purchase.getSignature())) {
                            Log.i(TAG, "Got a purchase: " + purchase + "; but signature is bad. Skipping...");
                            return;
                        }
                        handlePurchaseBuyOneTime(purchase);
                    }
            }
        }).build();
        billingClientBuyOneTime.startConnection(new BillingClientStateListener() {
            @Override
            public void onBillingSetupFinished(BillingResult billingResult) {
                if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                    if (billingClient.isReady()) {
                        loadAllSkulBuyOneTime(context);
                        Log.e(TAG, "onBillingSetupFinished billingClientBuyOneTime: ");
                        Purchase.PurchasesResult result =
                                billingClient.queryPurchases(BillingClient.SkuType.INAPP);
                        isBillingClientBuyOneTimeSuccess = true;
                        callSuccess();
                        if (result.getPurchasesList().size() > 0) {
                            isRegisted = true;
                        }
                    }
                }
            }

            @Override
            public void onBillingServiceDisconnected() {
                connectSuccessListener.disConnected();
            }
        });
    }

    /**
     * @param context
     * @param sku     dùng cho inapp subscription
     */

    private static void configBillingClient(Context context, List<String> sku) {
        billingClient = BillingClient.newBuilder(context).enablePendingPurchases().setListener(new PurchasesUpdatedListener() {
            @Override
            public void onPurchasesUpdated(BillingResult billingResult, @Nullable List<Purchase> list) {
                Log.e(TAG, "onPurchasesUpdated: 1");
                if (listener != null) {
                    listener.onPurchasesUpdated(billingResult, list);
                }
                if (list != null)
                    for (Purchase purchase : list) {
                        Log.e(TAG, "onPurchasesUpdated: " + purchase.getPurchaseToken());
                        if (!verifyValidSignature(purchase.getOriginalJson(), purchase.getSignature())) {
                            Log.i(TAG, "Got a purchase: " + purchase + "; but signature is bad. Skipping...");
                            return;
                        }
                        handlePurchase(purchase);
                    }
//                switch (billingResult.getResponseCode()) {
//                    case BillingClient.BillingResponseCode.OK: {
////                Toast.makeText(this, "OK", Toast.LENGTH_SHORT).show();
//                        Log.d(TAG, "onPurchasesUpdated: " + "OK");
//                        if (list != null) {
//                            if (list != null)
//                                for (Purchase purchase : list) {
//                                    // When every a new purchase is made
//                                    // Here we verify our purchase
////                            Log.e(TAG, "onPurchasesUpdated: " + purchase.getPurchaseToken());
//                                    if (!verifyValidSignature(purchase.getOriginalJson(), purchase.getSignature())) {
//                                        // Invalid purchase
//                                        // show error to user
//                                        Log.e(TAG, "Got a purchase: " + purchase + "; but signature is bad. Skipping...");
//                                        return;
//                                    } else {
//
//                                    }
//                                    handlePurchase(purchase);
//                                }
//                        }
//                        break;
//                    }
//                    case BillingClient.BillingResponseCode.ITEM_ALREADY_OWNED: {
////                Toast.makeText(this, "ITEM_ALREADY_OWNED", Toast.LENGTH_SHORT).show();
//                        break;
//                    }
//                    case BillingClient.BillingResponseCode.USER_CANCELED: {
////                Toast.makeText(this, "USER_CANCELED", Toast.LENGTH_SHORT).show();
//                        break;
//                    }
//
            }
        }).build();
        billingClient.startConnection(new BillingClientStateListener() {
            @Override
            public void onBillingSetupFinished(BillingResult billingResult) {
                if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                    if (billingClient.isReady()) {
                        loadAllSkul(context);
                        Log.e(TAG, "onBillingSetupFinished billingClient: ");
                        Purchase.PurchasesResult result =
                                billingClient.queryPurchases(BillingClient.SkuType.SUBS);
                        isBillingClientSuccess = true;
                        callSuccess();
                        if (result.getPurchasesList().size() > 0) {
                            isRegisted = true;
                        }
                    }
                }
            }

            @Override
            public void onBillingServiceDisconnected() {
                connectSuccessListener.disConnected();
            }
        });
    }

    private static void callSuccess() {
        if (isBillingClientSuccess
                && isBillingClientBuySuccess
                && isBillingClientBuyOneTimeSuccess
                && connectSuccessListener != null) {
            Log.e(TAG, "callSuccess: ");
            connectSuccessListener.onSuccess();
        }
    }

    private static void handlePurchaseBuy(Purchase purchase) {
        ConsumeParams consumeParams =
                ConsumeParams.newBuilder()
                        .setPurchaseToken(purchase.getPurchaseToken())
                        .build();
        billingClientBuy.consumeAsync(consumeParams, new ConsumeResponseListener() {
            @Override
            public void onConsumeResponse(BillingResult billingResult, String purchaseToken) {
                if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                    Log.e(TAG, "onConsumeResponse: " + "consumeAsync");
                }
            }
        });
    }

    public static void setPurchaseUpdatedListener(PurchasesUpdatedListener l) {
        listener = l;
    }

    private static void loadAllSkul(Context context) {
        if (billingClient.isReady()) {
            Log.e(TAG, "loadAllSkul: " + skusList);
            SkuDetailsParams params = SkuDetailsParams.newBuilder().setSkusList(skusList).setType(BillingClient.SkuType.SUBS).build();
            billingClient.querySkuDetailsAsync(params, new SkuDetailsResponseListener() {
                @Override
                public void onSkuDetailsResponse(BillingResult billingResult, List<SkuDetails> list) {
                    if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK)
                        for (SkuDetails sku : list) {
                            mapSkus.put(sku.getSku(), sku);
                        }
                    Log.e(TAG, "onSkuDetailsResponse: " + list.size());
                }
            });
        }
    }

    private static void loadAllSkulBuy(Context context) {
        if (billingClientBuy.isReady()) {
            Log.e(TAG, "loadAllSkul: " + skusList);
            SkuDetailsParams params = SkuDetailsParams.newBuilder().setSkusList(skusList).setType(BillingClient.SkuType.INAPP).build();
            billingClientBuy.querySkuDetailsAsync(params, new SkuDetailsResponseListener() {
                @Override
                public void onSkuDetailsResponse(BillingResult billingResult, List<SkuDetails> list) {
                    if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK)
                        for (SkuDetails sku : list) {
                            mapSkus.put(sku.getSku(), sku);
                        }
                    Log.e(TAG, "onSkuDetailsResponse: " + list.size());
                }
            });
        }
    }

    private static void loadAllSkulBuyOneTime(Context context) {
        if (billingClientBuyOneTime.isReady()) {
            Log.e(TAG, "loadAllSkul: " + skusList);
            SkuDetailsParams params = SkuDetailsParams.newBuilder().setSkusList(skusList).setType(BillingClient.SkuType.INAPP).build();
            billingClientBuyOneTime.querySkuDetailsAsync(params, new SkuDetailsResponseListener() {
                @Override
                public void onSkuDetailsResponse(BillingResult billingResult, List<SkuDetails> list) {
                    if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK)
                        for (SkuDetails sku : list) {
                            mapSkus.put(sku.getSku(), sku);
                        }
                    Log.e(TAG, "onSkuDetailsResponse: " + list.size());
                }
            });
        }
    }

    private static void handlePurchase(Purchase purchase) {
        AcknowledgePurchaseParams params = AcknowledgePurchaseParams.newBuilder()
                .setPurchaseToken(purchase.getPurchaseToken())
                .build();
        billingClient.acknowledgePurchase(params, new AcknowledgePurchaseResponseListener() {
            @Override
            public void onAcknowledgePurchaseResponse(BillingResult billingResult) {
                if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                    Log.e(TAG, "onAcknowledgePurchaseResponse: handlePurchase" + billingResult.getDebugMessage() + "   " + billingResult.getResponseCode());
                }
            }
        });

    }

    private static void handlePurchaseBuyOneTime(Purchase purchase) {
        AcknowledgePurchaseParams params = AcknowledgePurchaseParams.newBuilder()
                .setPurchaseToken(purchase.getPurchaseToken())
                .build();
        billingClientBuyOneTime.acknowledgePurchase(params, new AcknowledgePurchaseResponseListener() {
            @Override
            public void onAcknowledgePurchaseResponse(BillingResult billingResult) {
                if (billingResult.getResponseCode() == BillingClient.BillingResponseCode.OK) {
                    Log.e(TAG, "onAcknowledgePurchaseResponse: handlePurchase" + billingResult.getDebugMessage() + "   " + billingResult.getResponseCode());
                }
            }
        });

    }

    private static boolean verifyValidSignature(String signedData, String signature) {
        try {
            return Security.verifyPurchase(Configs.base64InApp, signedData, signature);
        } catch (IOException e) {
            Log.e(TAG, "Got an exception trying to validate a purchase: " + e);
            return false;
        }
    }

    public interface ConnectSuccessListener {
        void onSuccess();

        void disConnected();
    }

    public static void buyOneTime(Activity activity, String sku) {
        BillingFlowParams billingFlowParams;
        if (checkValidSku(sku)) {
            billingFlowParams = BillingFlowParams.newBuilder().setSkuDetails(InAppUtil.mapSkus.get(sku)).build();
            billingClientBuyOneTime.launchBillingFlow(activity, billingFlowParams);
        }
    }

    private static boolean checkValidSku(String sku) {
        return !InAppUtil.mapSkus.isEmpty()
                && InAppUtil.mapSkus.get(sku) != null
                && !InAppUtil.mapSkus.isEmpty()
                && InAppUtil.mapSkus.get(sku) != null;
    }

    public static void subscription(Activity activity, String sku) {
        BillingFlowParams billingFlowParams;
        Log.d(TAG, "subscription: " + sku);
        if (checkValidSku(sku)) {
            billingFlowParams = BillingFlowParams.newBuilder().setSkuDetails(InAppUtil.mapSkus.get(sku)).build();
            billingClient.launchBillingFlow(activity, billingFlowParams);
        } else {

        }
    }

    public static void buy(Activity activity, String sku) {
        BillingFlowParams billingFlowParams;
        if (checkValidSku(sku)) {
            billingFlowParams = BillingFlowParams.newBuilder().setSkuDetails(InAppUtil.mapSkus.get(sku)).build();
            billingClientBuy.launchBillingFlow(activity, billingFlowParams);
        } else {

        }
    }
}
