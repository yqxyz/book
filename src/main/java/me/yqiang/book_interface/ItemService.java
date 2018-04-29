package me.yqiang.book_interface;

import me.yqiang.book_pojo.Bigimg;
import me.yqiang.book_pojo.Item;
import me.yqiang.book_pojo.Orderdetail;
import me.yqiang.pojo.BResult;

import java.util.List;

public interface ItemService {
    BResult addItem(Item item);
    BResult editItem(Item item);
    BResult delItem(Long id);
    List<Item> listItem(Integer page,Integer pages);
    List<Item> listItem();
    BResult findItem(Long id);
    List<Item> search(String keyword,Integer page);
    List<Orderdetail> getComment(Long itemId,Integer page,Integer pageSize);
    List<Item> hot();
    List<Item> recent();

    BResult addBigImg(Long itemId, String img);

    BResult delBigImg(Long id);

    List<Bigimg> listBigImg();
}
