/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import datlp.members.MemberDAO;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 *
 * @author DAT
 */
@Action(value = "changePass")
@Results({
    @Result(name = "admin", location = "/admin-changepass.jsp"),
    @Result(name = "member", location = "/member-changepass.jsp"),
})
public class ChangePasswordAction extends ActionSupport {

    private String newpassword, oldpassword, confirm;
    private String username;
    private static final String ADMIN = "admin";
    private static final String MEMBER = "member";

    public ChangePasswordAction() {
    }

    public String execute() throws Exception {
        String url = MEMBER;
        MemberDAO dao = new MemberDAO();
        HttpServletRequest request = ServletActionContext.getRequest();
        Map session = ActionContext.getContext().getSession();
        String role = (String) session.get("ROLE");
        if (dao.checkPassword(username, oldpassword)) {
            if (dao.changePassword(username, newpassword)) {
                request.setAttribute("SUCCESS", "Change password success!");
            }
        } else {
            request.setAttribute("ERROR", "Wrong old password. Please input again!");
        }
        if (role.equals("Admin")) {
            url = ADMIN;
        }
        return url;
    }

    public String getOldpassword() {
        return oldpassword;
    }

    public void setOldpassword(String oldpassword) {
        this.oldpassword = oldpassword;
    }

    public String getNewpassword() {
        return newpassword;
    }

    public void setNewpassword(String newpassword) {
        this.newpassword = newpassword;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
