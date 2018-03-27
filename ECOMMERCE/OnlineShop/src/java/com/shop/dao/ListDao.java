/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.dao;

import com.shop.entity.Category;
import com.shop.entity.Product;
import com.shop.entity.SubCategory;
import com.shop.util.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Ruhul-Pc
 */
public class ListDao {

    //Catagori list
    public List catList() {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();
        List<Category> cList = session.createQuery("SELECT al.catName FROM Category al").list();
        cList.toString();
        session.close();
        return cList;
    }
    
    //Sub-Catagori list
    public List subCatList(String name) {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();
        List<Category> cList = session.createQuery("SELECT al.subCatName FROM SubCategory al WHERE al.category.catId IN (SELECT a.catId FROM "
                + "Category a WHERE LOWER(a.catName)='"+name.toLowerCase()+"')").list();
        cList.toString();
        session.close();
        return cList;
    }
    
    public List<Category> catListByName(String name) {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();
        List<Category> cList = session.createQuery("SELECT al FROM Category al WHERE LOWER(catName)='"+name.toLowerCase()+"'").list();
        cList.toString();
        session.close();
        return cList;
    }
    
    public List<SubCategory> subCatListByName(String name) {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();
        List<SubCategory> cList = session.createQuery("SELECT al FROM SubCategory al WHERE LOWER(subCatName)='"+name.toLowerCase()+"'").list();
        cList.toString();
        session.close();
        return cList;
    }
    
    //Product List
    public List allProductList() {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();
        List<Product> cList = session.createQuery("SELECT al FROM Product al").list();
        cList.toString();
        session.close();
        return cList;
    }
}
