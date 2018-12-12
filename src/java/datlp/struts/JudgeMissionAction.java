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
@Action(value = "judgeMission")
@Result(name = "success", type = "redirectAction",
        params = {
            "actionName", "viewMissionDetail",
            "id", "${id}",
            "action", "view"
        })
public class JudgeMissionAction {
    private String id;
    private String result;
    private static final String SUCCESS = "success";
    
    public JudgeMissionAction() {
    }
    
    public String execute() throws Exception {
        MissionDAO dao = new MissionDAO();
        dao.judgeMission(result, id);
        return SUCCESS;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
    
}
