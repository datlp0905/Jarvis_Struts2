/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.members.MemberDAO;
import datlp.members.MemberDTO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "updateMember")
@Result(name = "success", type = "redirectAction",
        params = {
            "actionName", "viewMemberDetail",
            "username", "${username}",
            "action", "update"
        })
public class UpdateMemberAction {
    private String username, firstname, lastname, birthdate, heroname, gender;
    private static final String SUCCESS = "success";
    
    public UpdateMemberAction() {
    }
    
    public String execute() throws Exception {
        MemberDAO dao = new MemberDAO();
        MemberDTO dto = new MemberDTO(username, firstname, lastname, heroname, gender, null, birthdate, null, null);
        dao.update(dto);
        return SUCCESS;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
