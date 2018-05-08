package me.yqiang.book_controller;

import com.github.pagehelper.Page;
import me.yqiang.book_interface.ItemService;
import me.yqiang.book_pojo.Bigimg;
import me.yqiang.book_pojo.Item;
import me.yqiang.book_service.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    @Autowired
    Validate validate;
    @RequestMapping("/validate")
    public void img(HttpServletRequest request, HttpServletResponse response){
        validate.getYZM(request,response);
    }
    @RequestMapping("/validate1")
    @ResponseBody
    public String userValidate2(String code,HttpServletRequest request){
        String code1 = (String) request.getSession().getAttribute("code");
        if(code.equals(code1))
            return "true";
        else
            return "false";
    }
}
