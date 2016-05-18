package ru.andr0id.DAO;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ru.andr0id.model.User;

import java.util.List;

/**
 * Created by paa on 12.05.2016.
 */
@Repository
public class UserDAOImpl implements UserDAO {



    private SessionFactory sessionFactory;
    

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @SuppressWarnings("unchecked")
    @Override
    public List<User> listUsers() {

        List<User> userlist = sessionFactory.getCurrentSession().createQuery("from User").list();
        return userlist;
    }

    @Override
    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(user);
    }

    @Override
    public void updateUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Override
    public void deleteUser(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        if (null != user)
            session.delete(user);
    }

    @Override
    public User getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        Hibernate.initialize(user);
        return user;
    }

    @Override
    public List<User> getUserByName(String name) {
        Session session = sessionFactory.getCurrentSession();
        List<User> users = session.createCriteria(User.class).add(Restrictions.eq("name", name)).list();
        return users;
    }
}
