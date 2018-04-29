package me.yqiang.book_controller;

import com.github.pagehelper.Page;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import me.yqiang.book_dao.OrderdetailMapper;
import me.yqiang.book_interface.ItemService;
import me.yqiang.book_interface.RecommenderService;
import me.yqiang.book_pojo.Item;
import me.yqiang.book_pojo.ItemIdPojo;
import me.yqiang.book_pojo.Orderdetail;
import me.yqiang.pojo.BResult;
import me.yqiang.utils.IDUtils;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.model.jdbc.ReloadFromJDBCDataModel;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.model.JDBCDataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

@Controller
public class ItemController {
    @Autowired
    ItemService itemService;
    @RequestMapping("itemList")
     public String itemList(){
         return "admin/itemList";
     }
    @RequestMapping("itemAdd")
    public String itemAdd(){
        return "admin/itemAdd";
    }

    @RequestMapping("item/edit/{itemId}")
    public String itemEdit(@PathVariable Long itemId,Model model){
        BResult item = itemService.findItem(itemId);
        if(item.getData()==null){
            return "/error/404";
        }
        model.addAttribute("item",item);
        return "admin/itemEdit";
    }
    @RequestMapping("item/edit")
    @ResponseBody
    public BResult itemEditajax(Item item){
        BResult bResult = itemService.editItem(item);
        return bResult;
    }
    @RequestMapping("/item/{itemId}")
    public String itemInfo(@PathVariable Long itemId,Model model){
        BResult item = itemService.findItem(itemId);
        if(item.getData()==null){
            return "/error/404";
        }
        model.addAttribute("item",item);
        return "item";
    }
    @RequestMapping("/item/img/{itemId}")
    public void itemImg(@PathVariable Long itemId,HttpServletRequest request, HttpServletResponse response) throws IOException {
        BResult item = itemService.findItem(itemId);
        Item item1 = (Item) item.getData();
        String[] split = item1.getImage().split(",");
        if(item1!=null){
            String fileName = request.getSession().getServletContext().getRealPath("/")+"img\\item\\"+split[0]+".jpg";
            File file = new File(fileName);
            if(!(file.exists() && file.canRead())) {
                file = new File(request.getSession().getServletContext().getRealPath("/")
                        + "img\\blank.jpg");
            }
            FileInputStream inputStream = new FileInputStream(file);
            byte[] data = new byte[(int)file.length()];
            int length = inputStream.read(data);
            inputStream.close();
            response.setContentType("image/jpg");
            OutputStream stream = response.getOutputStream();
            stream.write(data);
            stream.flush();
            stream.close();
        }
    }
    @RequestMapping("fileUpload")
    @ResponseBody
    public BResult fileUpload(@RequestParam(value = "file")MultipartFile file, HttpServletRequest request){
        if(!file.isEmpty()) {
            //上传文件路径
            String path = request.getSession().getServletContext().getRealPath("/img/item/");
            //上传文件名
            //String filename = file.getOriginalFilename();
            String suffix ="."+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
            String filenametime =IDUtils.genImageName();
            String fileName = filenametime+  suffix;
            File filepath = new File(path,fileName);

            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            try {
                file.transferTo(new File(path + File.separator + fileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            Map<String,String> map = new HashMap<>();
            map.put("name",filenametime);
            return BResult.ok(map);
        } else {
            return BResult.build(400,"上传失败");
        }

    }
    @RequestMapping("/item/add")
    @ResponseBody
    public BResult addItem(Item item){
        BResult bResult = itemService.addItem(item);
        return bResult;
    }
    @RequestMapping("/item/list")
    @ResponseBody
    public List<Item> addItem(){
        List<Item> items = itemService.listItem();
        return items;
    }

    @RequestMapping("/item/del")
    @ResponseBody
    public BResult delItem(Long id){
        BResult bResult = itemService.delItem(id);
        return bResult;
    }
    @RequestMapping("/item/comment/{itemId}/{pageSize}/{page}")
    @ResponseBody
    public Map<String,Object> getItemComment(@PathVariable Long itemId,@PathVariable Integer pageSize,@PathVariable Integer page){
        List<Orderdetail> comment = itemService.getComment(itemId,page,pageSize);
        Map<String,Object> map = new HashMap<>();
        map.put("comment",comment);
        map.put("total",((Page)comment).getPages());
        return map;
    }
    @RequestMapping("/search")
    public String search(String keyword,Model model) throws UnsupportedEncodingException {
        keyword = new String(keyword.getBytes("ISO8859-1"), "UTF-8");
        List<Item> search = itemService.search(keyword,null);
        for (Item item : search){
            String image = item.getImage();
            if(image!=null){
                String[] split = image.split(",");
                item.setImages(split);
            }
        }
        model.addAttribute("items",search);
        model.addAttribute("total",((Page)search).getPages());
        model.addAttribute("current",1);
        model.addAttribute("keyword",keyword);
        return "search";
    }
    @RequestMapping("/search/ajax")
    @ResponseBody
    public List<Item> searchAjax(String keyword,Integer page)  {
        List<Item> search = itemService.search(keyword,page);
        for (Item item : search){
            String image = item.getImage();
            if(image!=null){
                String[] split = image.split(",");
                item.setImages(split);
            }
        }
        return search;
    }
    @RequestMapping("/item/hot")
    @ResponseBody
    public List<Item> hot(){
        List<Item> items = itemService.hot();
        return items;
    }

    @RequestMapping("/item/recent")
    @ResponseBody
    public List<Item> recent(){
        List<Item> items = itemService.recent();
        return items;
    }


    @Autowired
    RecommenderService recommenderService;
    @RequestMapping("/recommend/{num}/{id}")
    @ResponseBody
    public BResult recommender(@PathVariable Long id, @PathVariable Integer num) throws TasteException {

        List<RecommendedItem> recommendedItemList = recommenderService.recommenderItem(id, num);
        if(recommendedItemList.size()>0){
            List<Item> list = new LinkedList<>();
            for(RecommendedItem recommendedItem : recommendedItemList){
                Item item = (Item) itemService.findItem(recommendedItem.getItemID()).getData();
                if(item!=null)
                    list.add(item);
            }
            return BResult.build(200,"success",list);
        }
        return BResult.build(400,"empty");
    }

    @Autowired
    OrderdetailMapper orderdetailMapper;
    @RequestMapping("/recommend1/{id}")
    @ResponseBody
    public BResult recommend1(@PathVariable Long id){
        List<ItemIdPojo> itemIdPojos = orderdetailMapper.recommendItem(id);
        if(itemIdPojos.size()>0){
            List<Item> list = new LinkedList<>();
            for(ItemIdPojo itemIdPojo : itemIdPojos){
                Item item = (Item) itemService.findItem(itemIdPojo.getItem_id()).getData();
                if(item!=null)
                    list.add(item);
            }
            return BResult.build(200,"success",list);
        }
        return BResult.build(400,"empty");
    }
}
