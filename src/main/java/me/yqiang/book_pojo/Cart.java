package me.yqiang.book_pojo;

public class Cart {
    private Long cartId;

    private Long userId;

    private String cartdata;

    public Long getCartId() {
        return cartId;
    }

    public void setCartId(Long cartId) {
        this.cartId = cartId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getCartdata() {
        return cartdata;
    }

    public void setCartdata(String cartdata) {
        this.cartdata = cartdata == null ? null : cartdata.trim();
    }
}