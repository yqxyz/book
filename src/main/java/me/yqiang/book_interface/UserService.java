package me.yqiang.book_interface;

import me.yqiang.book_pojo.User;
import me.yqiang.pojo.BResult;

import java.util.List;

public interface UserService {
    BResult addUser(User user);
    BResult login(String userName,String password);
    User findUser(Long userId);
    BResult changeAddress(Long userId,String address,String phone);

    List<User> userList();

    BResult delUser(Long id);

    String validate(String username);

    String validate1(String email);

    BResult changePwd(Long id, String pwd);
}
