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
@Action(value = "searchMission")
@Result(name = "success", location = "/admin-mission-search.jsp")

public class SearchMissionAction {
    private String searchValue;
    private List<MissionDTO> listMissions;
    private static final String SUCCESS = "success";
    
    public SearchMissionAction() {
    }
    
    public String execute() throws Exception {
        MissionDAO dao = new MissionDAO();
        listMissions = dao.searchByLikeName(searchValue);
        return SUCCESS;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public List<MissionDTO> getListMissions() {
        return listMissions;
    }
    
}
