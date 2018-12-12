/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.members.MemberDAO;
import datlp.members.MemberDTO;
import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "loadAllMember")
@Result(name = "success", location = "/admin-member.jsp")
public class LoadAllMemberAction {
    private static final String SUCCESS = "success";
    private List<MemberDTO> listMembers;
    
    public LoadAllMemberAction() {
    }
    
    public String execute() throws Exception {
        MemberDAO dao = new MemberDAO();
        listMembers = dao.getAll();
        return SUCCESS;
    }

    public List<MemberDTO> getListMembers() {
        return listMembers;
    }
    
}
