/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.missions.MissionDAO;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "insertMemberMission")
@Result(name = "success", type = "redirectAction",
        params = {
            "actionName", "viewMissionDetail",
            "id", "${id}",
            "action", "edit"
        })
public class InsertMemberMissionAction {
    private String id, username;
    private static final String SUCCESS = "success";
    
    public InsertMemberMissionAction() {
    }
    
    public String execute() throws Exception {
        MissionDAO dao = new MissionDAO();
        dao.addMemberToMission(username, id);
        return SUCCESS;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
