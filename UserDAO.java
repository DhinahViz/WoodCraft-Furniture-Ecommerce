package com.woodcraft.dao;

import com.woodcraft.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User loginUser(String email, String password);

    User getUserById(int userId);
    
    boolean updateUser(User user);
}