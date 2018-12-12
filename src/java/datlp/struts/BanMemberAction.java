/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.members.MemberDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 *
 * @author DAT
 */
@Action(value = "banMember")
@Results({
    @Result(name = "search", type = "redirectAction",
            params = {
                "actionName", "searchMember",
                "searchValue", "${searchValue}",
                "deleteResult", "${deleteResult}"
            }),
    @Result(name = "loadall", type = "redirectAction",
            params = {
                "actionName", "loadAllMember"
            })
})
public class BanMemberAction {
    private String username;
    private String action;
    private String searchValue;
    private String deleteResult;
    private static final String SEARCH = "search";
    private static final String LOADALL = "loadall";
    
    public BanMemberAction() {
    }
    
    public String execute() throws Exception {
        String url = SEARCH;
        MemberDAO dao = new MemberDAO();
        
        if(!dao.isWorking(username)) {
            if(dao.ban(username)) {
                deleteResult = "success";
            }
        } else {
            deleteResult = "failed";
        }
        if(action.equals("loadAll")) {
            url = LOADALL;
        }
        return url;
    }

    public String getDeleteResult() {
        return deleteResult;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }
    
}
