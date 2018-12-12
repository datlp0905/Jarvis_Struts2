/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionSupport;
import datlp.equipments.EquipmentDAO;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author DAT
 */
public class UploadEquipImgAction extends ActionSupport implements ServletRequestAware{
    private File img;
    private String imgFileName;
    private String id;
    private HttpServletRequest servletRequest;
    
    public UploadEquipImgAction() {
    }
    
    public String execute() throws Exception {
        String filePath = servletRequest.getSession().getServletContext().getRealPath("/").concat("img\\equipment");
        filePath = filePath.replace("build\\", "");
        
        imgFileName = id + ".jpg";
        
        EquipmentDAO dao = new EquipmentDAO();
        if(dao.uploadImg(id, imgFileName)) {
            File fileToCreate = new File(filePath, imgFileName);
            FileUtils.copyFile(this.img, fileToCreate);
        }
        return SUCCESS;
    }

    public File getImg() {
        return img;
    }

    public void setImg(File img) {
        this.img = img;
    }

    public String getImgFileName() {
        return imgFileName;
    }

    public void setImgFileName(String imgFileName) {
        this.imgFileName = imgFileName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public HttpServletRequest getServletRequest() {
        return servletRequest;
    }

    @Override
    public void setServletRequest(HttpServletRequest servletRequest) {
        this.servletRequest = servletRequest;
    }
    
}
