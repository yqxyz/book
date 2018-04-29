package me.yqiang.book_controller;

import com.github.pagehelper.Page;
import me.yqiang.book_interface.ItemCatServicce;
import me.yqiang.book_pojo.Item;
import me.yqiang.book_pojo.ItemCat;
import me.yqiang.pojo.BResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ItemCatController {
    @Autowired
    ItemCatServicce itemCatServicce;
    @RequestMapping("itemCatAdd")
    public String addItemCat(){
        return "admin/itemCatAdd";
    }

    @RequestMapping("/itemCatList")
    public String itemCatPage(){
        return "admin/itemCatList";
    }

    @RequestMapping("/itemCat/list")
    @ResponseBody
    public List<ItemCat> itemCatList(){
        List<ItemCat> itemCats = itemCatServicce.listItemCat();
        return itemCats;
    }

    @RequestMapping("/itemCat/del")
    @ResponseBody
    public BResult itemCatDel(Long id){
        BResult bResult = itemCatServicce.delItemCat(id);
        return bResult;
    }

    @RequestMapping("/itemCat/add")
    public BResult itemCatAdd(String name){
        BResult bResult = itemCatServicce.addItemCat(name);
        return bResult;
    }
    @RequestMapping("/itemCat/{cid}")
    public String itemByCid(@PathVariable Long cid, Model model){
        List<Item> items =  itemCatServicce.findItemByCid(cid,null);
        model.addAttribute("items",items);
        model.addAttribute("total",((Page)items).getPages());
        model.addAttribute("cid",cid);
        return "itemByCid";
    }
    @RequestMapping("/itemCat/item")
    @ResponseBody
    public List<Item> itemByCidAjax(Long cid,Integer page){
        List<Item> items =  itemCatServicce.findItemByCid(cid,page);
        for (Item item : items){
            String image = item.getImage();
            if(image!=null){
                String[] split = image.split(",");
                item.setImages(split);
            }
        }
        return items;
    }
}
