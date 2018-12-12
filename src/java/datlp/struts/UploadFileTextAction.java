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
public class UploadFileTextAction extends ActionSupport implements ServletRequestAware{
    private File file;
    private String fileContentType;
    private String fileFileName;
    private String id, username;
    private static final String SUCCESS = "success";
    private HttpServletRequest servletRequest;
    
    public UploadFileTextAction() {
    }
    
    public String execute() throws Exception {
        String filePath = servletRequest.getSession().getServletContext().getRealPath("/").concat("mission");
        filePath = filePath.replace("build\\", "");
        fileFileName = "report_" + id + "_" + username + ".txt";
        File report = new File(filePath, fileFileName);
        
        MissionDAO dao = new MissionDAO();
        if(dao.insertReport(fileFileName, id)) {
            FileUtils.copyFile(file, report);
        }
        return SUCCESS;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public HttpServletRequest getServletRequest() {
        return servletRequest;
    }

    @Override
    public void setServletRequest(HttpServletRequest servletRequest) {
        this.servletRequest = servletRequest;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
