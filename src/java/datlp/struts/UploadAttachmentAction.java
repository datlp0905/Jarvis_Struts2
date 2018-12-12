/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionSupport;
import datlp.missions.MissionDAO;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author DAT
 */
public class UploadAttachmentAction extends ActionSupport implements ServletRequestAware{
    private File file;
    private String fileFileName;
    private String id, name;
    private static final String SUCCESS = "success";
    private HttpServletRequest servletRequest;
    
    public UploadAttachmentAction() {
    }
    
    public String execute() throws Exception {
        String filePath = servletRequest.getSession().getServletContext().getRealPath("/").concat("mission");
        filePath = filePath.replace("build\\", "");
        fileFileName = "attachment_" + name + ".txt";
        File report = new File(filePath, fileFileName);
        
        MissionDAO dao = new MissionDAO();
        if(dao.insertAttachment(fileFileName, id)) {
            FileUtils.copyFile(file, report);
        }
        return SUCCESS;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
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
