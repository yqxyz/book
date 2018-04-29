package me.yqiang.book_interface;

import me.yqiang.book_pojo.Item;
import me.yqiang.book_pojo.ItemCat;
import me.yqiang.pojo.BResult;

import java.util.List;

public interface ItemCatServicce {
    BResult addItemCat(String name);
    BResult delItemCat(Long id);
    List<ItemCat> listItemCat();

    List<Item> findItemByCid(Long cid,Integer page);
}
