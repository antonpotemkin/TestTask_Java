package ru.andr0id.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ru.andr0id.DAO.UserDAO;
import ru.andr0id.model.User;

import java.util.List;

/**
 * Created by paa on 12.05.2016.
 */
@Service
public class UserServiceImpl implements UserService {


    private UserDAO userDao;


    public void setUserDao(UserDAO userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public List<User> listUsers() {
        return this.userDao.listUsers();
    }

    @Override
    @Transactional
    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    @Override
    @Transactional
    public void deleteUser(int id) {
        this.userDao.deleteUser(id);
    }

    @Override
    @Transactional
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Override
    @Transactional
    public List<User> getUserByName(String name) {
        return this.userDao.getUserByName(name);
    }
}
