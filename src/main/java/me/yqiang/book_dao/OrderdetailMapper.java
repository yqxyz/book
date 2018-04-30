package me.yqiang.book_dao;

import java.util.List;

import me.yqiang.book_pojo.ItemIdPojo;
import me.yqiang.book_pojo.Orderdetail;
import me.yqiang.book_pojo.OrderdetailExample;
import org.apache.ibatis.annotations.Param;

public interface OrderdetailMapper {

    List<ItemIdPojo> recommendItem(Long id);

    int countByExample(OrderdetailExample example);

    int deleteByExample(OrderdetailExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Orderdetail record);

    int insertSelective(Orderdetail record);

    List<Orderdetail> selectByExample(OrderdetailExample example);

    Orderdetail selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Orderdetail record, @Param("example") OrderdetailExample example);

    int updateByExample(@Param("record") Orderdetail record, @Param("example") OrderdetailExample example);

    int updateByPrimaryKeySelective(Orderdetail record);

    int updateByPrimaryKey(Orderdetail record);
}