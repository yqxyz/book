package me.yqiang.book_controller;

import me.yqiang.book_interface.ItemService;
import me.yqiang.book_pojo.Bigimg;
import me.yqiang.pojo.BResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AdminController {
    @RequestMapping("/admin")
    public String adminIndex() {

        return "admin/index";
    }
    @RequestMapping("/bigImgList")
    public String bigImgList() {

        return "admin/bigImgList";
    }
    @RequestMapping("/bigImgAdd")
    public String bigImgAdd() {

        return "admin/bigImgAdd";
    }
    @Autowired
    ItemService itemService;
    @RequestMapping("/bigImg/del")
    @ResponseBody
    public BResult bigImgdel(Long id) {
        BResult bResult = itemService.delBigImg(id);
        return bResult;
    }
    @RequestMapping("/bigImg/add")
    @ResponseBody
    public BResult addBigImg(Long itemId, String image) {
        BResult bResult = itemService.addBigImg(itemId,image);
        return bResult;
    }
    @RequestMapping("/bigImg/list")
    @ResponseBody
    public List<Bigimg> listBigImg() {
        List<Bigimg> bigimgs = itemService.listBigImg();
        return bigimgs;
    }


}
