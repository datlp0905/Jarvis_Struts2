/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionContext;
import datlp.members.MemberDAO;
import datlp.members.MemberDTO;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "viewProfile")
@Result(name = "success", location = "/member-profile.jsp")
public class ViewMemberProfileAction {
    private MemberDTO dto;
    private static final String SUCCESS = "success";
    
    public ViewMemberProfileAction() {
    }
    
    public String execute() throws Exception {
        MemberDAO dao = new MemberDAO();
        Map session = ActionContext.getContext().getSession();
        String username = (String) session.get("USERNAME");
        dto = dao.findByLikePrimarykey(username);
        return SUCCESS;
    }

    public MemberDTO getDto() {
        return dto;
    }
    
}
