package me.yqiang.book_service;

import me.yqiang.book_dao.UserMapper;
import me.yqiang.book_interface.UserService;
import me.yqiang.book_pojo.User;
import me.yqiang.book_pojo.UserExample;
import me.yqiang.pojo.BResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public BResult addUser(User user) {
        //user.setUserId(IDUtils.genItemId());
        int insert = userMapper.insert(user);
        return BResult.ok();
    }

    @Override
    public BResult login(String userName,String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(userName);
        List<User> list = userMapper.selectByExample(userExample);
        if(list == null || list.size()==0){
            return BResult.build(400,"用户名或密码错误");
        }
        User user = list.get(0);
        if(!password.equals(user.getPassword())){
            return BResult.build(400,"用户名与密码不匹配");
        }
        user.setPassword(null);
        return BResult.build(200,"success",user);
    }

    @Override
    public User findUser(Long userId) {
        User user = userMapper.selectByPrimaryKey(userId);
        return user;
    }

    @Override
    public BResult changeAddress(Long userId,String address, String phone) {
        User user = userMapper.selectByPrimaryKey(userId);
        user.setAddress(address);
        user.setPhone(phone);
        int i = userMapper.updateByPrimaryKey(user);
        if(i==1){
            return BResult.ok();
        }else
            return BResult.build(400,"error");
    }
}
