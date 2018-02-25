package com.ruhul.controller;


import com.ruhul.dao.UserDao;
import com.ruhul.pojo.User;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

/**
 *
 * @author J2EE-33
 */
@ManagedBean
@ViewScoped
public class UserBean {
    User user = new User();
    UserDao userdao = new UserDao();

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserDao getUserdao() {
        return userdao;
    }

    public void setUserdao(UserDao userdao) {
        this.userdao = userdao;
    }
    
    public List<User> allUsers(){
        return userdao.allUsers();
    }
    
    public String addUser(){
        userdao.add(user);
        return "display.xhtml?faces-redirect=true";
    }
    
    public String update(User u){
        userdao.update(u);
        return "display.xhtml?faces-redirect=true";
    }
    
    public void editUser(User user){
        this.user = user;
    }
    
    public String delete(User u){
        userdao.delete(u);
        return "display.xhtml?faces-redirect=true";
    }
    
    
}
