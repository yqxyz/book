package me.yqiang.book_interface;


import me.yqiang.pojo.BResult;

public interface CartService {
    BResult save(Long userId,String json);
    BResult get(Long userId);
}
