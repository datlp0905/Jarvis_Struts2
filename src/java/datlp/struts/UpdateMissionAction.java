/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.missions.MissionDAO;
import datlp.missions.MissionDTO;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "updateMission")
@Result(name = "success", type = "redirectAction",
        params = {
            "actionName", "viewMissionDetail",
            "id", "${id}",
            "action", "update"
})

public class UpdateMissionAction {
    private String day, month, year;
    private String id, name, description, place, endTime;
    private MissionDTO missionDTO;
    private static final String SUCCESS = "success";

    public UpdateMissionAction() {
    }

    public String execute() throws Exception {
        MissionDAO dao = new MissionDAO();
        StringTokenizer stk = new StringTokenizer(endTime, "-");
        String year = stk.nextToken();
        String month = stk.nextToken();
        String day = stk.nextToken();
        endTime = day + "-" + month + "-" + year;
        missionDTO = new MissionDTO(id, name, description, place, null, endTime, null);
        if(dao.update(missionDTO)) {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("UPDATE", "Update success!");
        }
        return SUCCESS;
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

    public MissionDTO getMissionDTO() {
        return missionDTO;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

}
