package com.example.init_app.utils.in_app;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class InAppModel {

    @SerializedName("title")
    @Expose
    private String title;
    @SerializedName("coin")
    @Expose
    private Integer coin;
    @SerializedName("product_id")
    @Expose
    private String productId;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getCoin() {
        return coin;
    }

    public void setCoin(Integer coin) {
        this.coin = coin;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

}