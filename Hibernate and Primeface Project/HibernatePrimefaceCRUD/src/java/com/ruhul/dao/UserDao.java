/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ruhul.dao;

import com.ruhul.pojo.User;
import com.ruhul.util.HibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author J2EE-33
 */
public class UserDao {

    public List<User> allUsers() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List<User> userlist = session.createCriteria(User.class).list();
        session.getTransaction().commit();
        session.close();
        return userlist;
    }

    public void add(User n) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(n);
        session.getTransaction().commit();
        session.close();
    }

    public void update(User n) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(n);
        session.getTransaction().commit();
        session.close();
    }

    public void delete(User n) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(n);
        session.getTransaction().commit();
        session.close();
    }
}
