package me.yqiang.book_dao;

import java.util.List;
import me.yqiang.book_pojo.Bigimg;
import me.yqiang.book_pojo.BigimgExample;
import org.apache.ibatis.annotations.Param;

public interface BigimgMapper {
    int countByExample(BigimgExample example);

    int deleteByExample(BigimgExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Bigimg record);

    int insertSelective(Bigimg record);

    List<Bigimg> selectByExample(BigimgExample example);

    Bigimg selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Bigimg record, @Param("example") BigimgExample example);

    int updateByExample(@Param("record") Bigimg record, @Param("example") BigimgExample example);

    int updateByPrimaryKeySelective(Bigimg record);

    int updateByPrimaryKey(Bigimg record);
}