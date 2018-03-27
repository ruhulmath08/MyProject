/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.addhandler;

import com.shop.dao.AddDao;
import com.shop.dao.ListDao;
import com.shop.entity.Category;
import com.shop.entity.SubCategory;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;

/**
 *
 * @author Ruhul-Pc
 */
@ManagedBean
@SessionScoped
public class SubCategoryMB {
    SubCategory subcat = new SubCategory();
    Category category = new Category();
    String catname;
    List<Category> listCat;

    public SubCategory getSubcat() {
        return subcat;
    }

    public void setSubcat(SubCategory subcat) {
        this.subcat = subcat;
    }

    public String getCatname() {
        return catname;
    }

    public void setCatname(String catname) {
        this.catname = catname;
    }

    public List<Category> getListCat() {
        return listCat;
    }

    public void setListCat(List<Category> listCat) {
        this.listCat = listCat;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    public String addSubCategory(){
        listCat = new ListDao().catListByName(catname);
        category.setCatId(listCat.get(0).getCatId());
        subcat.setCategory(category);
        subcat.setSubCatName(subcat.getSubCatName());
        subcat.setSubCatDesc(subcat.getSubCatDesc());
        boolean status = new AddDao().addSubCategory(subcat);
        if (status) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Data Saved", ""));
        }
        else{
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Data Not Saved", ""));
        }
        return null;
    }
    
    public List<SelectItem> getCategoryName(){
        List<SelectItem> catname = new ListDao().catList();
        return catname;
    }
}
