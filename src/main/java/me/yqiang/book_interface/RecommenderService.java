package me.yqiang.book_interface;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;

import java.util.List;

public interface RecommenderService {
    List<RecommendedItem> recommenderItem(Long id,Integer num) throws TasteException;
}
