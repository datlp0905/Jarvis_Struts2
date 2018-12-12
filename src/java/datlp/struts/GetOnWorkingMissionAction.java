/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import com.opensymphony.xwork2.ActionContext;
import datlp.members.MemberDAO;
import datlp.missions.MissionDTO;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "getOnWorkingMission")
@Result(name = "success", location = "/member-index.jsp")
public class GetOnWorkingMissionAction {
    private MissionDTO mission;
    
    private static final String SUCCESS = "success";
    
    public GetOnWorkingMissionAction() {
    }
    
    public String execute() throws Exception {
        MemberDAO dao = new MemberDAO();
        Map session = ActionContext.getContext().getSession();
        String username = (String) session.get("USERNAME");
        mission = dao.getOnWorkingMission(username);
        return SUCCESS;
    }

    public MissionDTO getMission() {
        return mission;
    }
    
}
