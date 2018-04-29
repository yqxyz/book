package me.yqiang.book_service;

import me.yqiang.book_dao.CartMapper;
import me.yqiang.book_interface.CartService;
import me.yqiang.book_pojo.Cart;
import me.yqiang.book_pojo.CartExample;
import me.yqiang.pojo.BResult;
import me.yqiang.utils.IDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    CartMapper cartMapper;
    @Override
    public BResult save(Long userId,String json) {
        CartExample cartExample = new CartExample();
        cartExample.createCriteria().andUserIdEqualTo(userId);
        List<Cart> carts = cartMapper.selectByExample(cartExample);
        int i=0,i1=0;
        if(carts==null || carts.size()==0 ){
            Cart cart = new Cart();
            cart.setCartId(IDUtils.genItemId());
            cart.setUserId(userId);
            cart.setCartdata(json);
            i = cartMapper.insert(cart);
        }else {
            Cart cart = carts.get(0);
            cart.setCartdata(json);
            i1 = cartMapper.updateByPrimaryKey(cart);
        }
        if(i==1 && i1==1){
            return BResult.ok();
        }else
            return BResult.build(400,"error");
    }

    @Override
    public BResult get(Long userId) {
        CartExample cartExample = new CartExample();
        cartExample.createCriteria().andUserIdEqualTo(userId);
        List<Cart> carts = cartMapper.selectByExample(cartExample);
        if(carts==null || carts.size()==0){
            return BResult.build(400,"error");
        }else {
            Cart cart = carts.get(0);
            return BResult.build(200,cart.getCartdata());
        }
    }


}
