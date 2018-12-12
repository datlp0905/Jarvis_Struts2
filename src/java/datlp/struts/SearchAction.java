/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.members.MemberDAO;
import datlp.members.MemberDTO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "searchMember")
@Result(name = "success", location = "/admin-member-search.jsp")
public class SearchAction {
    private String searchValue;
    private List<MemberDTO> listMembers;
    private String deleteResult;
    private static final String SUCCESS = "success";
    
    public SearchAction() {
    }
    
    public String execute() throws Exception {
        MemberDAO dao = new MemberDAO();
        listMembers = dao.findByLikeFullname(searchValue);
        if(deleteResult != null) {
            HttpServletRequest request = ServletActionContext.getRequest();
            if(deleteResult.equals("success")) {
                request.setAttribute("delete", "Delete success");
            } else {
                request.setAttribute("delete", "Delete failed because that"
                        + " member is working on another mission. "
                        + "Please wait to the end of the mission.");
            }
        }
        return SUCCESS;
    }

    public String getDeleteResult() {
        return deleteResult;
    }

    public void setDeleteResult(String deleteResult) {
        this.deleteResult = deleteResult;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public List<MemberDTO> getListMembers() {
        return listMembers;
    }
    
}
