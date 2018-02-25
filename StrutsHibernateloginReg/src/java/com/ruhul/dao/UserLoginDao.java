/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ruhul.dao;

import com.ruhul.pojo.Userlogin;
import com.ruhul.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Ruhul-Pc
 */
public class UserLoginDao {
    public void add(Userlogin userlogin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(userlogin);
        session.getTransaction().commit();
        session.close();
    }

    //for check username and password
    public int checkUser(Userlogin userlogin) {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from Userlogin where username=:username and password=:password");
            query.setString("username", userlogin.getUsername());
            query.setString("password", userlogin.getPassword());
            List list = query.list();
            session.close();
            return list.size();
    }
}
