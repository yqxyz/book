package me.yqiang.book_interface;

import me.yqiang.book_pojo.Order;
import me.yqiang.book_pojo.Orderdetail;
import me.yqiang.pojo.BResult;
import me.yqiang.pojo.Product;

import java.util.List;

public interface OrderService {
    BResult add(Long userId, Product[] product);
    List<Order> orderList(Long userId);

    List<Orderdetail> orderdetailList(Long orderId);

    BResult del(Long id);

    BResult orderdetailComment(Long id, float rate, String comment);

    List<Order> orderAllList(Long userId);
}
