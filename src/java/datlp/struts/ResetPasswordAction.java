/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.members.MemberDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "resetPassword")
@Result(name = "success", type = "redirectAction",
        params = {"actionName","viewMemberDetail",
            "username","${username}",
            "action", "view"
        })
public class ResetPasswordAction {
    private String username, password;
    private static final String SUCCESS = "success";
    
    public ResetPasswordAction() {
    }
    
    public String execute() throws Exception {
        MemberDAO dao = new MemberDAO();
        dao.resetPassword(username, password);
        return SUCCESS;
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
    
}
