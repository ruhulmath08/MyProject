/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shop.addhandler;

import com.shop.dao.AddDao;
import com.shop.dao.ListDao;
import com.shop.entity.Product;
import com.shop.entity.SubCategory;
import java.io.File;
import java.io.InputStream;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.primefaces.model.UploadedFile;

/**
 *
 * @author Ruhul-Pc
 */
@ManagedBean
@SessionScoped
public class ProductMB {

    Product product = new Product();
    SubCategory subcat = new SubCategory();
    String subCatName;
    String catnamme = "";
    List<SubCategory> listSubCat;
    UploadedFile file;

    public UploadedFile getFile() {
        return file;
    }

    public void setFile(UploadedFile file) {
        this.file = file;
    }

    public String getCatnamme() {
        return catnamme;
    }

    public void setCatnamme(String catnamme) {
        this.catnamme = catnamme;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public SubCategory getSubcat() {
        return subcat;
    }

    public void setSubcat(SubCategory subcat) {
        this.subcat = subcat;
    }

    public String getSubCatName() {
        return subCatName;
    }

    public void setSubCatName(String subCatName) {
        this.subCatName = subCatName;
    }

    public List<SubCategory> getListSubCat() {
        return listSubCat;
    }

    public void setListSubCat(List<SubCategory> listSubCat) {
        this.listSubCat = listSubCat;
    }

    public String addProduct() {
        upload();
        listSubCat = new ListDao().subCatListByName(subCatName);
        subcat.setSubCatId(listSubCat.get(0).getSubCatId());
        product.setSubCategory(subcat);
        product.setProName(product.getProName());
        product.setProQty(product.getProQty());
        product.setProPrice(product.getProPrice());
        product.setProUri(product.getProUri());
        product.setProDesc(product.getProDesc());
        boolean status = new AddDao().addProduct(product);
        if (status) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Data Saved", ""));
        } else {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Data Not Saved", ""));
        }
        return null;
    }

    //Method for upload image
    public void upload() {
        if (file != null) {
            try {
                FacesContext context = FacesContext.getCurrentInstance();
                ServletContext servletContext = (ServletContext) context.getExternalContext().getContext();
                String dbPath = servletContext.getRealPath("/");
                String webcut = dbPath.substring(0, dbPath.lastIndexOf("\\"));
                String buildCut = webcut.substring(0, webcut.lastIndexOf("\\"));
                String mainURLPath = buildCut.substring(0, buildCut.lastIndexOf("\\"));
                InputStream inputStream = file.getInputstream();
                String path = mainURLPath+"\\web\\resources\\images\\" + file.getFileName();
                System.out.println("path is : "+path);
                File destFile = new File(path);
                if (!destFile.exists()) {
                    FileUtils.copyInputStreamToFile(inputStream, destFile);
                }
                product.setProUri(file.getFileName().toString());
            } 
            catch (Exception e) {
                System.err.println(e);
            }
        }
    }

    public List<SelectItem> getSubCategoryName() {
        List<SelectItem> subcatname = new ListDao().subCatList(catnamme);
        return subcatname;
    }
}
