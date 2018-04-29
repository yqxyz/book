package me.yqiang.book_service;

import com.github.pagehelper.PageHelper;
import me.yqiang.book_dao.ItemCatMapper;
import me.yqiang.book_dao.ItemMapper;
import me.yqiang.book_interface.ItemCatServicce;
import me.yqiang.book_pojo.Item;
import me.yqiang.book_pojo.ItemCat;
import me.yqiang.book_pojo.ItemCatExample;
import me.yqiang.book_pojo.ItemExample;
import me.yqiang.pojo.BResult;
import me.yqiang.utils.IDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ItemCatServiceImpl implements ItemCatServicce {
    @Autowired
    ItemCatMapper itemCatMapper;
    @Override
    public BResult addItemCat(String name) {
        ItemCat itemCat = new ItemCat();
        itemCat.setName(name);
        itemCat.setId(IDUtils.genItemId());
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
        itemCat.setCreated(format.format(new Date()));
//        itemCat.setUpdated(format.format(new Date()));
        int insert = itemCatMapper.insert(itemCat);
        if(insert==1){
            return BResult.ok();
        }else
            return BResult.build(400,"error");
    }

    @Override
    public BResult delItemCat(Long id) {
        int i = itemCatMapper.deleteByPrimaryKey(id);
        if(i==1)
            return BResult.ok();
        else
            return BResult.build(400,"删除失败");
    }

    @Override
    public List<ItemCat> listItemCat() {
        ItemCatExample example = new ItemCatExample();
        example.createCriteria();
        List<ItemCat> itemCats = itemCatMapper.selectByExample(example);
        return itemCats;
    }
    @Autowired
    ItemMapper itemMapper;
    @Override
    public List<Item> findItemByCid(Long cid,Integer page) {
        if(page==null)
            page=1;
        PageHelper.startPage(page,8);
        ItemExample itemExample = new ItemExample();
        itemExample.createCriteria().andCidEqualTo(cid);
        List<Item> items = itemMapper.selectByExample(itemExample);
        return items;
    }
}
