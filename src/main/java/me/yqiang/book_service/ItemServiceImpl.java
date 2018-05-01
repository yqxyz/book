package me.yqiang.book_service;

import com.github.pagehelper.PageHelper;
import me.yqiang.book_dao.BigimgMapper;
import me.yqiang.book_dao.ItemMapper;
import me.yqiang.book_dao.OrderdetailMapper;
import me.yqiang.book_interface.ItemService;
import me.yqiang.book_pojo.*;
import me.yqiang.pojo.BResult;
import me.yqiang.utils.IDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {
    @Autowired
    ItemMapper itemMapper;
    @Override
    public BResult addItem(Item item) {
        item.setStatus(1);
        item.setSold(0);
        //item.setItemId(IDUtils.genItemId());
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
        item.setCreated(format.format(new Date()));
        item.setUpdated(format.format(new Date()));
        int insert = itemMapper.insert(item);
        if(insert!=0)
            return BResult.build(200,"成功");
        else
            return BResult.build(400,"失败");
    }

    @Override
    public BResult editItem(Item item) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
        item.setUpdated(format.format(new Date()));
        Item item1 = itemMapper.selectByPrimaryKey(item.getItemId());
        item.setCreated(item1.getCreated());
        item.setSold(item1.getSold());
        int i = itemMapper.updateByPrimaryKey(item);
        if(i!=0)
            return BResult.build(200,"成功");
        else
            return BResult.build(400,"失败");
    }

    @Override
    public BResult delItem(Long id) {
        int i = itemMapper.deleteByPrimaryKey(id);
        if(i!=0)
            return BResult.build(200,"成功");
        else
            return BResult.build(400,"失败");
    }

    @Override
    public List<Item> listItem(Integer page,Integer pages) {
        PageHelper.startPage(page,pages);
        ItemExample itemExample =new ItemExample();
        itemExample.createCriteria();
        List<Item> items = itemMapper.selectByExample(itemExample);
        return items;
    }
    @Override
    public List<Item> listItem() {
        ItemExample itemExample =new ItemExample();
        itemExample.createCriteria();
        List<Item> items = itemMapper.selectByExample(itemExample);
        return items;
    }

    @Override
    public BResult findItem(Long id) {
        Item item = itemMapper.selectByPrimaryKey(id);
        if(item.getImage()!=null){
            String[] split = item.getImage().split(",");
            item.setImages(split);
            return BResult.build(200,"",item);
        }else {
            return BResult.build(400,"失败");
        }
    }

    @Override
    public List<Item> search(String keyword,Integer page) {
        if(page==null)
            page=1;
        PageHelper.startPage(page,8);
        keyword = "%"+keyword+"%";
        ItemExample itemExample = new ItemExample();
        itemExample.or(itemExample.createCriteria().andNameLike(keyword));
        itemExample.or(itemExample.createCriteria().andItemdescLike(keyword));
        List<Item> items = itemMapper.selectByExample(itemExample);

        return items;
    }

    @Autowired
    OrderdetailMapper orderdetailMapper;
    @Override
    public List<Orderdetail> getComment(Long itemId,Integer page,Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        OrderdetailExample orderdetailExample = new OrderdetailExample();
        orderdetailExample.createCriteria().andItemIdEqualTo(itemId).andRateIsNotNull();
        orderdetailExample.setOrderByClause("comment_date desc");
        List<Orderdetail> orderdetails = orderdetailMapper.selectByExample(orderdetailExample);
        return orderdetails;
    }

    @Override
    public List<Item> hot() {
        PageHelper.startPage(1,8);
        ItemExample itemExample = new ItemExample();
        itemExample.setOrderByClause("sold desc");
        List<Item> items = itemMapper.selectByExample(itemExample);
        return items;
    }

    @Override
    public List<Item> recent() {
        PageHelper.startPage(1,8);
        ItemExample itemExample = new ItemExample();
        itemExample.setOrderByClause("updated desc");
        List<Item> items = itemMapper.selectByExample(itemExample);
        return items;
    }
    @Autowired
    BigimgMapper bigimgMapper;

    @Override
    public BResult addBigImg(Long itemId, String img) {
        Item item = itemMapper.selectByPrimaryKey(itemId);
        Bigimg bigimg = new Bigimg();
        bigimg.setId(IDUtils.genItemId());
        bigimg.setItemId(itemId);
        bigimg.setName(item.getName());
        bigimg.setImg(img);
        int insert = bigimgMapper.insert(bigimg);
        if(insert==1)
            return BResult.ok();
        else
            return BResult.build(400,"error");
    }

    @Override
    public BResult delBigImg(Long id) {
        int i = bigimgMapper.deleteByPrimaryKey(id);
        if(i==1)
            return BResult.ok();
        else
            return BResult.build(400,"error");
    }


    @Override
    public List<Bigimg> listBigImg() {
        BigimgExample bigimgExample = new BigimgExample();
        List<Bigimg> bigimgs = bigimgMapper.selectByExample(bigimgExample);
        for(Bigimg bigimg : bigimgs){
            if(bigimg.getImg()!=null)
                bigimg.setImg(bigimg.getImg().replace(",",""));
        }
        return bigimgs;
    }
}
