/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionSupport;
import datlp.members.MemberDAO;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author DAT
 */
@ExceptionMappings({
    @ExceptionMapping(exception = "java.sql.SQLException", result = "input")
})
@Action(value = "login")
@Results({
    @Result(name = "admin", type = "redirectAction",
            params = {
                "actionName", "loadAdminIndex"
            }),
    @Result(name = "member", type = "redirectAction",
            params = {
                "actionName", "getOnWorkingMission",
                "username", "${username}"
            }),
    @Result(name = "input", location = "/login.jsp")
})
public class LoginAction extends ActionSupport implements SessionAware{
    private String username, password;
    private SessionMap<String,String> session;
    private static final String ADMIN = "admin";
    private static final String MEMBER = "member";
    private static final String INPUT = "input";
    
    public LoginAction() {
    }
    
    public String execute() throws Exception {
        String url = INPUT;
        MemberDAO dao = new MemberDAO();
        String role = dao.checkLogin(username, password);
        if(!role.equals("failed")) {
            String firstname = dao.getFirstname(username);
            session.put("FIRSTNAME", firstname);
            session.put("USERNAME", username);
            session.put("ROLE", role);
            if(role.equals("Admin")) {
                url = ADMIN;
            } else if(role.equals("Member")) {
                url = MEMBER;
            }
        } else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("INVALID", "Invalid username or password!");
        }
        return url;
    }

    @Action(value = "logout")
    public String logout() {
        session.invalidate();
        return INPUT;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public void setSession(Map map) {
        session = (SessionMap<String, String>) map;
    }
    
}
