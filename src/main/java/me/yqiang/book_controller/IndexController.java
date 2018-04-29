package me.yqiang.book_controller;

import com.github.pagehelper.Page;
import me.yqiang.book_interface.ItemService;
import me.yqiang.book_pojo.Bigimg;
import me.yqiang.book_pojo.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class IndexController {
    @Autowired
    ItemService itemService;
    @RequestMapping("index")
    public String showIndex(Model model){
        List<Item> items = itemService.listItem(1,8);

        for (Item item : items){
            String image = item.getImage();
            if(image!=null){
                String[] split = image.split(",");
                item.setImages(split);
            }
        }
        List<Bigimg> bigimgs = itemService.listBigImg();
        for (Bigimg bigimg : bigimgs){
            if(bigimg.getImg()!=null)
            bigimg.setImg(bigimg.getImg().replace(",",""));
        }
        model.addAttribute("bigImg",bigimgs);
        model.addAttribute("items",items);
        model.addAttribute("total",((Page)items).getPages());
        return "index";
    }
    @RequestMapping("/index/item/ajax")
    @ResponseBody
    public List<Item> indexItemAjax(Integer page){
        List<Item> items = itemService.listItem(page,8);

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
