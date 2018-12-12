/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.struts;

import datlp.missions.MissionDAO;
import datlp.missions.MissionDTO;
import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author DAT
 */
@Action(value = "loadAllMission")
@Result(name = "success", location = "/admin-mission.jsp")
public class LoadAllMissionAction {
   private List<MissionDTO> listMissions;
   private List<MissionDTO> listMissionsDone;
   private List<MissionDTO> listMissionsFinish;
   private static final String SUCCESS = "success";
   
   public LoadAllMissionAction() {
    }
    
    public String execute() throws Exception {
        MissionDAO dao = new MissionDAO();
        listMissions = dao.loadAllDoing();
        listMissionsDone = dao.loadAllDone();
        listMissionsFinish = dao.loadAllFinish();
        return SUCCESS;
    }

    public List<MissionDTO> getListMissionsDone() {
        return listMissionsDone;
    }

    public List<MissionDTO> getListMissions() {
        return listMissions;
    }

    public List<MissionDTO> getListMissionsFinish() {
        return listMissionsFinish;
    }

    public void setListMissionsFinish(List<MissionDTO> listMissionsFinish) {
        this.listMissionsFinish = listMissionsFinish;
    }
    
}
