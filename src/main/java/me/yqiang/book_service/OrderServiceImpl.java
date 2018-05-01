package me.yqiang.book_service;

import me.yqiang.book_dao.ItemMapper;
import me.yqiang.book_dao.OrderMapper;
import me.yqiang.book_dao.OrderdetailMapper;
import me.yqiang.book_dao.UserMapper;
import me.yqiang.book_interface.OrderService;
import me.yqiang.book_pojo.*;
import me.yqiang.pojo.BResult;
import me.yqiang.pojo.Product;
import me.yqiang.utils.IDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    ItemMapper itemMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    OrderdetailMapper orderdetailMapper;
    @Override
    public BResult add(Long userId, Product[] products) {
        Order order = new Order();
        Long orderId = IDUtils.genItemId();
        order.setOrderId(orderId);
        User user = userMapper.selectByPrimaryKey(userId);
        order.setUserId(userId);
        order.setAddress(user.getAddress());
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
        order.setDate(format.format(new Date()));
        order.setPhone(user.getPhone());
        double totalAmount = 0.00;
        for(Product product : products){
            Double price = itemMapper.selectByPrimaryKey(product.getId()).getPrice();
            totalAmount += Double.valueOf(price)*(product.getNum());
        }
        order.setPrice(totalAmount);
        int insert1 = orderMapper.insert(order);
        int insert=0;
        for(Product product: products){
            Orderdetail orderdetail = new Orderdetail();
            orderdetail.setId(IDUtils.genItemId());
            orderdetail.setUserId(userId);
            orderdetail.setItemId(product.getId());
            double price = itemMapper.selectByPrimaryKey(product.getId()).getPrice();
            String name = itemMapper.selectByPrimaryKey(product.getId()).getName();
            orderdetail.setPrice(price);
            orderdetail.setUserName(user.getUserName());
            orderdetail.setName(name);
            orderdetail.setOrderId(orderId);
            orderdetail.setNum(product.getNum());
            Item item = itemMapper.selectByPrimaryKey(product.getId());
            item.setNum(item.getNum()-1);
            item.setSold(item.getSold()+product.getNum());
            itemMapper.updateByPrimaryKey(item);
            insert = orderdetailMapper.insert(orderdetail);
        }
        if(insert==1&&insert1==1){
            return BResult.ok();
        }else
            return BResult.build(400,"error");
    }

    @Override
    public List<Order> orderList(Long userId) {
        OrderExample orderExample =  new OrderExample();
        orderExample.createCriteria().andUserIdEqualTo(userId);
        List<Order> orders = orderMapper.selectByExample(orderExample);
        return orders;
    }

    @Override
    public List<Orderdetail> orderdetailList(Long orderId) {
        OrderdetailExample example = new OrderdetailExample();
        example.createCriteria().andOrderIdEqualTo(orderId);
        List<Orderdetail> orderdetails = orderdetailMapper.selectByExample(example);
        return orderdetails;
    }

    @Override
    public BResult del(Long id) {
        OrderExample orderExample = new OrderExample();
        orderExample.createCriteria().andOrderIdEqualTo(id);
        OrderdetailExample orderdetailExample = new OrderdetailExample();
        orderdetailExample.createCriteria().andOrderIdEqualTo(id);
        int i1 = orderdetailMapper.deleteByExample(orderdetailExample);
        int i = orderMapper.deleteByExample(orderExample);
        if(i==1&&i1==1){
            return BResult.ok();
        }else
            return BResult.build(400,"error");
    }

    @Override
    public BResult orderdetailComment(Long id, float rate, String comment) {
        Orderdetail orderdetail = orderdetailMapper.selectByPrimaryKey(id);
        orderdetail.setRate(rate);
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
        orderdetail.setCommentDate(format.format(new Date()));
        orderdetail.setComment(comment);
        int i = orderdetailMapper.updateByPrimaryKey(orderdetail);
        if(i==1){
            return BResult.ok();
        }else
            return BResult.build(400,"error");
    }

    @Override
    public List<Order> orderAllList(Long userId) {
        OrderExample orderExample =  new OrderExample();
        orderExample.createCriteria();
        List<Order> orders = orderMapper.selectByExample(orderExample);
        return orders;
    }
}
