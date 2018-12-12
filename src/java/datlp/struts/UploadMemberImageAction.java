/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import datlp.members.MemberDAO;
import java.io.File;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author DAT
 */
public class UploadMemberImageAction extends ActionSupport implements ServletRequestAware {
    private File image;
    private String imageContentType;
    private String imageFileName;
    private String username;
    private HttpServletRequest servletRequest;
    
    public UploadMemberImageAction() {
    }
    
    public String execute() throws Exception {
        String filePath = servletRequest.getSession().getServletContext().getRealPath("/").concat("img\\member");
        filePath = filePath.replace("build\\", "");
        
        Map session = ActionContext.getContext().getSession();
        //Specific that the user who upload image is admin or member
        String actor = (String) session.get("USERNAME");
        
        imageFileName = username + "_" + actor + ".jpg";
        
        MemberDAO dao = new MemberDAO();
        dao.changeAvatar(username, imageFileName);
        
        File fileToCreate = new File(filePath, imageFileName);
        FileUtils.copyFile(this.image, fileToCreate);
        return SUCCESS;
    }

    public File getImage() {
        return image;
    }

    public void setImage(File image) {
        this.image = image;
    }

    public String getImageContentType() {
        return imageContentType;
    }

    public void setImageContentType(String imageContentType) {
        this.imageContentType = imageContentType;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public HttpServletRequest getServletRequest() {
        return servletRequest;
    }

    @Override
    public void setServletRequest(HttpServletRequest servletRequest) {
        this.servletRequest = servletRequest;
    }
    
}
