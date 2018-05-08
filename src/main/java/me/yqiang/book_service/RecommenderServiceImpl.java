package me.yqiang.book_service;

import me.yqiang.book_interface.RecommenderService;
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
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.List;

@Service
public class RecommenderServiceImpl implements RecommenderService {
    @Autowired
    DataSource dataSource;
    @Override
    public List<RecommendedItem> recommenderItem(Long id,Integer num) throws TasteException {

        JDBCDataModel model = new MySQLJDBCDataModel(dataSource, "data",
                "user_id", "item_id", "rate","time");

        ReloadFromJDBCDataModel dataModel = new ReloadFromJDBCDataModel(model);
        ItemSimilarity similarity = new EuclideanDistanceSimilarity(dataModel);
        Recommender r = new GenericItemBasedRecommender(dataModel, similarity);

        List<RecommendedItem> recommendedItemList = r.recommend(id, num);
        return recommendedItemList;
    }
}
