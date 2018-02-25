/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ruhul.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.ruhul.dao.UserLoginDao;
import com.ruhul.pojo.Userlogin;

/**
 *
 * @author Ruhul-Pc
 */
public class UserLoginController extends ActionSupport{
    Userlogin userlogin = new Userlogin();
    UserLoginDao userLoginDao = new UserLoginDao();

    public Userlogin getUserlogin() {
        return userlogin;
    }

    public void setUserlogin(Userlogin userlogin) {
        this.userlogin = userlogin;
    }

    public UserLoginDao getUserLoginDao() {
        return userLoginDao;
    }

    public void setUserLoginDao(UserLoginDao userLoginDao) {
        this.userLoginDao = userLoginDao;
    }
    
    @Override
    public String execute(){
        userLoginDao.add(userlogin);
        return "REGISTER";
    }
    
    public String checkValidation(){
        int i = userLoginDao.checkUser(userlogin);
        if (i > 0) {
            return "success";
        } else {
            return "error";
        }
    }
    
    public String login(){
        int i = userLoginDao.checkUser(userlogin);
        if(i>0){
            return "success";
        }else{
            return "error";
        }
        
}
}
