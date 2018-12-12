/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.missions.MissionDAO;
import java.util.Calendar;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "submitMission")
@Result(name = "success", type = "redirectAction",
        params = {
            "actionName", "getOnWorkingMission",
            "username", "${username}"
        })
public class SubmitMissionAction {
    private String id;
    private String username;
    private static final String SUCCESS = "success";
    
    public SubmitMissionAction() {
    }
    
    public String execute() throws Exception {
        MissionDAO dao = new MissionDAO();
        if(dao.submitMission(id)) {
            String submitTime = Calendar.getInstance().get(Calendar.DAY_OF_MONTH) + "-" +
                    (Calendar.getInstance().get(Calendar.MONTH) + 1) + "-" +
                    Calendar.getInstance().get(Calendar.YEAR) + " " +
                    Calendar.getInstance().get(Calendar.HOUR_OF_DAY) + ":" +
                    Calendar.getInstance().get(Calendar.MINUTE);
            dao.setSubmitTime(id, submitTime);
        }
        
        return SUCCESS;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    
}
