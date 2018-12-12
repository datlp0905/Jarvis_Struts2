/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionSupport;
import datlp.members.MemberDAO;
import datlp.members.MemberDTO;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@ExceptionMappings({
    @ExceptionMapping(exception = "java.sql.SQLException", result = "success")
})
@Action(value = "insertMember")
@Result(name = "success", location = "/admin-member-insert.jsp")

public class InsertMemberAction extends ActionSupport {
    private String username, password, firstname, lastname, birthdate, heroname, gender;
    private static final String SUCCESS = "success";
    
    public InsertMemberAction() {
    }
    
    public String execute() throws Exception {
        MemberDAO dao = new MemberDAO();
        MemberDTO dto = new MemberDTO(username, password, firstname, lastname, heroname, gender, birthdate);
        if(dao.insert(dto)) {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("RESULT", "Add " + username + " success!");
        }
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

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getHeroname() {
        return heroname;
    }

    public void setHeroname(String heroname) {
        this.heroname = heroname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    
}
