/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import static com.opensymphony.xwork2.Action.SUCCESS;
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
public class UploadMemberImgByMemberAction extends ActionSupport implements ServletRequestAware{
    private File img;
    private String imgContentType;
    private String imgFileName;
    private HttpServletRequest servletRequest;
    public UploadMemberImgByMemberAction() {
    }
    
    public String execute() throws Exception {
        String filePath = servletRequest.getSession().getServletContext().getRealPath("/").concat("img\\member");
        filePath = filePath.replace("build\\", "");
        Map session = ActionContext.getContext().getSession();
        String username = (String) session.get("USERNAME");
        imgFileName = username + "_" + username + ".jpg";
        
        MemberDAO dao = new MemberDAO();
        dao.changeAvatar(username, imgFileName);
        
        File fileToCreate = new File(filePath, imgFileName);
        FileUtils.copyFile(this.img, fileToCreate);
        return SUCCESS;
    }

    public File getImg() {
        return img;
    }

    public void setImg(File img) {
        this.img = img;
    }

    public String getImgContentType() {
        return imgContentType;
    }

    public void setImgContentType(String imgContentType) {
        this.imgContentType = imgContentType;
    }

    public String getImgFileName() {
        return imgFileName;
    }

    public void setImgFileName(String imgFileName) {
        this.imgFileName = imgFileName;
    }

    public HttpServletRequest getServletRequest() {
        return servletRequest;
    }

    @Override
    public void setServletRequest(HttpServletRequest servletRequest) {
        this.servletRequest = servletRequest;
    }
    
}
