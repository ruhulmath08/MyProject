/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.addhandler;

import com.shop.dao.AddDao;
import com.shop.entity.Category;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Ruhul-Pc
 */
@ManagedBean
@SessionScoped
public class CategoryMB {
    Category category = new Category();

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    public String addCategory(){
        category.setCatName(category.getCatName());
        category.setCatDesc(category.getCatDesc());
        boolean status = new AddDao().addCategory(category);
        if (status) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Data Saved", ""));
        }
        else{
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Data Not Saved", ""));
        }
        return null;
    }
}
