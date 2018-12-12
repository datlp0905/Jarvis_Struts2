/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.members.MemberDAO;
import datlp.members.MemberDTO;
import java.util.StringTokenizer;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 *
 * @author DAT
 */
@Action(value = "viewMemberDetail")
@Results({
    @Result(name = "view", location = "/admin-member-detail.jsp"),
    @Result(name = "update", location = "/admin-member-update.jsp")
})
public class ViewMemberDetailAction {
    private String username;
    private MemberDTO dto;
    private String action, day, month, year;
    private String searchValue;
    private boolean isWorking;
    private static final String VIEW = "view";
    private static final String UPDATE = "update";
    
    public ViewMemberDetailAction() {
    }
    
    public String execute() throws Exception {
        String url = VIEW;
        MemberDAO dao = new MemberDAO();
        dto = dao.findByLikePrimarykey(username);
        if(dto != null) {
            StringTokenizer stk = new StringTokenizer(dto.getBirthdate(), "-");
            year = stk.nextToken(); month = stk.nextToken(); day = stk.nextToken();
            isWorking = dao.isWorking(username);
        }  
        if(action.equals("update")) {
            url = UPDATE;
        }
        return url;
    }

    public boolean isIsWorking() {
        return isWorking;
    }

    public String getDay() {
        return day;
    }

    public String getMonth() {
        return month;
    }

    public String getYear() {
        return year;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    
    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public MemberDTO getDto() {
        return dto;
    }
    
}
