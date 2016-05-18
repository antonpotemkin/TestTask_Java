package ru.andr0id.DAO;

import ru.andr0id.model.User;

import java.util.List;

/**
 * Created by paa on 12.05.2016.
 */
public interface UserDAO {
    public List<User> listUsers();
    public void addUser(User user);
    public void updateUser(User user);
    public void deleteUser(int id);
    public User getUserById(int id);
    public List<User> getUserByName(String name);

}
