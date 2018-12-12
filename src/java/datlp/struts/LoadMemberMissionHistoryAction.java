/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionContext;
import datlp.missions.MissionDAO;
import datlp.missions.MissionDTO;
import java.util.List;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "loadMissionHistory")
@Result(name = "success", location = "/member-mission.jsp")
public class LoadMemberMissionHistoryAction {
    private List<MissionDTO> listMissions;
    private static final String SUCCESS = "success";
    
    public LoadMemberMissionHistoryAction() {
    }
    
    public String execute() throws Exception {
        MissionDAO dao = new MissionDAO();
        Map session = ActionContext.getContext().getSession();
        String username = (String) session.get("USERNAME");
        listMissions = dao.loadAllByUsername(username);
        return SUCCESS;
    }

    public List<MissionDTO> getListMissions() {
        return listMissions;
    }
    
}
